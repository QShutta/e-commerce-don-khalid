import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';

class FavData {
  Crud crud;
  FavData(this.crud);

  Future addToFavorite(userId, productId) async {
    var response = await crud.postData(AppLinkApi.addToFav, {
      "user_id": userId,
      "product_id": productId,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future deleteFromFavorite(userId, productId) async {
    var response = await crud.postData(AppLinkApi.deleteFav, {
      "user_id": userId,
      "product_id": productId,
    });
    return response.fold((l) => l, (r) => r);
  }

  //الفرق بين ال deleteFav and removeFav that when you want to use the deleteFav in the product page
  //There we just have the product_id and user_id so we use the delteFav
  //But in the favorite page we know the favoriteId so we use the removeFromFavoiret backend file.
  Future removeFromFavorite(favoriteId) async {
    var response = await crud.postData(AppLinkApi.removeFromFavorite, {
      "favorite_id": favoriteId,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future getData(userId) async {
    var response = await crud.postData(AppLinkApi.viewFavProducts, {
      "user_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
