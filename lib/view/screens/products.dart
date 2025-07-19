import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Catogeries> catgoeries = Get.arguments["catogeries"];
    int selectedCat = Get.arguments["selecedCatogery"];
    return Scaffold(
      appBar: DonAppBar(
        title: 'Products',
        onNotificationIconButtonClicked: () {},
        onChangeWhenSearh: (String) {},
      ),
      body: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("How are you")],
        ),
      ),

      //  Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     // Text("Products Pages"),
      //     // ElevatedButton(
      //     //   onPressed: () {
      //     //     print("-------------------------------------------");
      //     //     // السطر الجاي بيحول كل عنصر داخل قائمة
      //     //     //catogeries
      //     //     //إلى
      //     //     //Map
      //     //     // باستخدام
      //     //     // toJson()
      //     //     // لأن الكائن من نوع
      //     //     //Catogeries
      //     //     // ما بيظهر تفاصيله لو عملنا له
      //     //     //print
      //     //     // مباشرة
      //     //     //(بيظهر فقط Instance of 'Catogeries')
      //     //     // فـ toJson()
      //     //     //بتحول الكائن إلى شكل قابل للطباعة
      //     //     //(مثل: {"catogeries_id": 1, "catogeries_name_ar": "جلاليب"})
      //     //     // وبعد ما نحولهم كلهم، بنرجعهم كـ
      //     //     //List
      //     //     // باستخدام toList()
      //     //     print(catgoeries.map((e) => e.toJson()).toList());

      //     //     print("\n");
      //     //     print("and the selected item is:$selectedCat");
      //     //     print("-------------------------------------");
      //     //   },
      //     //   child: Text("Print"),
      //     // ),
      //   ],
      // ),
    );
  }
}
