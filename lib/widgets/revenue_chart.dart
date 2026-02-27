import 'dart:math';
import 'package:flutter/material.dart';

/// Fully responsive + interactive:
/// - Keeps aspect ratio (so it looks the same on phones/tablets/web)
/// - Tap/drag anywhere on chart to move the selected point
/// - Tooltip auto-repositions to stay inside bounds
class SmoothLineChartInteractive extends StatefulWidget {
  const SmoothLineChartInteractive({
    super.key,
    required this.values,
    required this.xLabels,
    this.initialSelectedIndex = 0,
    required this.valueLabelBuilder,
    required this.lineColor,
    required this.tooltipColor,
  });

  final List<double> values;
  final List<String> xLabels;
  final int initialSelectedIndex;
  final String Function(int index, double value) valueLabelBuilder;
  final Color lineColor;
  final Color tooltipColor;

  @override
  State<SmoothLineChartInteractive> createState() => _SmoothLineChartInteractiveState();
}

class _SmoothLineChartInteractiveState extends State<SmoothLineChartInteractive> {
  late int selectedIndex;

  // Match painter layout values (keep in sync)
  static const double _topPadding = 50;
  static const double _bottomPadding = 50;
  static const double _sidePadding = 14;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex.clamp(0, widget.values.length - 1);
  }

  void _updateSelection(Offset localPos, Size size) {
    final chartRect = Rect.fromLTWH(
      _sidePadding,
      _topPadding,
      size.width - _sidePadding * 2,
      size.height - _topPadding - _bottomPadding,
    );

    // Only react if within the chart area (with a small tolerance)
    if (!chartRect.inflate(16).contains(localPos)) return;

    final dx = chartRect.width / (widget.values.length - 1);
    final raw = (localPos.dx - chartRect.left) / dx;
    final idx = raw.round().clamp(0, widget.values.length - 1);

    if (idx != selectedIndex) {
      setState(() => selectedIndex = idx);
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.values.length == widget.xLabels.length);

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (d) => _updateSelection(d.localPosition, size),
          onPanStart: (d) => _updateSelection(d.localPosition, size),
          onPanUpdate: (d) => _updateSelection(d.localPosition, size),
          child: CustomPaint(
            size: size,
            painter: _SmoothLineChartPainter(
              values: widget.values,
              xLabels: widget.xLabels,
              selectedIndex: selectedIndex,
              selectedValueLabel: widget.valueLabelBuilder(
                selectedIndex,
                widget.values[selectedIndex],
              ),
              lineColor: widget.lineColor,
              tooltipColor: widget.tooltipColor,
              textScaleFactor: MediaQuery.textScaleFactorOf(context),
            ),
          ),
        );
      },
    );
  }
}

class _SmoothLineChartPainter extends CustomPainter {
  _SmoothLineChartPainter({
    required this.values,
    required this.xLabels,
    required this.selectedIndex,
    required this.selectedValueLabel,
    required this.lineColor,
    required this.tooltipColor,
    required this.textScaleFactor,
  });

  final List<double> values;
  final List<String> xLabels;
  final int selectedIndex;
  final String selectedValueLabel;
  final Color lineColor;
  final Color tooltipColor;
  final double textScaleFactor;

  static const double _topPadding = 30;
  static const double _bottomPadding = 50;
  static const double _sidePadding = 14;

