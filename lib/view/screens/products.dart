import 'package:e_commerce_halfa/controller/products_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/don_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/proudcts_page_widgets/products_catogeries_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});
  //Before of 69
  final ProductsControllerImp productsController = Get.put(
    ProductsControllerImp(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DonAppBar(
        title: 'Products',
        onNotificationIconButtonClicked: () {},
        onChangeWhenSearh: (String) {},
      ),
      body: Scaffold(
        body: GetBuilder<ProductsControllerImp>(
          builder: (_) {
            return ListView(
              children: [
                ProductCatogeryList(
                  catogeriesList: productsController.catogeriesList!,
                ),
                GridView.builder(
                  itemCount: productsController.testImages.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //This to controll on the heigh of the card.
                    mainAxisExtent: 200,

                    crossAxisSpacing: 2.0,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ), // ← زود الرقم حسب الشكل اللي تريده
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // ← نفس رقم التدوير
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        // color: Colors.red,
                                        productsController.testImages[index],
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  style: TextStyle(color: AppColor.greyText),
                                  productsController.testTexts[index],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_outline,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    Text(
                                      "\$${productsController.testPrices[index]}",
                                      style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
