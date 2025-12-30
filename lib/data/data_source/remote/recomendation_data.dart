import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class RecomendationData {
  Crud crud;
  RecomendationData(this.crud);
  //topN is an optional named parameter with a default value = 5.
  Future getData(String userId, {String topN = "5"}) async {
    var response = await crud.postDataAsJson(AppLinkApi.recommendation, {
      "user_id": userId,
      "top_n": topN,
    });
    return response.fold((l) => l, (r) => r);
  }
}