  @override
  void paint(Canvas canvas, Size size) {
    final chartRect = Rect.fromLTWH(
      _sidePadding,
      _topPadding,
      size.width - _sidePadding * 2,
      size.height - _topPadding - _bottomPadding,
    );

    // Range
    final minV = values.reduce(min);
    final maxV = values.reduce(max);
    final range = (maxV - minV).abs() < 0.0001 ? 1.0 : (maxV - minV);

    // Points
    final dx = chartRect.width / (values.length - 1);
    final pts = <Offset>[];
    for (int i = 0; i < values.length; i++) {
      final t = (values[i] - minV) / range; // 0..1
      final x = chartRect.left + dx * i;
      final y = chartRect.bottom - (t * chartRect.height);
      pts.add(Offset(x, y));
    }

    // Smooth path
    final linePath = _catmullRomToBezierPath(pts);

    // Fill under curve
    final fillPath = Path.from(linePath)
      ..lineTo(pts.last.dx, chartRect.bottom)
      ..lineTo(pts.first.dx, chartRect.bottom)
      ..close();

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          lineColor.withOpacity(0.18),
          lineColor.withOpacity(0.00),
        ],
      ).createShader(chartRect);
    canvas.drawPath(fillPath, fillPaint);

    // Line
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = max(3.5, size.shortestSide * 0.012) // responsive thickness
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = lineColor;
    canvas.drawPath(linePath, linePaint);

    // Selected point
    final sel = pts[selectedIndex];

    // Vertical selection line + gradient
    final fadeRect = Rect.fromLTWH(sel.dx - 1, sel.dy, 2, chartRect.bottom - sel.dy);
    final fadePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          lineColor.withOpacity(0.35),
          lineColor.withOpacity(0.00),
        ],
      ).createShader(fadeRect);
    canvas.drawRect(fadeRect, fadePaint);

    final vLinePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = max(1.5, size.shortestSide * 0.004)
      ..color = lineColor.withOpacity(0.35);
    canvas.drawLine(Offset(sel.dx, sel.dy), Offset(sel.dx, chartRect.bottom), vLinePaint);

    // Ring sizes responsive
    final outerR = max(10.0, size.shortestSide * 0.03);
    final innerR = outerR * 0.55;

    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = max(4.0, size.shortestSide * 0.01)
      ..color = lineColor;
    canvas.drawCircle(sel, outerR, ringPaint);

    final innerPaint = Paint()..color = Colors.white;
    canvas.drawCircle(sel, innerR, innerPaint);

    // Tooltip
    _drawTooltip(canvas, size, anchor: sel);

    // X labels
    _drawXLabels(canvas, size, chartRect, pts);
  }

  void _drawTooltip(Canvas canvas, Size size, {required Offset anchor}) {
    // Make tooltip scale with width (responsive)
    final bubbleW = (size.width * 0.22).clamp(120.0, 180.0);
    final bubbleH = (size.height * 0.18).clamp(48.0, 70.0);
    final radius = (bubbleH * 0.22).clamp(10.0, 16.0);

    final notchW = (bubbleW * 0.12).clamp(14.0, 22.0);
    final notchH = (bubbleH * 0.18).clamp(8.0, 12.0);

    // keep within bounds
    double left = anchor.dx - bubbleW / 2;
    left = left.clamp(8.0, size.width - bubbleW - 8.0);
    final top = max(6.0, anchor.dy - bubbleH - (size.height * 0.08));

    final bubbleRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, bubbleW, bubbleH),
      Radius.circular(radius),
    );

    final path = Path()..addRRect(bubbleRect);

    final notchCenterX = anchor.dx.clamp(left + 24.0, left + bubbleW - 24.0);
    final notchTopY = top + bubbleH;
    path.moveTo(notchCenterX - notchW / 2, notchTopY);
    path.lineTo(notchCenterX, notchTopY + notchH);
    path.lineTo(notchCenterX + notchW / 2, notchTopY);
    path.close();

    final bubblePaint = Paint()..color = tooltipColor;
    canvas.drawShadow(path, Colors.black.withOpacity(0.25), 10, true);
    canvas.drawPath(path, bubblePaint);

    final fontSize = (bubbleH * 0.48).clamp(18.0, 30.0) * textScaleFactor;

    final tp = TextPainter(
      text: TextSpan(
        text: selectedValueLabel,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.2,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: bubbleW);

    tp.paint(
      canvas,
      Offset(left + (bubbleW - tp.width) / 2, top + (bubbleH - tp.height) / 2),
    );
  }

  void _drawXLabels(Canvas canvas, Size size, Rect chartRect, List<Offset> pts) {
    final fontSize = (size.width * 0.022).clamp(11.0, 16.0) * textScaleFactor;

    final labelStyle = TextStyle(
      color: const Color(0xFF9A9AA8),
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.6,
    );

    for (int i = 0; i < xLabels.length; i++) {
      final tp = TextPainter(
        text: TextSpan(text: xLabels[i], style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final x = pts[i].dx - tp.width / 2;
      final y = chartRect.bottom + (size.height * 0.05).clamp(12.0, 20.0);
      tp.paint(canvas, Offset(x, y));
    }
  }

  /// Smooth cubic Bézier path from points
  Path _catmullRomToBezierPath(List<Offset> points) {
    if (points.length < 2) return Path();
    final path = Path()..moveTo(points.first.dx, points.first.dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p0 = i == 0 ? points[i] : points[i - 1];
      final p1 = points[i];
      final p2 = points[i + 1];
      final p3 = (i + 2 < points.length) ? points[i + 2] : points[i + 1];

      final c1 = Offset(
        p1.dx + (p2.dx - p0.dx) / 6,
        p1.dy + (p2.dy - p0.dy) / 6,
      );
      final c2 = Offset(
        p2.dx - (p3.dx - p1.dx) / 6,
        p2.dy - (p3.dy - p1.dy) / 6,
      );

      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, p2.dx, p2.dy);
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant _SmoothLineChartPainter oldDelegate) {
    return oldDelegate.values != values ||
        oldDelegate.xLabels != xLabels ||
        oldDelegate.selectedIndex != selectedIndex ||
        oldDelegate.selectedValueLabel != selectedValueLabel ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.tooltipColor != tooltipColor ||
        oldDelegate.textScaleFactor != textScaleFactor;
  }
}