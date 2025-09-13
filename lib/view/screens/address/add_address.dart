import 'package:e_commerce_halfa/controller/add_address_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class AddAddress extends StatelessWidget {
  AddAddress({super.key});

  final AddAddressController addAddressCont = Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        searchTextTitle: 'Address Add',
        textColor: Colors.black,
      ),

      body: GetBuilder<AddAddressController>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: addAddressCont.stautusRequest,
            widget:
                //We add this condition to avoid the error of :null check operator used on null value
                //When the page open it take a time to get the user location this time we dispalpyp to the user
                //empty sized box.
                addAddressCont.userLocation == null
                    ? SizedBox()
                    : Column(
                      children: [
                        // Why did we add Expanded widget here?
                        // Because FlutterMap needs a **finite height** to display the map correctly.
                        // Without Expanded (or a fixed height), FlutterMap gets **infinite height** inside the Column,
                        // which causes errors like "Infinity or NaN toInt".
                        // Expanded tells Flutter: "Take all the remaining vertical space available in the Column",
                        // so the map knows exactly how much space it has and can render tiles properly.
                        Expanded(
                          child: FlutterMap(
                            mapController: addAddressCont.mapController,
                            options: MapOptions(
                              onTap: (tapPosition, latLang) {
                                addAddressCont.addMarker(latLang);
                              },
                              initialCenter:
                                  addAddressCont
                                      .userLocation!, // Center the map over London
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
                                          Uri.parse(
                                            'https://openstreetmap.org/copyright',
                                          ),
                                        ), // (external)
                                  ),
                                  // Also add images...
                                ],
                              ),
                              // ✅ نعرض العلامات هنا
                              GetBuilder<AddAddressController>(
                                builder:
                                    (controller) => MarkerLayer(
                                      markers: controller.markerList,
                                    ),
                              ),
                              //دة عشان يحط علامة حمرا في الموقع الحالي للمستخدم.
                              // MarkerLayer(
                              //   markers: [
                              //     Marker(
                              //       width: 80,
                              //       height: 80,
                              //       point: addAddressCont.userLocation!,
                              //       child: Icon(
                              //         Icons.location_on_outlined,
                              //         color: Colors.red,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
          );
        },
      ),
    );
  }
}
