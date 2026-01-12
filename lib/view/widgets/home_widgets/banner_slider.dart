import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerSlider extends StatelessWidget {
  BannerSlider({super.key, required productList});
  final HomeControllerImp homeControllerImp = Get.find();

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
        height: 250,
        autoPlay: true,
        //لو عندك مثلا 3 صور جمب بعض الصورة البتكون موجودة في المنتصف بتكون اكبر من الباقي
        enlargeCenterPage: true,

        // كل صورة بتاخد 80% من عرض الشاشة، والباقي 20% بتكون للصور الجانبية اللي بتظهر جزئياً.
        viewportFraction: 0.9,
      ),
      items:
          // هنا بنستخدم دالة
          //map
          // على المصفوفة
          // homeControllerImp.products
          // كل عنصر داخل المصفوفة هو عبارة عن منتج
          //(product)
          //يمثل
          //Map
          // يعني مثلاً:
          //{"product_id": 1, "product_name": "عطر", "product_image": "image1.jpg"}
          // المتغير
          //product
          //داخل
          //map
          //هو متغير مؤقت بيمثل كل عنصر من عناصر المصفوفة
          // وبنستخدمه هنا عشان نطبع صورة كل منتج باستخدام الرابط:
          // AppLinkApi.productsImageLink
          // + اسم صورة المنتج اللي جوه الـ
          // Map
          homeControllerImp.topSellingList.map((product) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLinkApi.productsImageLink}/${product.productImage}",
                fit: BoxFit.fitHeight,
                width: double.infinity,
                placeholder:
                    (context, url) =>
                        Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );
          }).toList(),
    );
  }
}

//I have build this bannerslider to handle the case of that the app is lunched and there is no products
//has been burched yet.so we will display all of the products that we have as top selling products.
class FallBackBannerSlider extends StatelessWidget {
  FallBackBannerSlider({super.key, required productList});
  final HomeControllerImp homeControllerImp = Get.find();

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
        height: 250,
        autoPlay: true,
        //لو عندك مثلا 3 صور جمب بعض الصورة البتكون موجودة في المنتصف بتكون اكبر من الباقي
        enlargeCenterPage: true,

        // كل صورة بتاخد 80% من عرض الشاشة، والباقي 20% بتكون للصور الجانبية اللي بتظهر جزئياً.
        viewportFraction: 0.9,
      ),
      items:
          // هنا بنستخدم دالة
          //map
          // على المصفوفة
          // homeControllerImp.products
          // كل عنصر داخل المصفوفة هو عبارة عن منتج
          //(product)
          //يمثل
          //Map
          // يعني مثلاً:
          //{"product_id": 1, "product_name": "عطر", "product_image": "image1.jpg"}
          // المتغير
          //product
          //داخل
          //map
          //هو متغير مؤقت بيمثل كل عنصر من عناصر المصفوفة
          // وبنستخدمه هنا عشان نطبع صورة كل منتج باستخدام الرابط:
          // AppLinkApi.productsImageLink
          // + اسم صورة المنتج اللي جوه الـ
          // Map
          homeControllerImp.products.map((product) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLinkApi.productsImageLink}/${product.productImage}",
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder:
                    (context, url) =>
                        Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );
          }).toList(),
    );
  }
}
