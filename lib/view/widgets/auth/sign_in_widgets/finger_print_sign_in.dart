import 'package:e_commerce_halfa/controller/auth_controller/sign_in_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FingerPrintSignIn extends StatelessWidget {
  FingerPrintSignIn({super.key});
  final SignInControllerImp signInController = Get.find();
  final MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    final bool enabled =
        myServices.sharedPreferences.getBool("fingerPrint") ?? false;
    final String? fpUserId = myServices.sharedPreferences.getString(
      'fingerPrint_user_id',
    );

    // Show fingerprint button only when fingerprint is enabled and we have an associated user id

    return Center(
      child: IconButton(
        onPressed:
            signInController.isLoading
                ? null
                : () async {
                  bool isLogin = await signInController.signInWithFingerPrint();
                  if (isLogin) {
                    // Try to restore user_id from stored fingerprint owner
                    String? userId = myServices.sharedPreferences.getString(
                      "user_id",
                    );
                    if (userId == null || userId.isEmpty) {
                      print(userId);
                      // Fall back to the user id that enabled fingerprint
                      final String? storedFpUser = myServices.sharedPreferences
                          .getString('fingerPrint_user_id');
                      // if (storedFpUser == null || storedFpUser.isEmpty) {
                      //   Get.defaultDialog(
                      //     title: 'Error',
                      //     middleText:
                      //         'No user information found. Please sign in once with your credentials to enable fingerprint login.',
                      //     textConfirm: 'OK',
                      //     onConfirm: () => Get.back(),
                      //   );
                      //   return;
                      // }

                      // restore the session user_id from fingerprint mapping
                      userId = storedFpUser;
                      await myServices.sharedPreferences.setString(
                        'user_id',
                        userId!,
                      );
                      print(
                        'DEBUG: restored user_id from fingerPrint_user_id = $userId',
                      );
                    }

                    FirebaseMessaging.instance.subscribeToTopic('users$userId');
                    await myServices.sharedPreferences.setBool(
                      "isLoggedIn",
                      true,
                    );
                    Get.offAllNamed(AppRoutes.home);
                  } else {
                    Get.defaultDialog(
                      title: 'Error',
                      middleText:
                          'Fingerprint authentication failed or cancelled.',
                      textConfirm: 'OK',
                      onConfirm: () => Get.back(),
                    );
                  }
                },
        icon: const Icon(Icons.fingerprint_rounded, size: 40),
      ),
    );
  }
}
