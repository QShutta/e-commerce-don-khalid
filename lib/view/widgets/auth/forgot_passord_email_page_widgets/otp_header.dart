import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtpHeader extends StatelessWidget {
  final Color? backgroundColor;
  final double height;
  final String? imagePath;
  final double? imageHight;
  final double? imageWidth;
  const OtpHeader({
    super.key,
    required this.imagePath,
    required this.height,
    this.backgroundColor = const Color(0xFF3B5998),
    required this.imageHight,
    required this.imageWidth, // افتراضي لو ما تم تمرير لون
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(color: backgroundColor),
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          SizedBox(
            height: imageHight,
            width: imageWidth,
            child: SvgPicture.asset(imagePath!, height: 100),
          ),
        ],
      ),
    );
  }
}
