import 'package:e_commerce_halfa/controller/auth_controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SocialMediaSignIn extends StatelessWidget {
  SocialMediaSignIn({super.key});

  final SignInControllerImp signInController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              await signInController.signInWithGoogle();
            },
            icon: const Icon(FontAwesomeIcons.google, color: Colors.blue),
            label: Text("25".tr),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              await signInController.signInWithFacebook();
            },
            icon: const Icon(FontAwesomeIcons.facebook, color: Colors.blue),
            label: Text("26".tr),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
