import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

String? validInput(String input, int min, int max, String type) {
  if (input.isEmpty) {
    return "53".tr;
  }
  if (type == "otp") {
    if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
      return "OTP code must contain only numbers";
    }
  }
  if (type == "password") {
    // تحقق من الحروف الكبيرة
    bool hasUppercase = input.contains(RegExp(r'[A-Z]'));
    // تحقق من الحروف الصغيرة
    bool hasLowercase = input.contains(RegExp(r'[a-z]'));
    // تحقق من الأرقام
    bool hasNumber = input.contains(RegExp(r'[0-9]'));
    // تحقق من الرموز
    bool hasSymbol = input.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase || !hasLowercase || !hasNumber || !hasSymbol) {
      return "57".tr; // رسالة كلمة مرور ضعيفة
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(input)) {
      return "54".tr;
    }
  }

  if (input.length < min) {
    return "55".trParams({"min": min.toString()});
  }

  if (input.length > max) {
    return "56".trParams({"max": max.toString()});
  }

  return null;
}
