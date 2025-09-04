import 'package:e_commerce_halfa/controller/search_controller.dart';
import 'package:e_commerce_halfa/view/widgets/search/search_app_bar.dart';
import 'package:e_commerce_halfa/view/widgets/search/search_result.dart';
import 'package:e_commerce_halfa/view/widgets/search/search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final MySearchCont mySearchCont = Get.put(MySearchCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // خلفية خفيفة
      appBar: SearchAppBar(searchTextTitle: "بحث المنتجات"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // 🔍 حقل البحث
            SearchTextFormField(
              mySearchCont: mySearchCont.searchController!,
              onFinalSearchButtonClicked: () {
                mySearchCont.search(mySearchCont.searchController!.text);
                //   //Why did you add this line?
                //   // 👇 إخفاء الكيبورد قبل عرض نتائج البحث
                //   // الهدف: عشان نمنع مشكلة RenderFlex overflow
                //   // لما الكيبورد يكون ظاهر ويغطي جزء من الشاشة
                FocusScope.of(context).unfocus();
              },
              onChange: (value) {
                mySearchCont.checkSearch(value);
              },
            ),
            const SizedBox(height: 24),
            SearchResult(),
          ],
        ),
      ),
    );
  }
}
