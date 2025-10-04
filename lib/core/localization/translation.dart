import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en": {
      "1": "Selection of the best products",
      "2": "We offer you the best products at the best prices",

      "3": "Secure and easy payment",
      "4": "Pay with confidence using secure and user-friendly options",
      "5": "Fast and secure delivery",
      "6": "We guarantee fast and secure delivery to your doorstep",
      "7": "Safe and Fast Delivery",
      "8":
          "We deliver your product fast and safe, and you’ll always be satisfied.",
      "9": "Next",
      "10": "CHOOSE YOUR LANGUAGE",
      "11": "ARABIC",
      "12": "ENGLISH",
      "13": "Sign In",
      "14": "Don't have an account?",
      "15": "Sign Up",
      "16": "Welcome Back",
      "17": "Please Sign In to Continue",
      "18": "Email Address",
      "19": "Enter You'r Email",
      "20": "Password",
      "21": "Enter You'r Password",
      "22": "Sign In",
      "23": "or Sign In with",
      "24": "Forgot Password?",
      "25": "Google",
      "26": "Facebook",
      "27": "Sign Up",
      "28": "Already have an account?",
      "30": "Create Account",
      "31": "Sign up to get started",
      "32": "Name",
      "33": "Enter You'r Name",
      "34": "Email Address",
      "35": "Enter You'r Email",
      "36": "Password",
      "37": "Enter You'r Password",
      "38": "Confirm Password",

      "39": "Please enter your email address to receive a verification code",
      "40": "Send",
      "41": "Enter Your\nVerification Code",
      // في
      //GetX،
      // لما تستخدم
      //.trParams()
      // لتعويض قيم في النص، لازم تحط علامة
      //@
      //قبل اسم المتغير في ملف الترجمة.
      // بدون علامة
      //@، GetX
      // ما حيستبدل القيمة وحيظهر النص حرفي.
      // يعني @
      //ضروري عشان
      //GetX
      // تعرف وين تحط القيمة المتغيرة (زي الإيميل هنا).
      // عشان بعد سنة اكان جيت راجع افهمو:
      // لو حذفت الـ
      // `@`
      // من النص، النص حيشتغل، لكن **ما حيكون في مكان واضح لتعويض قيمة الإيميل**.
      //
      // يعني لو النص بدون
      //`@email`
      //مثل:
      //
      // "42":
      //"تم إرسال رمز التحقق إلى بريدك:
      // email.
      // يمكنك التحقق من صندوق الوارد."
      //
      // في الحالة دي،
      //GetX
      // ما حيستبدل كلمة
      //`email`
      //بأي قيمة، حيطلع الكلام حرفي زي ما هو.
      //
      // ---
      //
      // لكن لو كتبتها:
      //
      // "42":
      // "تم إرسال رمز التحقق إلى بريدك:
      // @email.
      // يمكنك التحقق من صندوق الوارد."
      //
      // وبعدين استخدمت:
      //
      // "42".trParams({"email": otpCont.email})
      //
      // GetX
      //حيستبدل
      //`@email`
      // بالإيميل الحقيقي.
      //
      // ---
      //
      // **الخلاصة:**
      //
      // `@`
      // ضروري عشان
      //GetX
      // يعرف وين يستبدل القيمة.
      // * بدون `@` ما حيحصل استبدال، والإيميل ما حيظهر في النص.
      "42":
          "We sent a 6 digits verification code to your email: @email. You can check your inbox.",

      "43": "Verfy",
      "44": "I don't recive the code?Send a gain?",
      "45": "Create new Password",
      "46":
          "You'r previous password should be different from prevoius used passowrds",
      "47": "Create",
      "48": "Password Updated",
      "49": "Your Password has been Updated",
      "50": "Your Account Has Been Created Successfully",
      "51": "Welcome! You can now shop and enjoy our services.",
      "52": "Skip",
      "53": "This field is required",
      "54": "Please enter a valid email address",
      "55": "Please enter at least @min characters",
      "56": "Please enter no more than @max characters",
      "57": "Password must contain uppercase, lowercase, number, and symbol",
      "58": "Error",
      "59": "Password and Confirm Password do not match",
      "60": "Alert",
      "61": "Are you sure you want to exit?",
      "62": "Yes, Exit",
      "63": "Cancel",
      "64": "The email or password is incorrect",
      "65": "Warning",
      "66": "Error",
      "67": "An error occurred: @error",
      "68": "Please fill in all fields",
      "69": "Processing your request...",
      "70": "Email already exists",
      "71": "Name is required",
      "72": "Enter your name",
      "73": "Confirm your password",
      "74": "Sign Up and Get Started",
      "75": "Please make sure the passwords match",
      "76": "The verification code you entered is incorrect", // en
      "77": "This email is not registered",
      "100": "Categories",
      "101": "Jalabiyas",
      "102": "Tiyab",
      "103": "Sdirhat",
      "104": "Perfumes",
      "105": "Slippers",
      "106": "Suits",
      "107": "Shoes",
      "108": "Machine",
      "200": "Support Locale",
      "201": "Empower Local Prdoucts",
      "202": "Start you'r own business with us",
      "203": "Home",
      "204": "My Orders",
      "205": "Favorite",
      "206": "Settings",
      "207": "Products For You",
      "209": "Go To Cart",
      "210": "Price:",
      "211": "Total:",
      "212": "Checkout",
      "213": "Cart",
      "214": "Shpping", "215": "Search Products",

      "216": "Write the product name...",
      "217": "What did you are looking for?",
    },
    "ar": {
      "1": "اختيار أفضل المنتجات",
      "2": "نقدم لك\n أفضل المنتجات بأفضل الأسعار",
      "3": "دفع آمن وسهل",
      "4": "ادفع بثقة\n باستخدام خيارات آمنة وسهلة الاستخدام",
      "5": "توصيل سريع وآمن",
      "6": "نضمن لك\n توصيل سريع وآمن حتى باب منزلك",
      "7": "استلم طلبك وانت مطمن",
      "8": "اطلب واستلم \n وأنت مطمئن سلامة وجودة الخدمة أولويتنا",
      "9": "التالي",
      "10": "اختر لغتك المفضلة",
      "11": "العربية",
      "12": "الانجليزية",
      "13": "تسجيل الدخول",
      "14": "ما  عندك حساب؟",
      "15": "إنشاء حساب",
      "16": "حبابك",
      "17": "يرجى تسجيل الدخول للمتابعة",
      "18": "البريد الإلكتروني",
      "19": "أدخل بريدك الإلكتروني",
      "20": "كلمة المرور",
      "21": "أدخل كلمة المرور الخاصة بك",
      "22": "تسجيل دخول",
      "23": "او سجل بإستخدام",
      "24": "نسيت كلمة المرور؟",
      "25": "جوجل",
      "26": "فيسبوك",
      "27": "إنشاء حساب",
      "28": "عندك حساب؟",
      "30": "إنشاء حساب",
      "31": "سجل للبدء",
      "32": "الاسم",
      "33": "أدخل اسمك",
      "34": "البريد الإلكتروني",
      "35": "أدخل بريدك الإلكتروني",
      "36": "كلمة المرور",
      "37": "أدخل كلمة المرور",
      "38": "تأكيد كلمة المرور",

      "39": "الرجاء إدخال بريدك الإلكتروني لاستلام رمز التحقق",
      "40": "إرسال",
      "41": "أدخل رمز التحقق الخاص بك",
      // "42":
      //     "لقد أرسلنا رمز تحقق مكوّن من 6 أرقام إلى بريدك\nالإلكتروني abolkasm11@gmail.com. يمكنك التحقق\nمن صندوق الوارد لديك.",
      "42":
          "تم إرسال رمز التحقق إلى بريدك: @email. يمكنك التحقق من صندوق الوارد.",

      "43": "التحقق",
      "44": "لم أستلم الرمز؟ أرسل مرة أخرى؟",
      "45": "إنشاء كلمة مرور جديدة",
      "46": "يجب أن تكون كلمة المرور الجديدة مختلفة عن الكلمات السابقة",
      "47": "إنشاء",
      "48": "تم تحديث كلمة المرور",
      "49": "تم تحديث كلمة المرور بنجاح",
      "50": "تم إنشاء حسابك بنجاح",
      "51": "يمكنك الآن التسوق والاستمتاع بخدماتنا",
      "52": "تخطي",
      "53": "هذا الحقل مطلوب",
      "54": "الرجاء إدخال بريد إلكتروني صالح",
      "55": "الرجاء إدخال على الأقل @min حروف",
      "56": "الرجاء عدم إدخال أكثر من @max حروف",
      "57": "يجب أن تحتوي كلمة المرور على حرف كبير وصغير\n ورقم ورمز",
      "58": "خطأ",
      "59": "كلمة المرور وتأكيد كلمة المرور غير متطابقين",
      "60": "تنبيه",
      "61": "هل أنت متأكد أنك تريد الخروج؟",
      "62": "نعم، أخرج",
      "63": "إلغاء",
      "64": "البريد الإلكتروني أو كلمة المرور غير صحيحة",
      "65": "تحذير",
      "66": "خطأ",
      "67": "حدث خطأ: @error",
      "68": "يرجى ملء جميع الحقول",
      "69": "جاري معالجة طلبك...",
      "70": "البريد الإلكتروني مستخدم بالفعل",
      "71": "الاسم مطلوب",
      "72": "أدخل اسمك",
      "73": "أكد كلمة المرور الخاصة بك",
      "74": "سجل وابدأ الآن",
      "75": "يرجى التأكد من تطابق كلمتي المرور",
      "76": "رمز التحقق الذي أدخلته غير صحيح", // ar
      "77": "هذا البريد الإلكتروني غير مسجل",
      "100": "الأصناف",
      "101": "جلاليب",
      "102": "تياب",
      "103": "سديرهات",
      "104": "عطور",
      "105": "شباشب",
      "106": "بدل",
      "107": "احذية",
      "108": "ماكينات",
      "200": "ادعم منتج بلدك",
      "201": "تمكين الإنتاج المحلي",
      "202": "ابدأ عملك الخاص معانا",
      "203": "الرئيسية",
      "204": "طلباتي",
      "205": "المفضلة",
      "206": "الضبط",
      "207": "الحاجات الميريا",
      "209": "الذهاب إلي السلة",
      "210": "السعر",
      "211": "الإجمالي:",
      "212": "إتمام الشراء",
      "213": "سلة المشتريات",
      "214": "رسوم التوصيل",
      "215": "بحث المنتجات",
      "216": "اكتب اسم المنتج...",
      "217": "بتفتش في شنو ؟",
    },
  };
}
