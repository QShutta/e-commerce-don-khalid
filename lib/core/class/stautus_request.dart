enum StautusRequest {
  none,
  success,
  failure, //نحننا هنا قاصدين بالفشل انو هو قدر يصل للصفحة لوكن
  //بفشل لمهمة محددة
  //علي سبيل المثال نحننننننا حاولنا ننشئ حساب وادخلنا بريد إلكتروني
  //موجود مسبقا
  loading,
  none,
  offlineFailure,
  serverFailure, // فشل بسبب مشكلة في السيرفر نفسه (مثل تعطل السيرفر أو خطأ داخلي)
  serverException,
}
