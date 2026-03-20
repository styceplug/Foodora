import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodora/utils/colors.dart';
import 'package:foodora/utils/dimensions.dart';
import 'package:foodora/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../routes/routes.dart';
import '../../../utils/app_constants.dart';
import '../../../widgets/side_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String get timeOfTheDay {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) return "Morning";
    if (hour >= 12 && hour < 17) return "Afternoon";
    if (hour >= 17 && hour < 21) return "Evening";
    return "Night";
  }

  final PageController _pageController = PageController();
  final List<String> banners = ['banner1', 'banner2', 'banner3'];
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        if (_currentPage < banners.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutQuart,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: HomeDrawer(),
      appBar: CustomAppbar(
        leadingIcon: InkWell(
          onTap: (){
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width5,
              vertical: Dimensions.height5,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey1,
            ),
            child: Icon(Iconsax.menu_board),
          ),
        ),
        customTitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DELIVER TO',
              style: TextStyle(
                fontSize: Dimensions.font12,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: Dimensions.height5),
            Row(
              children: [
                Text(
                  'Home Office',
                  style: TextStyle(
                    fontSize: Dimensions.font15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.accentColor,
                  ),
                ),
                SizedBox(width: Dimensions.width5 / 2),
                Icon(Icons.arrow_drop_down, size: Dimensions.iconSize16),
              ],
            ),
          ],
        ),
        actionIcon: InkWell(
          onTap: (){
            Get.toNamed(AppRoutes.cartScreen);
          },
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10,
                  vertical: Dimensions.height10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF181C2E),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Iconsax.shopping_bag,
                  color: AppColors.white,
                  size: Dimensions.iconSize20,
                ),
              ),
              Positioned(
                right: 0,
                top: -2,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width5,
                    vertical: Dimensions.height5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: Dimensions.font12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20,
              vertical: Dimensions.height20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey Vincent,',
                  style: TextStyle(
                    fontSize: Dimensions.font15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Good ${timeOfTheDay}!',
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Dimensions.height20),
          
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.searchScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width15,
                      vertical: Dimensions.height10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.accentColor.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    child: Row(
                      children: [
                        Icon(Iconsax.global_search),
                        SizedBox(width: Dimensions.width10),
                        Text(
                          'Search for restaurants, meals, and more...',
                          style: TextStyle(color: AppColors.grey4),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height20),
                SizedBox(
                  height: Dimensions.height20 * 8,
                  width: Dimensions.screenWidth,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: banners.length,
                    onPageChanged: (index) {
                      _currentPage = index;
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius10),
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                              AppConstants.getPngAsset(banners[index]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: Dimensions.height5),
                ListenableBuilder(
                  listenable: _pageController,
                  builder: (context, child) {
                    int activeDot =
                        _pageController.hasClients
                            ? _pageController.page?.round() ?? 0
                            : 0;
          
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(banners.length, (index) {
                        bool isActive = activeDot == index;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.only(right: Dimensions.width5),
                          height: Dimensions.height10 * 0.7,
                          width:
                              isActive
                                  ? Dimensions.width20 * 1.2
                                  : Dimensions.width10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius20,
                            ),
                            color:
                                isActive
                                    ? AppColors.accentColor
                                    : AppColors.accentColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    );
                  },
                ),
                SizedBox(height: Dimensions.height20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Categories',
                      style: TextStyle(
                        fontSize: Dimensions.font18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: Dimensions.font18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height20),
                Row(
                  children: [
                    Container(
                      height: Dimensions.height50,
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10,
                        vertical: Dimensions.height5,
                      ),
                      decoration: BoxDecoration(
                        /*gradient: RadialGradient(
                          colors: [
                            Color(0xFF32343E),
                            Color(0xFFFFD27C),
                            Color(0xFFFFFFFF),
                          ],
                          stops: [
                            0.0,
                            0.1,
                            1.0
                          ]
                        ),*/
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius30),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: Dimensions.height30,
                            width: Dimensions.width30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              image: DecorationImage(
                                image: AssetImage(AppConstants.getPngAsset('all')),
                              ),
                            ),
                          ),
                          SizedBox(width: Dimensions.width10),
                          Text(
                            'All',
                            style: TextStyle(
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: Dimensions.width20),
                    Container(
                      height: Dimensions.height50,
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10,
                        vertical: Dimensions.height5,
                      ),
                      decoration: BoxDecoration(
                        /*gradient: RadialGradient(
                          colors: [
                            Color(0xFF32343E),
                            Color(0xFFFFD27C),
                            Color(0xFFFFFFFF),
                          ],
                          stops: [
                            0.0,
                            0.1,
                            1.0
                          ]
                        ),*/
                        color: AppColors.white,
                        border: Border.all(color: AppColors.accentColor),
                        borderRadius: BorderRadius.circular(Dimensions.radius30),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: Dimensions.height30,
                            width: Dimensions.width30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              image: DecorationImage(
                                image: AssetImage(AppConstants.getPngAsset('meal')),
                              ),
                            ),
                          ),
                          SizedBox(width: Dimensions.width10),
                          Text(
                            'Meals',
                            style: TextStyle(
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
          
                    SizedBox(width: Dimensions.width20),
                    Container(
                      height: Dimensions.height50,
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10,
                        vertical: Dimensions.height5,
                      ),
                      decoration: BoxDecoration(
                        /*gradient: RadialGradient(
                          colors: [
                            Color(0xFF32343E),
                            Color(0xFFFFD27C),
                            Color(0xFFFFFFFF),
                          ],
                          stops: [
                            0.0,
                            0.1,
                            1.0
                          ]
                        ),*/
                        color: AppColors.white,
                        border: Border.all(color: AppColors.accentColor),
                        borderRadius: BorderRadius.circular(Dimensions.radius30),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: Dimensions.height30,
                            width: Dimensions.width30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  AppConstants.getPngAsset('snacks'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: Dimensions.width10),
                          Text(
                            'Snacks',
                            style: TextStyle(
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height20),
                Text(
                  'Open Restaurants',
                  style: TextStyle(
                    fontSize: Dimensions.font18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: Dimensions.height20),
                InkWell(
                  onTap: (){
                    Get.toNamed(AppRoutes.restaurantDetailsScreen);
                  },
                  child: Container(
                    width: Dimensions.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                      vertical: Dimensions.height10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Dimensions.height100 * 1.2,
                          width: Dimensions.screenWidth,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height20,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.accentColor.withOpacity(0.2),
                              ),
                            ),
                          ),
                          child: Image.asset(AppConstants.getPngAsset('vicolas')),
                        ),
                        SizedBox(height: Dimensions.height5),
                        Text(
                          'Vicolas Eatery',
                          style: TextStyle(
                            fontSize: Dimensions.font20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: Dimensions.height5),
                        Text(
                          'Food - Drinks - Proteins - Snack ',
                          style: TextStyle(
                            fontSize: Dimensions.font15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: Dimensions.height5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Iconsax.star,
                                  size: Dimensions.iconSize16,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(width: Dimensions.width5),
                                Text('5.0'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.truck,
                                  size: Dimensions.iconSize16,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(width: Dimensions.width5),
                                Text('Free'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.clock,
                                  size: Dimensions.iconSize16,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(width: Dimensions.width5),
                                Text('20 mins'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
