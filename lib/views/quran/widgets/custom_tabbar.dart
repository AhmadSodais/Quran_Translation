import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_translation/core/theme/app_colors.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // You can adjust number of tabs or tab list here
  final List<Widget> tabbarList = const [
    Tab(text: 'عثمانی'),
    Tab(text: 'نزولی'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabbarList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    print(index);
    // You can fill out your onTap logic here
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.symmetric(horizontal: 2.w),
      height: 30.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: TabBar(
        controller: _tabController,
        onTap: onTap,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: _tabController.index == 1 ? Radius.circular(6.r) : Radius.zero,
            topLeft: _tabController.index == 1 ? Radius.circular(6.r) : Radius.zero,
            topRight: _tabController.index == 0 ? Radius.circular(6.r) : Radius.zero,
            bottomRight: _tabController.index == 0 ? Radius.circular(6.r) : Radius.zero,
            
          ),
          color: AppColors.primary
        ),
        // padding: EdgeInsets.only(top: 2, bottom: 2),
        tabs: tabbarList,
      ),
    );
  }
}
