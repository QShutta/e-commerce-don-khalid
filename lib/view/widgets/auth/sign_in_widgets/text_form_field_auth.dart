import 'package:flutter/material.dart';

// ويدجت قابلة لإعادة الاستخدام لعرض TextFormField مخصص
class CustomTextFormField extends StatefulWidget {
  final FocusNode? focusNode;
  final String label; // النص الظاهر فوق الحقل
  final String hint; // النص التوضيحي داخل الحقل
  final bool isPassword; // لتحديد ما إذا كان الحقل مخصص لكلمة السر
  final TextInputType keyboardType; // نوع لوحة المفاتيح (نص، رقم، إيميل...)
  final String? Function(String?)? validator; // دالة التحقق من صحة الإدخال
  final TextEditingController textcontroller; // للتحكم بقيمة الحقل
  final void Function(String)?
  onFieldSubmitted; // دالة عند الضغط على زر الإدخال
  final Widget?
  suffixIcon; // أيقونة تظهر في نهاية الحقل (مثل أيقونة العين لكلمة السر)
  // دالة عند الضغط على زر الإدخال
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
    required this.textcontroller,
    this.focusNode,
    this.onFieldSubmitted,
    this.suffixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  // هذا المتغير يستخدم لإخفاء/إظهار النص في حال كان
  // Password
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),

      onFieldSubmitted: widget.onFieldSubmitted, // عند الضغط على زر الإدخال
      focusNode: widget.focusNode, // ربط الحقل بالـ focusNode
      controller: widget.textcontroller, // ربط الحقل بالـ controller
      // لو الحقل هو Password، نخفي النص حسب حالة _obscureText
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType, // نوع لوحة المفاتيح حسب الاستخدام
      validator: widget.validator, // دالة التحقق من صحة المدخلات
      decoration: InputDecoration(
        labelText: widget.label, // عنوان الحقل
        labelStyle: Theme.of(context).textTheme.bodyMedium, // تنسيق النص
        hintText: widget.hint, // التلميح داخل الحقل
        hintStyle: Theme.of(context).textTheme.bodySmall, // تنسيق النص
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)), // شكل الحقل
        ), // إطار الحقل
        // إذا كان الحقل Password، نظهر أيقونة العين لتبديل حالة الإخفاء
        suffixIcon: // إذا كان الحقل هو
            widget.isPassword
                ? IconButton(
                  //visibility_off and visibility this is the icon name
                  // إذا كانت كلمة السر مخفية
                  //(_obscureText = true)
                  // نعرض أيقونة "العين وعليها خط"
                  // وإذا كانت ظاهرة نعرض أيقونة "العين المفتوحة"
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  // عند الضغط على الأيقونة نغير حالة _obscureText
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                : widget.suffixIcon, // إذا مش
        //Password،
        // لا نعرض أيقونة
      ),
    );
  }
}
