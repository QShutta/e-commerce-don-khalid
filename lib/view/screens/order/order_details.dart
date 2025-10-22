import 'package:e_commerce_halfa/controller/order_details_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});
  @override
  Widget build(BuildContext context) {
    OrderDetailsController orderController = Get.put(OrderDetailsController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomeAppBar(
        searchTextTitle: 'OrderDetails',
        textColor: AppColor.primaryColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Text(
                          "الصنف",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "العدد",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "السعر",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        SizedBox(height: 10), // 👈 space between rows
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "جلابية الدون",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "2",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "3000",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        SizedBox(height: 10), // 👈 space between rows
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "توب الدون",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "6",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "5000",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),

            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Order Price:\$3500",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColor.primaryColor,
                  child: Icon(Icons.location_on_outlined, color: Colors.white),
                ),
                title: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  width: double.infinity,
                  child: Text(
                    "Shipping Address",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                subtitle: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  width: double.infinity,
                  child: Text(
                    orderController.orderModel!.addressName == null
                        ? "No address data"
                        : "${orderController.orderModel!.addressName}\n${orderController.orderModel!.addressCity}\n${orderController.orderModel!.addressStreet}\n",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(12),
              width: 300,
              height: 300,
              child: FlutterMap(
                mapController: orderController.mapController,
                options: MapOptions(
                  onTap: (tapPosition, latLang) {},
                  initialCenter: LatLng(
                    orderController.orderModel!.addressLat == null
                        ? 15.6071907
                        : orderController.orderModel!.addressLat!,
                    orderController.orderModel!.addressLang == null
                        ? 32.6230972
                        : orderController.orderModel!.addressLang!,
                  ),
                  initialZoom: 14,
                ),
                children: [
                  //1️⃣ Tile = البلاطة
                  // الخريطة الكبيرة ما بتنزل كاملة في صورة واحدة، لأن دا حيكون تقيل على التطبيق والموبايل.
                  // عشان كدا، الخريطة بتتقسم لمربعات صغيرة اسمها Tiles (يعني بلاطات).
                  // كل Tile
                  //هو جزء صغير من الخريطة.
                  // التطبيق بيجيب كل البلاطات دي من السيرفر ويجمعها عشان تظهر ليك الخريطة كاملة على الشاشة
                  TileLayer(
                    // Bring your own tiles
                    //هنا انت بتحدد السيرفر اللي حيجيب منه البلاطات.

                    // {z} = مستوى الزوم (Zoom level)
                    // {x} = رقم البلاطة أفقياً
                    // {y} = رقم البلاطة عمودياً
                    // يعني التطبيق يعرف من وين يجيب كل بلاطة عشان يعمل الخريطة الكبيرة.
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                    userAgentPackageName:
                        'com.e_commerce_halfa', // Add your app identifier
                    // And many more recommended properties!
                  ),
                  //القوانين بتاعة الخرائط
                  //(زي OpenStreetMap)
                  // بتقول:
                  // لو إنت استخدمت خريطتهم في تطبيقك لازم تكتب مصدر الخريطة
                  //(Attribution) في مكان واضح.
                  //So this widget "RichAttributionWidget" will do that job it will
                  //Dispaly the the text "OpenStreetMap" contributors in the middle of the screen as a link when click
                  //on it will take you to there website.
                  RichAttributionWidget(
                    // Include a stylish prebuilt attribution widget that meets all requirments
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap:
                            () => launchUrl(
                              Uri.parse('https://openstreetmap.org/copyright'),
                            ), // (external)
                      ),
                      // Also add images...
                    ],
                  ),
                  // ✅ نعرض العلامة المستخدم ضغط عليها هنا
                  // GetBuilder<AddAddressController>(
                  //   builder:
                  //       (controller) =>
                  //           MarkerLayer(markers: controller.markerList),
                  // ),
                  //دة عشان يحط علامة حمرا في الموقع الحالي للمستخدم.
                  //وانا في الاضافة ما عاوزو يخت علامة حمرا في موقع المستخدم احلالي
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 100,
                        height: 100,
                        point: LatLng(
                          //This to handle the case of the user chose to pickup from the store.
                          //In that case ,will just display default location
                          orderController.orderModel!.addressLat == null
                              ? 15.6071907
                              : orderController.orderModel!.addressLat!,
                          orderController.orderModel!.addressLang == null
                              ? 32.6230972
                              : orderController.orderModel!.addressLang!,
                        ),
                        child: Icon(
                          Icons.location_on_rounded,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
