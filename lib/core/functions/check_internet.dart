import 'dart:io';

checkInternet() async {
  try {
    // هذا السطر معناه:
    //  يطلب من الجهاز يروح يبحث عنوان الـ
    //IP
    //الخاص بموقع
    //'google.com'
    // نستخدم
    // await
    // عشان ننتظر النتيجة قبل ما نكمل باقي الكود
    // 3. النتيجة اللي حترجع (result) هي قائمة عناوين IP للموقع
    // 4. لو قدر يلقى العنوان، معناها الإنترنت شغال
    // 5. لو ما قدر يلقى، معناها ما في اتصال بالإنترنت

    var result = await InternetAddress.lookup('google.com');
    // Check if the result is not empty and the first address is not empty
    // This ensures that we have a valid internet connection
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      // لما يكون في انترنت، الرد بترجع
      //true
      //بسرعة
      // لأن الجهاز يقدر يلقى عنوان
      //IP
      // لموقع google.com بسهولة
      // لكن لو ما في انترنت،
      //أو الانترنت بطيء، الدالة حتاخذ وقت قبل ما ترجع
      //false
      // لأن الجهاز بيحاول يبحث عن العنوان ويستنى رد
      // عشان كدا ممكن يكون في تأخير بسيط لما الانترنت ضعيف أو غير موجود
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
