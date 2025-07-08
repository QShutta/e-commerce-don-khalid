import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110, // ثبّت ارتفاع السكروول أفقي
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          final titles = [
            '101'.tr,
            '102'.tr,
            '103'.tr,
            '104'.tr,
            '105'.tr,
            '106'.tr,
            '107'.tr,
            '108'.tr,
          ];
          final images = [
            ImageAssets.bannerDonJalabye,
            ImageAssets.bannerDonTop1,
            ImageAssets.bannerDonSdyre,
            ImageAssets.bannerDonPerfume,
            ImageAssets.bannerDonSandale,
            ImageAssets.bannerDonSuite,
            ImageAssets.bannerJazmaDon,
            ImageAssets.bannerMaknaZitFoulDon,
          ];
          return CategoryItem(title: titles[index], imageUrl: images[index]);
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryItem({required this.title, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          // هنا ممكن تضيف وظيفة عند الضغط
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40), // صورة دائرية
              child: Image.asset(
                imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
