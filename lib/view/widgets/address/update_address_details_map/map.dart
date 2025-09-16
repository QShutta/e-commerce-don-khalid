import 'package:e_commerce_halfa/controller/address_controller/update_address_details_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';

class AddressMapWidget extends StatelessWidget {
  final UpdateAddressDetailsMapController controller;
  const AddressMapWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: controller.mapController,
      options: MapOptions(
        onTap: (tapPosition, latLng) {
          controller.changeMarker(latLng);
        },
        initialCenter: controller.userLocation!,
        initialZoom: 14,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.e_commerce_halfa',
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap:
                  () => launchUrl(
                    Uri.parse('https://openstreetmap.org/copyright'),
                  ),
            ),
          ],
        ),
        MarkerLayer(markers: controller.markerList),
      ],
    );
  }
}
