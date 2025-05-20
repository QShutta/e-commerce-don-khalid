import 'package:flutter/material.dart';

class WaveHeader extends StatelessWidget {
  const WaveHeader({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CustomPaint(
          size: Size(width, 250), // الحجم الفعلي هنا
          painter: RPSCustomPainter(),
        ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.8150000, size.height * 0.0800000);
    path.quadraticBezierTo(
      size.width * 0.8262500,
      size.height * 0.2410000,
      size.width * 0.8512500,
      size.height * 0.3060000,
    );
    path.quadraticBezierTo(
      size.width * 0.8825000,
      size.height * 0.3785000,
      size.width,
      size.height * 0.4460000,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 =
        Paint()
          ..color = const Color.fromARGB(255, 255, 255, 255)
          ..style = PaintingStyle.fill
          ..strokeWidth = size.width * 0.00
          ..strokeCap = StrokeCap.butt
          ..strokeJoin = StrokeJoin.miter;

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

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 =
        Paint()
          ..color = const Color.fromARGB(255, 33, 150, 243)
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.00
          ..strokeCap = StrokeCap.butt
          ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
