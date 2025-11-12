import 'package:e_commerce_halfa/controller/order/order_controller.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CustomeRatingDialog extends StatelessWidget {
  //To rate an order we need the order id and the ratingvalue,rating comment.
  //the ratingvalue,ratingcomment.are already have them in this dialog.
  //but the order id we should get it from the list when the user click on the order we git the id of the order that
  //he click on it.
  const CustomeRatingDialog({super.key, required this.orderId});

  final String? orderId;
  @override
  Widget build(BuildContext context) {
    OrderController orderCont = Get.find<OrderController>();
    //Why did we surrond the alert with loading because of when the user click on the submit button
    //there is alitle bit of milisecound that the  user should wait so i don't want the user to click a button and there is
    //no event happen in front of him .so i will display the loading for him.
    return GetBuilder<OrderController>(
      builder: (controller) {
        return orderCont.stautusRequest == StautusRequest.loading
            ? LoadingWidget()
            : AlertDialog(
              title: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(ImageAssets.ratingIconImage),
              ),
              content: Text(
                "How was your order?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              actions: [
                Column(
                  children: [
                    Align(
                      alignment: AlignmentGeometry.center,
                      //Here i am using outside package called flutter rating bar.
                      child: RatingBar.builder(
                        allowHalfRating: true,
                        itemSize: 30,
                        glowColor: Colors.amberAccent,
                        initialRating: 0,
                        minRating: 0,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star_border_outlined,
                            color: Colors.amber,
                          );
                        },
                        onRatingUpdate: (value) {
                          orderCont.setRatingValue(value);
                        },
                      ),
                    ),

                    SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: orderCont.ratingCommentController,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                          hint: Text(
                            "Write your review...",
                            textAlign: TextAlign.center,
                          ),
                          filled: true,

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            // جعل لون الإطار شفافًا أو مساويًا للون التعبئة
                            borderSide: BorderSide(
                              color:
                                  Colors.transparent, // <<--- هذا هو المفتاح 🔑
                              width: 0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            // يمكنك إما جعله شفافًا تمامًا أو وضع لون فاتح جداً (مثل لون التعبئة)
                            borderSide: BorderSide(
                              color:
                                  Colors.transparent, // <<--- هذا هو المفتاح 🔑
                              width: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 220, 216, 223),
                          ),
                          onPressed: () {
                            orderCont.ratingCommentController!
                                .clear(); // ✅ تنظيف النص عند الإلغاء
                            orderCont.setRatingValue(0.0);
                            Get.back();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff6C9FDC),
                          ),
                          onPressed: () {
                            orderCont.orderRating(
                              orderId,
                              orderCont.ratingValue.toString(),
                              orderCont.ratingCommentController!.text,
                            );
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
      },
    );
  }
}
