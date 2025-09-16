import 'package:e_commerce_halfa/controller/address_controller/add_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AddressMap extends StatelessWidget {
  AddressMap({super.key});

  final AddAddressController addAddressCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: addAddressCont.mapController,
      options: MapOptions(
        onTap: (tapPosition, latLang) {
          addAddressCont.addMarker(latLang);
        },
        initialCenter:
            addAddressCont
                .userLocation!, // Once the page open for the firs time the map will display
        //The user current location.
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
        GetBuilder<AddAddressController>(
          builder: (controller) => MarkerLayer(markers: controller.markerList),
        ),
        //دة عشان يحط علامة حمرا في الموقع الحالي للمستخدم.
        //وانا في الاضافة ما عاوزو يخت علامة حمرا في موقع المستخدم احلالي
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
    );
  }
}
