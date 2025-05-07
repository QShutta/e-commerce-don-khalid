import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/data/model/onboarding_model.dart';
import 'package:get/get.dart';

// قمنا بإنشاء قائمة
//(List)
// تحتوي على عناصر من نوع
// OnboardingModel
// لأن شاشة الـ
// Onboarding
// تتكون من عدة شرائح
// (Slides)
// وكل شريحة تحتوي على
// صورة وعنوان ووصف مختلف، لذلك من الأفضل تنظيم هذه الشرائح في
// List
// حتى نعرضها بطريقة ديناميكية باستخدام
// PageView
// مثلاً.
// باستخدام الـ List يمكننا التعامل مع البيانات بطريقة مرنة ومنظمة،
// كما أن إضافة أو تعديل الشرائح يصبح أسهل.
List<OnboardingModel> onboardingList = [
  OnboardingModel(
    title: "1".tr, // Selection of the best products
    imagePath: ImageAssets.onBoarding1,
    description: "2".tr, // We offer you the best products at the best prices
  ),
  OnboardingModel(
    title: "3".tr, // Secure and easy payment
    imagePath: ImageAssets.onBoarding2,
    description:
        "4".tr, // Pay with confidence using secure and user-friendly options
  ),
  OnboardingModel(
    title: "5".tr, // Fast and secure delivery
    imagePath: ImageAssets.onBoarding3,
    description:
        "6".tr, // We guarantee fast and secure delivery to your doorstep
  ),
  OnboardingModel(
    title: "7".tr, // Safe and Fast Delivery
    imagePath: ImageAssets.onBoarding4,
    description:
        "8".tr, // We deliver your product fast and safe, and you’ll always be satisfied.
  ),
];
