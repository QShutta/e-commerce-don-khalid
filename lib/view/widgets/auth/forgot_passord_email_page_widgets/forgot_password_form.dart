import 'package:e_commerce_halfa/controller/auth_controller/forgot_password_controllers/forgot_password_email_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_button.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailForm extends StatelessWidget {
  final void Function() onPressed;
  final TextEditingController textEmailCont;
  const EmailForm({
    super.key,
    required this.onPressed,
    required this.textEmailCont,
  });

  // استخدمنا
  //'final'
  // عشان نضمن إنو
  //signInController
  //يتم إنشاؤه مرة واحدة فقط
  // وما يتغير لاحقًا، وده بيساعد في حماية الكود من الأخطاء
  // final ForgotPasswordEmailControllerImp emailCont = Get.put(
  //   ForgotPasswordEmailControllerImp(),
  // );
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
                Center(
                  child: Text(
                    "39".tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppColor.black),
                  ),
                ),

                SizedBox(height: 30),
                // Email
                CustomTextFormField(
                  label: "18".tr,
                  hint: "19".tr,
                  textcontroller: textEmailCont,
                  validator: (String) {},
                ),

                const SizedBox(height: 20),

                // Sign In Button
                SignButton(
                  text: "40".tr,
                  onPressed: onPressed,

                  //  () {
                  //   // هنا بنستخدم
                  //   // FocusScope.of(context).unfocus()
                  //   // عشان نقفل الكيبورد لما نضغط على زر تسجيل الدخول.
                  //   // يعني لو الكيبورد مفتوح، لما نضغط الزر، الكيبورد حيتقفل.
                  //   FocusScope.of(context).unfocus();
                  //   emailCont.goToVerficationCodePage();
                  // },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
