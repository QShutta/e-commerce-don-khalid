import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/settings_controller.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class UserProfileImage extends StatelessWidget {
  UserProfileImage({super.key});
  final SettingController settingController = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (controller) {
        if (controller.stautusRequest == StautusRequest.loading) {
          return Container(
            width: 120,
            height: 120,
            alignment: Alignment.center,
            child: Lottie.asset(ImageAssets.loading),
          );
        } else {
          return CachedNetworkImage(
            imageUrl: "${AppLinkApi.usersImage}/${controller.userImageUrl}",
            fit: BoxFit.contain,
            placeholder: (context, url) => Lottie.asset(ImageAssets.loading),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        }
      },
    );
  }
}
