class AppLinkApi {
  static const String serverUrl =
      "https://qasimshutta.shop/2test/e-commerce-halfa";
  static const String catogeriesImageLink =
      "https://qasimshutta.shop/2test/e-commerce-halfa/upload/catogeries";
  static const String productsImageLink =
      "https://qasimshutta.shop/2test/e-commerce-halfa/upload/products";
  static const String usersImage =
      "https://qasimshutta.shop/2test/e-commerce-halfa/upload/users_images";
  static const String productsImageLinkWithoutBack =
      "https://qasimshutta.shop/2test/e-commerce-halfa/upload/products/product_without_back";
  static const String test = "$serverUrl/test.php";

  //--------------------------------Auth======================================
  static const String signUpLink = "$serverUrl/auth/signup.php";
  static const String signUpOtpLink = "$serverUrl/auth/varfy_code.php";
  static const String signInLink = "$serverUrl/auth/sign_in.php";
  static const String checkEmailReset =
      "$serverUrl/auth/forgot_password/check_email.php";
  static const String verfyCodeReset =
      "$serverUrl/auth/forgot_password/verfy_code_reset.php";
  static const String resetPassword =
      "$serverUrl/auth/forgot_password/reset_password.php";
  static const String home = "$serverUrl/home.php";

  //--------------------------------Products===================================
  static const String products = "$serverUrl/products/products.php";
  static const String addToFav = "$serverUrl/favorite/add.php";
  static const String deleteFav = "$serverUrl/favorite/delete.php";
  static const String viewFavProducts = "$serverUrl/favorite/view.php";
  //الفرق بين ال deleteFav and removeFav that when you want to use the deleteFav in the product page
  //There we just have the product_id and user_id so we use the delteFav
  //But in the favorite page we know the favoriteId so we use the removeFromFavoiret backend file.
  static const String removeFromFavorite = "$serverUrl/favorite/remove.php";
  static const String resendVerficationCode =
      "$serverUrl/auth/resend_verfy_code.php";
  static const String users = "$serverUrl/users.php";
  static const String addToCart = "$serverUrl/cart/add_cart.php";
  static const String deleteFromCart = "$serverUrl/cart/delete_cart.php";
  static const String cartView = "$serverUrl/cart/view_cart.php";
  static const String getProductCount = "$serverUrl/cart/get_count_product.php";
}
