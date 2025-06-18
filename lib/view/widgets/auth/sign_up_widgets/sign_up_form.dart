import 'package:e_commerce_halfa/controller/auth_controller/sign_up_controllers/sign_up_controller.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/functions/valid_input.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/sign_in_button.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  // استخدمنا
  //'final'
  // عشان نضمن إنو
  //signInController
  //يتم إنشاؤه مرة واحدة فقط
  // وما يتغير لاحقًا، وده بيساعد في حماية الكود من الأخطاء
  final SignUpControllerImp signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: handle loading state here after watching the next lesson

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
        child: SingleChildScrollView(
          // We added "SingleChildScrollView" because:
          // When the user enters data wrong or leaves a field empty,
          // error messages will appear below the fields,
          // and this makes the form taller than the screen height.
          // Without SingleChildScrollView, the screen won't have enough space,
          // so the content will overflow and cause an error.
          // Using SingleChildScrollView lets the user scroll down to see all fields and errors.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "30".tr,

                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  "31".tr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColor.greyText),
                ),
              ),

              const SizedBox(height: 15),
              Form(
                key: signUpController.formKey,
                child: Column(
                  children: [
                    // Name
                    CustomTextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(
                          context,
                        ).requestFocus(signUpController.emailFocusNode);
                      },
                      label: "32".tr,
                      hint: "33".tr,
                      suffixIcon: const Icon(Icons.person_outline_outlined),
                      isPassword: false,
                      textcontroller: signUpController.nameCont,
                      focusNode: signUpController.nameFocusNode,
                      validator: (String? value) {
                        return validInput(value!, 3, 100, "name");
                      },
                    ),
                    SizedBox(height: 15),
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
                        ).requestFocus(signUpController.passwordFocusNode);
                      },
                      label: "34".tr,
                      hint: "35".tr,
                      isPassword: false,
                      suffixIcon: const Icon(Icons.email_outlined),
                      textcontroller: signUpController.emailCont,
                      focusNode: signUpController.emailFocusNode,
                      validator: (String? value) {
                        return validInput(value!, 10, 30, "email");
                      },
                    ),

                    const SizedBox(height: 15),

                    // Password
                    CustomTextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(
                          context,
                        ).requestFocus(signUpController.confirmPassword);
                      },
                      focusNode: signUpController.passwordFocusNode,
                      isPassword: true,
                      label: "36".tr,
                      hint: "37".tr,
                      textcontroller: signUpController.passwordCont,
                      validator: (String? value) {
                        return validInput(value!, 8, 30, "password");
                      },
                    ),
                    SizedBox(height: 15),

                    // Confirm Password
                    CustomTextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      focusNode: signUpController.confirmPassword,
                      isPassword: true,
                      label: "38".tr,
                      hint: "38".tr,
                      textcontroller: signUpController.confirmPasswordCont,
                      validator: (String? value) {
                        return validInput(value!, 8, 30, "password");
                      },
                    ),
                    const SizedBox(height: 50),
                    // Sign In Button
                    SignButton(
                      text: "15".tr,
                      onPressed: () {
                        print(
                          "The button click........................................",
                        );
                        // هنا بنستخدم
                        // FocusScope.of(context).unfocus()
                        // عشان نقفل الكيبورد لما نضغط على زر تسجيل الدخول.
                        // يعني لو الكيبورد مفتوح، لما نضغط الزر، الكيبورد حيتقفل.
                        FocusScope.of(context).unfocus();
                        signUpController.signUp();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// Widget buildSignUpFormContent(BuildContext context,SignUpControllerImp controller){}