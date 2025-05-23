import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ResetPasswordController extends GetxController {}

class ResetPasswordControllerImp extends ResetPasswordController {
  TextEditingController passwordCont = TextEditingController();
  TextEditingController confitmPasswordCont = TextEditingController();

  FocusNode passwordFocus = FocusNode();
  FocusNode confitmPasswordFocus = FocusNode();
}
