import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/products_data.dart';
import 'package:e_commerce_halfa/data/model/catogeries_model.dart';
import 'package:e_commerce_halfa/data/model/products_model.dart';
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
}

class ProductsControllerImp extends ProductsController {
  List<Catogeries>? catogeriesList;
  int? selectedCat;
  String? productCat;
  StautusRequest statusRequest = StautusRequest.none;
  ProductData productData = ProductData(Get.find());
  List<ProductsModel>? producstsLis = [];
  MyServices myServices = Get.find();
  String? userId;
  @override
  getData() async {
    print(
      '--------------------------inside of the getData()--------------------------',
    );
    statusRequest = StautusRequest.loading;
    update();
    var response = await productData.getData(productCat!, userId!);
    statusRequest = handlingStatusRequest(response);
    print("you'r status request is : $statusRequest");
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
  void onInit() {
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
  goToProductDetails(productDetails) {
    Get.toNamed(
      AppRoutes.productDetails,
      arguments: {"productDetails": productDetails},
    );
  }
}
