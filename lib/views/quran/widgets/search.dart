import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_translation/core/constants/app_assets.dart';
import 'package:quran_translation/core/constants/app_fonts.dart';
import 'package:quran_translation/core/theme/app_colors.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const SearchField({
    Key? key,
    this.controller,
    this.onChanged,
    this.hintText = 'Search...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        // height: 2,
        fontFamily: AppFonts.yekanBakh,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        constraints: const BoxConstraints(minHeight: 35, maxHeight: 35),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(AppAssets.searchIcon),
        ),
        hintText: "${tr("search")} ....",
        maintainHintSize: false,
        hintStyle: TextStyle(
          height: 1,
          fontFamily: AppFonts.yekanBakh,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.border,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 16,
        ),
      ),
    );
  }
}
