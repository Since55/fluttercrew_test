import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Setup extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  const Setup({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, _) {
        return ProviderScope(
          child: builder(context),
        );
      },
    );
  }
}
