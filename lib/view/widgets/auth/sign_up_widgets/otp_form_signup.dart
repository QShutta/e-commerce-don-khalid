import 'package:e_commerce_halfa/controller/auth_controller/sign_up_controllers/email_otp_cont.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/auth/otp_widgets/otp_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpForm extends StatelessWidget {
  final void Function(String)? onSubmit;
  OtpForm({super.key, required this.onSubmit});
  // استخدمنا
  //'final'
  // عشان نضمن إنو
  //signInController
  //يتم إنشاؤه مرة واحدة فقط
  // وما يتغير لاحقًا، وده بيساعد في حماية الكود من الأخطاء
  EmailOtpControllerImp otpControllerImp =
      Get.find(); // Initialize the controller
  @override
  Widget build(BuildContext context) {
    return // الجزء السفلي (نموذج تسجيل الدخول)
    // استخدمنا
    //ClipRRect
    //عشان نقدر نعمل زوايا دائرية
    //(Rounded Corners)
    // للـ
    // Container
    // اللي تحت الجزء العلوي. بدون
    //ClipRRect،
    // الزوايا الدائرية
    // ما كانت هتظهر لأن
    //Container
    // لوحده ما يقدر يقص المحتوى الداخلي.
    // يعني
    //ClipRRect
    // هو المسؤول عن قص الحواف بحسب الشكل المحدد.
    ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Container(
        width: double.infinity,
        // شوف يا زول، فوق إحنا محددين ارتفاع الجزء العلوي بـ 250،
        // هنا بنطرح الـ 250 دي من ارتفاع الشاشة الكلي،
        // عشان ندي الجزء التحتاني المساحة الباقية بس من الشاشة.
        // يعني الشاشة كلها - 250 = المساحة الباقية للجزء التاني.
        height: MediaQuery.of(context).size.height - 250,

        // البادينج دا خاص بالمحتوى الداخلي زي
        //"Welcome Back"، TextFormField، والأزرار.
        // الهدف منه يدي مسافة داخلية بين حدود الكونتينر والمحتويات، عشان ما تكون لازقة في الأطراف.
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        color: Colors.white,

        // هنا بنستخدم
        // ListView
        // عشان نقدر نسكرول (نمرر) المحتوى لو كان أكبر من الشاشة.
        // يعني لو عندنا محتوى طويل، المستخدم يقدر يسحب لأعلى أو لأسفل عشان يشوف كل المحتوى.
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  "43".tr,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 20),
                Text(
                  "41".tr,
                  textAlign: TextAlign.start,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColor.black),
                ),

                SizedBox(height: 30),
                // Email
                OtpTextFormField(onSubmit: onSubmit),

                const SizedBox(height: 20),

                //هنا مفترض يكون عندنا الايمل اتحصلنا عليهو من اصفحة السابقة يعني لمن نجي ننتقل من صفحة ال sendVer
                //مفترض نعمل pass for the email as a parameter .then will add the email text here

                // هنا بنعرض نص مترجم فيه متغير
                // (email).
                // "42".trParams({"email": otpCont.email})
                // يعني نعوض
                //@email
                // في النص بقيمة الإيميل.
                // النص في الترجمة بيكون مثل:
                // "42":
                // "تم إرسال رمز التحقق إلى بريدك:
                // @email."
                Text(
                  "42".trParams({"email": otpControllerImp.email}),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),

                InkWell(
                  onTap: () {},
                  child: Text(
                    "44".tr,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
