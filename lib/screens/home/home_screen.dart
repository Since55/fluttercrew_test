import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_fluttercrew/models/image_model.dart';
import 'package:test_fluttercrew/screens/home/images_provider.dart';
import 'package:test_fluttercrew/screens/view/view_screen.dart';
import 'package:test_fluttercrew/widgets/carousel.dart';
import 'package:test_fluttercrew/widgets/search_icon.dart';

class HomeScreen extends ConsumerWidget {
  static const String path = '/';

  const HomeScreen({super.key});

  Widget _buildContent(BuildContext context, List<ImageModel> images) {
    return Carousel(
      images,
      onTap: () => context.go(ViewScreen.path),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(imagesProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Icon(Icons.shopping_bag_outlined, size: 16.sp),
            SizedBox(width: 12.w),
            const Text('Test app'),
            SizedBox(width: 8.w),
            Icon(Icons.arrow_drop_down_sharp, size: 16.sp),
          ],
        ),
        actions: const [SearchIcon()],
      ),
      body: Center(
        child: images.when(
          data: (images) => _buildContent(context, images),
          error: (_, __) => Text('Error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
