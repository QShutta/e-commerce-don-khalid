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
      appBar: SearchAppBar(searchTextTitle: "215".tr),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // 🔍 حقل البحث
            SearchTextFormField(
              mySearchCont: mySearchCont.searchController!,
              // Can you clarify what you mean by onFinalSearchButtonClicked?
              // As I explained earlier, I have two search buttons:
              // 1. The first button navigates to the search page.
              // 2. The second button (inside the search page) actually performs the search.
              onFinalSearchButtonClicked: () {
                mySearchCont.search(mySearchCont.searchController!.text);
                //   //Why did you add this line?
                //   // 👇 إخفاء الكيبورد قبل عرض نتائج البحث
                //   // الهدف: عشان نمنع مشكلة RenderFlex overflow
                //   // لما الكيبورد يكون ظاهر ويغطي جزء من الشاشة
                FocusScope.of(context).unfocus();
              },
              onChange: (value) {
                //What is the job of the checkSearch method?
                //the job of the checksearch method here is very simple it will just make that when the user
                //remove the textfrom the textfromfield will make the listreult empty
                mySearchCont.checkSearch(value);
              },
            ),
            const SizedBox(height: 14),
            SearchResult(),
          ],
        ),
      ),
    );
  }
}
