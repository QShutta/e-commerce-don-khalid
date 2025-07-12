import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TopProducts extends StatelessWidget {
  TopProducts({super.key});
  final List productsImages = [
    ImageAssets.bannerDonJalabye,
    ImageAssets.bannerDonTop1,
    ImageAssets.bannerDonTop2,
    ImageAssets.bannerDonSdyre,
    ImageAssets.bannerDonSandale,
    ImageAssets.bannerDonSuite,
    ImageAssets.bannerDonPerfume,
    ImageAssets.bannerMaknaZitFoulDon,
    ImageAssets.bannerJazmaDon,
  ];
  final List productsNames = [
    "جلاليب الدون",
    "توب الدون",
    "توب الدون",
    "سديري الدون",
    "شبشب الدون",
    "بدلة الدون",
    "عطر الدون",
    "مكنة زيت فول الدون",
    "جزمة الدون",
  ];
  final List productsPrices = [
    "1000",
    "800",
    "900",
    "700",
    "600",
    "1200",
    "1500",
    "500",
    "400",
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productsImages.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: Card(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset(productsImages[index], fit: BoxFit.cover),
                ),
                SizedBox(height: 8.0),
                Text(
                  productsNames[index],
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "\$${productsPrices[index]}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
