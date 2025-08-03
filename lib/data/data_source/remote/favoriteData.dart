import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class FavData {
  Crud crud;
  FavData(this.crud);

  Future addToFavorite(String productId, String userId) async {
    var response = await crud.postData(AppLinkApi.addToFav, {
      "product_id": productId,
      "user_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future deleteFromFavorite(String productId, String userId) async {
    var response = await crud.postData(AppLinkApi.deleteFav, {
      "product_id": productId,
      "user_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
