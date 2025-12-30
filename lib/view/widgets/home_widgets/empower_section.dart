import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/controller/home_controller.dart';
import 'package:e_commerce_halfa/core/functions/translate_data_base.dart';
import 'package:e_commerce_halfa/data/model/setting_model.dart';
import 'package:e_commerce_halfa/view/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmpowerSection extends StatelessWidget {
  const EmpowerSection({super.key, required this.body});

  final String body;

  @override
  Widget build(BuildContext context) {
    var homeCont = Get.find<HomeControllerImp>();
    SettingModel empower = homeCont.textList[homeCont.ranomNum!];
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
                      // "200".tr,
                      translateDataBase(
                        empower.settingSubtitleEn,
                        empower.settingSubTitle,
                      ),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      // "201".tr,
                      translateDataBase(
                        empower.settingSubtitleEn,
                        empower.settingSubTitle,
                      ),
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
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: MyCachedImage(
                    fit: BoxFit.contain,
                    imageUrl:
                        "${AppLinkApi.textImageLink}/${empower.textImageLink}",
                  ),
                ),
                // Image.asset(
                //   ImageAssets.bannerMaknaZitFoulDon,
                //   width: 100,
                //   height: 100,
                //   fit: BoxFit.cover,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
