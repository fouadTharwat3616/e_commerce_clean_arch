import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AnnouncementsSection extends StatefulWidget {
  const AnnouncementsSection();

  @override
  State<AnnouncementsSection> createState() => _AnnouncementsSectionState();
}

class _AnnouncementsSectionState extends State<AnnouncementsSection> {
  final _sliderImagesPaths = [
    'assets/images/banner_1.png',
    'assets/images/banner_2.png',
    'assets/images/banner_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 0.97,
        ),
        itemBuilder: (_, index, __) => Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            _sliderImagesPaths[index],
            height: 200.h,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        itemCount: _sliderImagesPaths.length,
      ),
    );
  }
}
