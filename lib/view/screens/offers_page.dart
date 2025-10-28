import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/fav_controller.dart';
import 'package:e_commerce_halfa/controller/offers_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersPage extends StatelessWidget {
  //Before of implement the search in the offer page.
  const OffersPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    FavController favController = Get.put<FavController>(FavController());
    return Scaffold(
      body: GetBuilder<OffersController>(
        builder: (offersController) {
          return HnadlingDataView(
            stautusRequest: offersController.statusRequest,
            widget: ListView.builder(
              itemCount: offersController.productList.length,
              itemBuilder: (context, index) {
                var product = offersController.productList[index];
                //This to fill the isFav map.why to fill it ?
                //The isFav map job is to speacfy wither the product is added to the fav table or not
                //if it's added will be marked by 1.otherwise it will be marked by 0
                favController.isFav[offersController
                        .productList[index]
                        .productsId] =
                    product.fav.toString();

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 200,
                          child: MyCachedImage(
                            fit: BoxFit.contain,
                            imageUrl:
                                "${AppLinkApi.productsImageLink}/${product.productImage}",
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Don Suite",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Text("Rate: 4.5", style: TextStyle(fontSize: 18)),
                              Spacer(),
                              ...List.generate(5, (index) {
                                return Icon(
                                  Icons.star_border_outlined,
                                  size: 20,
                                );
                              }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "\$100",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              GetBuilder<FavController>(
                                builder: (favController) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: IconButton(
                                      onPressed: () {
                                        //When the user click on the button if the product is add to the fav already will be removed when click
                                        //Otherwise it will be added to the fav.
                                        if (favController.isFav[product
                                                .productsId] ==
                                            "1") {
                                          favController.setFav(
                                            product.productsId,
                                            "0",
                                          );
                                          favController.deleteFromFav(
                                            product.productsId.toString(),
                                          );
                                        } else {
                                          favController.setFav(
                                            product.productsId,
                                            "1",
                                          );
                                          favController.addToFav(
                                            product.productsId.toString(),
                                          );
                                        }
                                      },
                                      //The icon shape will be taked fromt he isFav map.
                                      //if the product is added to the fav table the value of the product in the
                                      //isfav map will be 1 so his shape will be filled with blue.
                                      //from where did that the value of the isFav map will caome?
                                      //in the beging of the page when getting the products from the api we fill the isfav
                                      //by it's values.
                                      icon:
                                          favController.isFav[product
                                                      .productsId] ==
                                                  "1"
                                              ? Icon(
                                                Icons.favorite,
                                                color: AppColor.primaryColor,
                                              )
                                              : Icon(
                                                Icons.favorite_outline,
                                                color: Colors.grey,
                                              ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
