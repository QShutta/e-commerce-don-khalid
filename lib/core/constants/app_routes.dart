class AppRoutes {
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String languageSelection = '/';
  static const String onBoarding = '/onBoarding';

  // 🔐 Forgot Password Flow
  static const String forgotPasswordEmail = '/forgotPasswordEmail';
  static const String forgotPasswordOtp = '/forgotPasswordOtp';
  static const String resetPassword = '/resetPassword';
  static const String passwordResetSuccess = '/passwordResetSuccess';
  static const String successSignUp = '/successSignUp';
  static const String signUpEmail = '/signUpEmail';
  static const String signUpOtp = '/signUpOtp';

  //Home here we mean by it the home with bottom nav bar.
  static const String home = '/home';
  //Why did you didn't add a root for the homewithoutbottomNavBar?
  //Because of what?the homewithoutbottomnav is displayed inside of the home so.there is no need to create a seprate root for it.
  static const String productsRoot = '/products';
  static const String productDetails = '/productDetails';
  static const String favorite = '/favirute';
  static const String favoriteProductDetails = '/favoriteProductDetails';
  static const String cart = '/cart';
  static const String search = '/search';

  //------------------------Address------------------------------

  static const String viewAddress = '/view';
  static const String addAddress = '/add';
  static const String addAddressDetails = '/addressDetails';
  static const String updateAddressDetails = '/updateAddressDetails';
  static const String updateAddressDetailsMap = '/updateAddressDetailsMap';
  //--------------------------
  static const String checkout = '/checkout';
  //------------------------------------orderDetails------------------------------

  static const String orderDetails = '/orderDetails';
  //----------------------------------------------------------
  static const String offersPageLink = '/OffersPage';
  static const String recommendationSection = "/recommendationSection";
  static const String recommendationDetails = "/recommendationProductDetails";
}
