import 'dart:io';

checkInternet() async {
  // نستخدم
  //try
  // عشان نجرب تنفيذ الكود اللي ممكن يسبب خطأ
  // لو صار خطأ بسبب مشاكل في الإنترنت، الدالة ما تتعطل والتطبيق
  //crash
  // ما ينهار، بل يتم التقاط الخطأ ومعالجته بطريقة آمنة
  // (crash)
  // catch
  //يلتقط الخطأ ويعالجوه بدون مشاكل
  try {
    var result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true; // الإنترنت متوفر
    }
  }
  // SocketException
  //هو نوع من الأخطاء
  //(Exception)
  //اللي بيحصل لما تكون مشكلة في الشبكة
  // زي عدم وجود اتصال بالإنترنت أو مشكلة في الوصول للسيرفر
  // بنستخدمه عشان نلتقط فقط هذه الأخطاء الخاصة بالشبكة
  // ونتعامل معها بإرجاع
  //false
  //بدل ما التطبيق يطير
  //(crash)
  on SocketException {
    return false; // الإنترنت غير متوفر
  }
}
