import 'package:e_commerce_halfa/core/class/stautus_request.dart';

// الدالة دي هدفها تفحص نوع الـ
//response
// اللي جاي من السيرفر أو العملية
// لو الـ
//response
//هو من نوع
//StautusRequest
// (يعني فشل، تحميل، أو مشكلة)
// معناها في مشكلة حصلت، فنرجع الحالة دي عشان نقدر نتصرف عليها في الكود
// أما لو ما كانش من نوع
//StautusRequest،
// معناها العملية نجحت
// فنرجع success بشكل افتراضي.
// الهدف منها تبسيط التعامل مع الحالات المختلفة للردود
// بدون تعقيد، بحيث الكود اللي بيستخدمها يعرف بسهولة حالة العملية.
handlingStatusRequest(response) {
  if (response is StautusRequest) {
    return response;
  } else {
    return StautusRequest.success;
  }
}
