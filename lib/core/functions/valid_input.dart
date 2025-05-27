import 'package:get/get_utils/src/get_utils/get_utils.dart';

validInput(String value, int min, int max, String type) {
  if (type == "userName") {
    // GetUtils
    // هي مكتبة من حزمة
    //GetX
    // توفر طرق جاهزة للتحقق من صحة البيانات مثل البريد الإلكتروني،
    // اسم المستخدم، الأرقام، وغيرها.
    // هنا نستخدم
    // isUsername
    // للتحقق إذا كانت القيمة المُدخلة صالحة
    // كاسم مستخدم (تحتوي على حروف، أرقام، و_ فقط وطولها مناسب).

    if (!GetUtils.isUsername(value)) {
      return "Not a valid username";
    }
  }
  if (type == "email") {
    // هنا نستخدم isEmail للتحقق إذا كانت القيمة المُدخلة صالحة
    // كبريد إلكتروني.
    if (!GetUtils.isEmail(value)) {
      return "Not a valid email";
    }
  }

  if (value.length < min) {
    return "This field must be at least $min characters";
  }
  if (value.length > max) {
    return "This field must be at most $max characters";
  }
  if (value.isEmpty) {
    return "This field must not be empty";
  }
}
