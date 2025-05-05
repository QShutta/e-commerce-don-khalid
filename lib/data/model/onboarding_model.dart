// هذا الكلاس يمثل بيانات شاشة واحدة من شاشات التعريف
// (Onboarding).
// أنشأناه لتنظيم البيانات الخاصة بكل شاشة بطريقة مرتبة وسهلة الصيانة.
class OnboardingModel {
  // مسار الصورة التي ستُعرض في شاشة التعريف.
  final String imagePath;

  // العنوان الرئيسي في شاشة التعريف.
  final String title;

  // الوصف أو النص التوضيحي الذي يظهر تحت العنوان.
  final String description;

  // هذا هو الباني
  //(constructor)
  // الخاص بالكلاس.
  // استخدمنا "required" حتى نضمن أن كل القيم يجب أن يتم تمريرها عند إنشاء الكائن.
  OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
