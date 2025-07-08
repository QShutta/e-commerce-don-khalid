import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  BannerSlider({super.key});
  final List<String> bannerImages = [
    ImageAssets.bannerDonJalabye,
    ImageAssets.bannerDonTop2,
    ImageAssets.bannerDonTop1,

    ImageAssets.bannerDonSdyre,
    ImageAssets.bannerDonPerfume,

    ImageAssets.bannerDonSandale,
    ImageAssets.bannerDonSuite,
    ImageAssets.bannerMaknaZitFoulDon,
    ImageAssets.bannerJazmaDon,
  ];

  @override
  Widget build(BuildContext context) {
    // CarouselSlider
    // هو ويدجت لعرض الصور أو المحتوى في شكل سلايدر (شريط تمرير)
    // لكنه **مش جزء من مكتبة
    //Flutter الأساسية**،
    // ده ويدجت موجود في مكتبة خارجية اسمها
    //'carousel_slider'
    // لازم تستوردها عشان تستخدمه.
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        //لو عندك مثلا 3 صور جمب بعض الصورة البتكون موجودة في المنتصف بتكون اكبر من الباقي
        enlargeCenterPage: true,

        // كل صورة بتاخد 80% من عرض الشاشة، والباقي 20% بتكون للصور الجانبية اللي بتظهر جزئياً.
        viewportFraction: 0.9,
      ),
      items:
          bannerImages.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
    );
  }
}
