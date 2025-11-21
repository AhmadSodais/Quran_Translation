import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_translation/core/constants/app_assets.dart';
import 'package:quran_translation/core/theme/app_colors.dart';
import 'package:quran_translation/view_models/bottom_nav_vm.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavViewModel>(
      builder: (context, vm, child) {
        return Container(
          height: 90,
          padding: EdgeInsets.only(bottom: 12.h, top: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.basic,
                blurRadius: 16,
                spreadRadius: 0,
                offset: Offset(0, 0),
              )
            ]
            // you can add a border radius here if you want rounded corners
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context: context,
                iconPath: AppAssets.homeIcon,
                isSelected: vm.currentIndex == 0,
                onTap: () => vm.setIndex(0),
              ),
              _buildNavItem(
                context: context,
                iconPath: AppAssets.bookIcon,
                isSelected: vm.currentIndex == 1,
                onTap: () => vm.setIndex(1),
              ),
              _buildNavItem(
                context: context,
                iconPath: AppAssets.audioIcon,
                isSelected: vm.currentIndex == 2,
                onTap: () => vm.setIndex(2),
              ),
              _buildNavItem(
                context: context,
                iconPath: AppAssets.settingIcons,
                isSelected: vm.currentIndex == 3,
                onTap: () => vm.setIndex(3),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required String iconPath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 48.w,
        height: 48.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: AnimatedScale(
          scale: isSelected ? 1.15 : 1.12,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.White : Colors.grey,
              BlendMode.srcIn,
            ),
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
    );
  }
}
