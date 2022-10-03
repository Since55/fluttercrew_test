import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_fluttercrew/models/image_model.dart';
import 'package:test_fluttercrew/widgets/button.dart';

class Carousel extends StatefulWidget {
  final List<ImageModel> images;
  final void Function()? onTap;

  const Carousel(this.images, {super.key, this.onTap});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final images = widget.images;
  late final Timer _autoScrollTimer;
  final _controller = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    _autoScrollTimer = Timer.periodic(
      const Duration(seconds: 4),
      (_) => _autoScroll(),
    );
    _controller.addListener(_onUpdate);
    super.initState();
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _controller.dispose();
    _controller.removeListener(_onUpdate);

    super.dispose();
  }

  void _onUpdate() {
    _currentIndex = _getIndex(_controller.page?.toInt() ?? 0);
    setState(() {});
  }

  void _autoScroll() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  int _getIndex(int index) {
    return index % images.length;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: _controller,
          itemBuilder: (context, index) =>
              _ImageCard(images[_getIndex(index)], widget.onTap),
        ),
        _Indicator(
          length: images.length,
          currentIndex: _currentIndex,
        )
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  final int length;
  final int currentIndex;

  const _Indicator({
    super.key,
    required this.length,
    required this.currentIndex,
  });

  Widget _getIndicatorCircle(int index) {
    final selected = index == currentIndex;
    return AnimatedContainer(
      width: 16.sp,
      height: 16.sp,
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? const Color.fromRGBO(94, 138, 80, 1) : Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (index) => _getIndicatorCircle(index),
        ),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final ImageModel image;
  final void Function()? onTap;
  const _ImageCard(this.image, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image.filename),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black87,
              Colors.black.withOpacity(0),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 90.h, left: 31.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                image.title,
                style: TextStyle(
                  fontSize: 64.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Short promotion description goes here',
                style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 48.h),
              Button(
                text: 'View Detail',
                onTap: () => onTap?.call(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
