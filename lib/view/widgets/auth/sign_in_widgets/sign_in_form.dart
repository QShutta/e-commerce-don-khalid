import 'package:e_commerce_halfa/controller/auth_controller/sign_in_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/functions/valid_input.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/finger_print_sign_in.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/forgot_password_text.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_button.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/social_media_sign_in.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});
  // استخدمنا
  //'final'
  // عشان نضمن إنو
  //signInController
  //يتم إنشاؤه مرة واحدة فقط
  // وما يتغير لاحقًا، وده بيساعد في حماية الكود من الأخطاء
  final SignInControllerImp signInController = Get.find();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "16".tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "17".tr,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColor.greyText),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(height: 15),
            Form(
              key: signInController.formKey,
              child: Column(
                children: [
                  // Email
                  CustomTextFormField(
                    // الـ
                    //onFieldSubmitted
                    // تشتغل لما المستخدم يضغط
                    //Enter أو Done
                    // في الكيبورد.
                    // المتغير
                    //p0
                    //هو الاسم التلقائي اللي بيجي من الدالة، وهو يمثل النص
                    //(String)
                    // اللي كتبه المستخدم داخل الحقل وقت ما ضغط
                    // Enter.
                    // يعني مثلاً لو المستخدم كتب
                    //"example@gmail.com"، فـ p0 = "example@gmail.com".
                    // في حالتك هنا ما بنحتاج نستخدم النص، فقط بننقل التركيز لحقل الباسورد.
                    onFieldSubmitted: (p0) {
                      FocusScope.of(
                        context,
                      ).requestFocus(signInController.passwordFocusNode);
                    },
                    label: "18".tr,
                    hint: "19".tr,
                    textcontroller: signInController.emailCont,
                    focusNode: signInController.emailFocusNode,
                    validator: (value) {
                      return validInput(value!, 5, 30, "email");
                    },
                  ),

                  const SizedBox(height: 15),

                  // Password
                  CustomTextFormField(
                    focusNode: signInController.passwordFocusNode,
                    isPassword: true,
                    label: "20".tr,

                    // هنا بنستخدم
                    hint: "21",
                    textcontroller: signInController.passwordCont,
                    validator: (String? value) {
                      return validInput(value!, 5, 30, "password");
                    },
                  ),

                  ForgotPasswordText(),
                  const SizedBox(height: 10),
                  // Sign In Button
                  SignButton(
                    text: "22".tr,
                    onPressed: () {
                      // هنا بنستخدم
                      // FocusScope.of(context).unfocus()
                      // عشان نقفل الكيبورد لما نضغط على زر تسجيل الدخول.
                      // يعني لو الكيبورد مفتوح، لما نضغط الزر، الكيبورد حيتقفل.
                      FocusScope.of(context).unfocus();
                      signInController.signIn();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Center(child: Text("23".tr)),
            const SizedBox(height: 10),
            // FingerPrint Button
             FingerPrintSignIn() , 
             const SizedBox(
              height: 12,
             ) , 
            // Google and Facebook
          
            SocialMediaSignIn(),
          ],
        ),
      ),
    );
  }
}
