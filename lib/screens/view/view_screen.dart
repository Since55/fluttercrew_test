import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_fluttercrew/widgets/search_icon.dart';

class ViewScreen extends StatelessWidget {
  static const path = '/view';

  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Row(
          children: [
            const Text('Test app'),
            SizedBox(width: 8.w),
            Icon(Icons.arrow_drop_down_sharp, size: 16.sp),
          ],
        ),
        actions: const [SearchIcon()],
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            'View Page',
            style: TextStyle(
              fontSize: 64.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
