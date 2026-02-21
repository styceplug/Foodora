import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpInput extends StatefulWidget {
  final int length;
  final double boxSize;
  final Function(String)? onCompleted;

  const OtpInput({
    super.key,
    this.length = 4,
    this.boxSize = 50,
    this.onCompleted,
  });

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> with CodeAutoFill {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.length, (_) => TextEditingController());
    focusNodes = List.generate(widget.length, (_) => FocusNode());
    listenForCode(); // sms_autofill start
  }

  @override
  void dispose() {
    cancel(); // sms_autofill cleanup
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  void codeUpdated() {
    // Automatically fills the fields when an SMS is received
    if (code != null && code!.length >= widget.length) {
      for (int i = 0; i < widget.length; i++) {
        controllers[i].text = code![i];
      }
      widget.onCompleted?.call(code!.substring(0, widget.length));
    }
  }

  void _onChanged(String value, int index) {
    // 1. Handle Pasting (if user pastes a code like "1234" into one box)
    if (value.length > 1) {
      _handlePaste(value);
      return;
    }

    // 2. Move Focus Forward
    if (value.isNotEmpty && index < widget.length - 1) {
      focusNodes[index + 1].requestFocus();
    }

    // 3. Check if complete
    final currentOtp = controllers.map((c) => c.text).join();
    if (currentOtp.length == widget.length) {
      widget.onCompleted?.call(currentOtp);
    }
  }

  void _handlePaste(String str) {
    final cleanStr = str.trim();
    for (int i = 0; i < widget.length; i++) {
      if (i < cleanStr.length) {
        controllers[i].text = cleanStr[i];
      }
    }
    // Finalize focus and callback
    focusNodes.last.requestFocus();
    widget.onCompleted?.call(cleanStr.substring(0, widget.length));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: widget.boxSize,
          height: widget.boxSize,
          child: CallbackShortcuts(
            bindings: {
              const SingleActivator(LogicalKeyboardKey.backspace): () {
                // Handle Backspace when field is already empty
                if (controllers[index].text.isEmpty && index > 0) {
                  focusNodes[index - 1].requestFocus();
                }
              },
            },
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              maxLength: widget.length, // Allows pasting, but we UI-limit via decoration
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                counterText: '', // Hides the character count
                // If text exists, show it; if not, keep box styled
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) => _onChanged(value, index),
            ),
          ),
        );
      }),
    );
  }
}