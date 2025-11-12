import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/products_data.dart';
import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
import 'package:e_commerce_halfa/view/widgets/home_widgets/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Before of 70
abstract class ProductsController extends GetxController {
  getData();
  //Why did we add the catVal?
  //Because we need to know which category the user selected
  // and to filter the products based on that category.

  changeSelectedCat(int val, String catVal);
  initVlues();
  goToProductDetails(productDetails);
  goToFavoritePage();
}

class ProductsControllerImp extends ProductsController {
  List<Catogeries>? catogeriesList;
  int? selectedCat;
  TextEditingController? searchController;
  MyServices myServices = Get.find();
  String? productCat;
  String? userId;
  StautusRequest statusRequest = StautusRequest.none;
  ProductData productData = ProductData(Get.find());
  List<ProductsModel>? producstsLis = [];

  @override
  getData() async {
    // print removed
    statusRequest = StautusRequest.loading;
    update();
    var response = await productData.getData(productCat!, userId!);
    statusRequest = handlingStatusRequest(response);
    // print removed
    if (statusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        producstsLis =
            (response['data'] as List)
                //.fromJson will convert the map to object model.
                .map((product) => ProductsModel.fromJson(product))
                .toList();
      } else {
        statusRequest = StautusRequest.failure;
      }
    }
    update(); //This will update the UI
  }

  @override
  goToFavoritePage() async {
    //await
    //هنا معناها: "افتح صفحة المفضلة وانتظر لحد ما تتقفل، بعدين روح للسطر اللي بعده
    //(getData())."
    // لو ما كان في
    //await،
    // البرنامج كان حيفتح صفحة المفضلة وفي نفس اللحظة يروح ينفذ
    //getData() حتى قبل ما ترجع من الصفحة.
    await Get.toNamed(AppRoutes.favorite);
    getData();
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    initVlues();
    getData();
    super.onInit();
  }

  @override
  initVlues() {
    catogeriesList = Get.arguments["catogeries"];
    selectedCat = Get.arguments["selecedCatogery"];
    productCat = Get.arguments["product_catogery"];
    userId = myServices.sharedPreferences.getString("user_id");
  }
  /*
🔁 فكرة التنقل بين التصنيفات في صفحة المنتجات:
- عند فتح صفحة المنتجات، يتم تمرير كل التصنيفات + التصنيف المختار.
- يتم عرض كل التصنيفات في شريط أفقي.
- عند الضغط على تصنيف آخر:
    1. نحفظ الـ index (selectedCat) لتمييز الزر المختار في الواجهة.
    2. نحفظ الـ id الحقيقي (productCat) لاستخدامه في جلب المنتجات من السيرفر.
    3. نستدعي getData() لجلب المنتجات المرتبطة بالتصنيف.
    4. نقوم بـ update() لتحديث الواجهة بالمنتجات الجديدة.
*/

  @override
  changeSelectedCat(int val, String catVal) {
    selectedCat = val; // ✅ هذا يحدد الزر الملون في الواجهة
    //في حاجة مهمة لاحظها عشان ما تعمل ليك لخبطة لمن المستخدم يضغط علي الزر بيتم تمرير
    //new catogeryid that he want to select
    productCat = catVal; // ✅ هذا يحدد التصنيف الذي سنرسل رقمه للسيرفر
    getData(); // ✅ نجيب البيانات الجديدة حسب التصنيف المختار
    update(); // ✅ نحدّث الواجهة بالبيانات الجديدة
  }

  @override
  goToProductDetails(productDetails) async {
    //Why did you add asyn,await?
    //We want when the user rate product and return back to the products page.we have to get the data agin why?
    //To display to him the new rating value when enter to the product details page again.
    await Get.toNamed(
      AppRoutes.productDetails,
      arguments: {"productDetails": productDetails},
    );
    getData();
  }

  goToSearchPage() {
    Get.to(() => SearchPage());
  }
}
