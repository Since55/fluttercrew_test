import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_fluttercrew/core/app_theme.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: Icon(
        Icons.search,
        size: 24.sp,
        color: AppTheme.colors.activeColor,
      ),
    );
  }
}
