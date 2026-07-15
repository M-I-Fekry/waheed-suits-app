import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waheed/views/home/pages/cart/view.dart';
import 'package:waheed/views/home/pages/home/view.dart';
import 'package:waheed/views/home/pages/orders/view.dart';
import 'package:waheed/views/home/pages/profile/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final list = [
    _Model(
      icon: 'home.svg',
      activeIcon: 'home-active.svg',
      title: 'الرئيسية',
      page: const HomePage(),
    ),
    _Model(
      icon: 'box.svg',
      activeIcon: 'box_active.svg',
      title: 'طلباتي',
      page: const OrdersPage(),
    ),
    _Model(
      icon: 'shopping_cart2.svg',
      activeIcon: 'shopping_cart_active.svg',
      title: 'العربة',
      page: const CartPage(),
    ),
    _Model(
      icon: 'profile.svg',
      activeIcon: 'profile_active.svg',
      title: 'حسابي',
      page: const ProfilePage(),
    ),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex].page,
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -4),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.04),
            ),
          ],
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: const Color(0xff000000),
          unselectedItemColor: const Color(0xff9EA1A8),
          selectedLabelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          items: List.generate(
            list.length,
            (index) => BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6.h, top: 8.h),
                child: SvgPicture.asset(
                  'assets/icons/${list[index].icon}',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xff9EA1A8),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 6.h, top: 8.h),
                child: SvgPicture.asset(
                  'assets/icons/${list[index].activeIcon}',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xff000000),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: list[index].title,
            ),
          ),
        ),
      ),
    );
  }
}

class _Model {
  final String icon;
  final String activeIcon;
  final String title;
  final Widget page;

  _Model({
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.page,
  });
}
