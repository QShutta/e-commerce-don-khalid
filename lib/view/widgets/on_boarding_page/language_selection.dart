import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Positioned(
              //   child: ClipPath(
              //     clipper: RPSCustomClipper(),
              //     child: Container(height: 300, color: Colors.blue),
              //   ),
              // ),
              Positioned(
                top: 150,
                left: 20,
                child: Image.asset(
                  "assets/images/onboarding/lang.png",
                  width: 300,
                  height: 300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 200),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              "CHOOSE YOUR LANGUAGE",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 20),

          InkWell(
            onTap: () {},
            child: Text(
              "English",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {},
            child: Text(
              "Arabic",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class RPSCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.0740000);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.0720000);
    path_0.quadraticBezierTo(
      size.width * 0.4887500,
      size.height * 0.3775000,
      size.width * 0.5600000,
      size.height * 0.4980000,
    );
    path_0.quadraticBezierTo(
      size.width * 0.6400000,
      size.height * 0.6355000,
      size.width * 0.9975000,
      size.height * 0.7560000,
    );
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
