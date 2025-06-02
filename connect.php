<?php
// Replace these variables with your actual database credentials
$dsn = 'mysql:host=localhost;dbname=e-commerce-halfa';
$username = 'root';
$password = '';
// خيارات إضافية للاتصال،
// هنا بنحدد ترميز 
// UTF-8
//  عشان ندعم اللغة العربية بشكل صحيح
$options = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8");
// -------------------------
// 🔄 Pagination (التقسيم الصفحي):
// دا عدد العناصر (مثلاً المنتجات أو المقالات) العايز أعرضها في كل صفحة.
// مثلاً لو عندي 100 منتج، وأعرض 9 بس في كل صفحة، حاحتاج أكتر من صفحة.
// الصفحة الأولى: 1 - 9
// الصفحة الثانية: 10 - 18
// وهكذا...
$countrowinpage = 9;

try {
    $con = new PDO($dsn,     $username, $password,$options);

    
    // بنحدد إنو لو حصل أي خطأ في الاتصال أو تنفيذ الاستعلامات، يتم إطلاق استثناء 
    // (Exception)
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //عشان ما ك مرة نحتجا اننا نستخدم الملف بتاع الدوال .تاني نجي نعمل ليهو :
    //include
    //بنختصر الموضوع باننا نعمل ليهو 
    //include
    //هنا مرة واحدة وبس .
    include "functions.php";

       // السماح لأي موقع خارجي إنه يتصل بهذا الملف
    header("Access-Control-Allow-Origin: *");

    // السماح بإرسال بيانات معيّنة في الهيدر زي Content-Type (JSON) أو Authorization
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

    // السماح باستخدام أنواع محددة من الطلبات:
    //  POST (إرسال بيانات)، GET (قراءة بيانات)، OPTIONS (طلب استكشافي)
    header("Access-Control-Allow-Methods: POST, OPTIONS , GET");
// ✅ لو المتغير 
// $notAuth
//  ما موجود، معناها الصفحة دي محتاجة حماية 
// بنجهز لاستدعاء دالة 
// checkAuthenticate()
//  عشان نتأكد إنو الزول مسجل دخول 
// لو عايز تلغي الحماية في صفحة معينة، بس أكتب 
// $notAuth = true;
//  في بداية الصفحة
// (بنخليها معلّقة كتعليق لحدي ما نحتاجها فعليًا في ملفات الحماية)
if (!isset($notAuth)) {
    //نحنا موقفين الحماية لية ؟
    //الحماية دي احنا حنشغلها فقط قبلا ما نرفع الشغل علي السيرفر 
    //نحنا اسي عاوزنو مش محمي لية ؟عشان نقدر نصل ليهو بسهولة  اكبر من خلال
    //thunderclinent or postman
    // checkAuthenticate(); // دالة التحقق من صلاحية المستخدم (login/auth)
} // checkAuthenticate();
    
} catch (PDOException $e) {
    // Error occurred, display the error message
    //-> == .
    echo "Connection failed: " . $e->getMessage();
}
?>
