import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
    required this.mySearchCont,
    required this.onFinalSearchButtonClicked,
    required this.onChange,
  });
  final TextEditingController mySearchCont;
  final void Function()? onFinalSearchButtonClicked;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: TextField(
        controller: mySearchCont,
        style: TextStyle(
          color: Colors.black, // 👈 لون النص اللي المستخدم بيكتبه
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: '216'.tr,
          prefixIcon: IconButton(
            // onPressed: onFinalSearchButtonClicked,
            icon: Icon(Icons.search),
            onPressed: onFinalSearchButtonClicked,
            // onPressed: () {
            //   mySearchCont.search(mySearchCont.searchController!.text);
            //   //Why did you add this line?
            //   // 👇 إخفاء الكيبورد قبل عرض نتائج البحث
            //   // الهدف: عشان نمنع مشكلة RenderFlex overflow
            //   // لما الكيبورد يكون ظاهر ويغطي جزء من الشاشة
            //   FocusScope.of(context).unfocus();
            // },
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        onChanged: onChange,
        // onChanged:

        //  (value) {
        //   mySearchCont.checkSearch(value);
        // },
      ),
    );
  }
}
