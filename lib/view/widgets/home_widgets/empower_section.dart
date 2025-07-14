// import 'dart:math';

// import 'package:e_commerce_halfa/core/constants/image_assets.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class EmpowerSection extends StatelessWidget {
//   const EmpowerSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: Card(
//         child: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               spacing: 5,
//               children: [
//                 SizedBox(height: 8),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(
//                     "200".tr,
//                     style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                       color: Colors.grey,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(
//                     "201".tr,
//                     style: Theme.of(
//                       context,
//                     ).textTheme.bodyLarge!.copyWith(color: Colors.black),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(
//                     "202".tr,
//                     style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                       color: Colors.grey,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 8),
//               ],
//             ),
//             SizedBox(width: 50),
//             Container(
//               margin: EdgeInsets.all(10),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20), // حجم التدوير
//                 child: Image.asset(
//                   ImageAssets.bannerMaknaZitFoulDon,
//                   width: 100,
//                   height: 120,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmpowerSection extends StatelessWidget {
  const EmpowerSection({
    super.key,
    required this.title,
    required this.subTitle,
    required this.body,
  });
  final String title;
  final String subTitle;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // النصوص
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "200".tr,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "201".tr,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: Colors.black),
                    ),
                    SizedBox(height: 6),
                    Text(
                      body,

                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // الصورة
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  ImageAssets.bannerMaknaZitFoulDon,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
