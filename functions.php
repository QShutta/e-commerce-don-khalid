
<?php
 define("MP",1048576);
//This method is for security purpose.
//In summary, the filterRequest function takes a user input
// (specified by $requestName), filters out any potential harmful
// content by converting special characters to HTML entities and removing HTML/PHP tags.
function filterRequest($requestName){
    return  htmlspecialchars(strip_tags($_POST[$requestName]));
}

function failureMessage($message){
    echo json_encode(array("status"=>"failure","message"=>$message));
}
//Why did you say $json=true?
//because of in the case of i want to use this function to get the "catogeries,products" for the home page
//i wnat to change the way of the print.
function getAllData($table, $where = null, $values = null,$json=true)
{
    //connection to the database instance
    global $con;
    //Array to save the data that will come from the db in it .
    $data = array();
    //statment of getting the data from the datbase.
    //لو المستخدم خت "وير" في الحالة دي حنرجع ليهو البيانات حسب شرط معين ,غير كدة حنرجع ليهو كل البيانات .
    if($where==null){

        $stmt = $con->prepare("SELECT  * FROM $table ");
    }else{

        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    }
    $stmt->execute($values);
    //This to bring the data in associative format
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $count  = $stmt->rowCount();
    /*
 * هنا عاملين شرط على المتغير 
 * $json 
 * عشان نحدد طريقة إرجاع البيانات من الدالة.
 * 
 * لما يكون 
 * $json = true
 *  (الافتراضي)، الدالة حتطبع النتيجة بصيغة 
 * JSON.
 * دا مفيد جداً لما الدالة تستخدم في 
 * API أو في تطبيقات زي 
 * React, Flutter, 
 * أو أي مكان بيحتاج بيانات بصيغة JSON.
 * 
 * أما لو 
 * $json = false، 
 * الدالة ما بتطبع شيء، لكن بترجع البيانات كمصفوفة 
 * PHP عادية.
 * دا بيسمح لينا نستخدم البيانات جوه كود 
 * PHP 
 * نفسه، زي في صفحات الإدارة أو أي مكان عايزين نتعامل مع البيانات بشكل مباشر.
 * 
 * يعني الشرط دا بيخلينا نتحكم في شكل النتيجة حسب استخدامنا.
 * فلو دايرين نرسل البيانات للواجهة أو لتطبيق خارجي بنستخدم JSON،
 * ولو عايزين نشتغل بيها جوه الخادم بنرجعها كمصفوفة.
 */
    if($json==true){
        if ($count > 0){
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
         
    return $count;
    }else if($json==false){
        if ($count > 0){
          return $data;
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
   
}


//What the fcack why did he set the json =true?xxxxxxxxxxxxxxxx
function insertData($table, $data, $json = true)
{

    echo "-------------------------------------------";
    echo "test withere the method is called or not";
    echo "-------------------------------------------";
     // هنا بنستخدم 
     // global $con
     // عشان نقدر نستخدم الاتصال بقاعدة البيانات 
     // $con
     //  اللي اتعمل في ملف 
     // connect.php
     //  في الدالة دي.
    global $con;
     // هنا بنمشي على كل عنصر في المصفوفة 
     // $data
    // $field
    //  حيكون اسم العمود 
    // (مثلاً name أو age)
 
    foreach ($data as $field => $v)
    // بنضيف قبل اسم العمود علامة ":" ونخزن الناتج في مصفوفة جديدة اسمها 
    // $ins
        $ins[] = ':' . $field;

    // هنا بنحوّل مصفوفة 
    // $ins
    //  (مثلاً [":name", ":age"])
    // إلى نص مفصول بفواصل 
    // ":name,:age"
    $ins = implode(',', $ins);

    // هنا بنجيب أسماء الأعمدة 
    // (يعني المفاتيح من المصفوفة $data)
    //  ونحولهم إلى نص مفصول بفواصل 
    // "name,age"
    $fields = implode(',', array_keys($data));
 // هنا بنكتب جملة 
 // SQL
 //عشان ندخل بيانات في جدول معين.
// $table
//  هو اسم الجدول، مثلاً 
// "users"
// $fields 
// هي أسماء الأعمدة، مثلاً 
// "name,age"
// $ins
//  هي أماكن البيانات الفاضية، مثلاً 
// ":name,:age"

// مثال:
// "INSERT INTO users (name,age) VALUES (:name,:age)"

// prepare() هنا بيجهز الجملة دي عشان ننفذها بعدين.
// يعني بنقول للـ PHP: "جهز الجملة دي، لكن ما تنفذهاش دلوقتي"

// $stmt = $con->prepare($sql);

    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
           // ربط القيمة 
           // ($v) 
           // بالمتغير الوهمي 
           // (مثل :name)
           //  في الجملة المُعدة.


        // ':' . $f
        //  يُنشئ اسم المتغير الوهمي 
        // (مثل :name)
        //  بإضافة ":" إلى اسم العمود 
        // ($f).
        // $v
        //  هي القيمة الفعلية 
        // (مثل "John" أو 25) 
        // المراد إدخالها.
        // هذا السطر يضمن إدخال البيانات بأمان لمنع هجمات الحقن البرمجي 
        // (SQL Injection).
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
  
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    //لو كانت 
    // false
    // ، يعني ما داير ترجع رد بصيغة 
    // JSON،
    //  فالكود ما حيطبع أي حاجة للمستخدم.
//لكن برضو حيرجع عدد الصفوف المتأثرة 
// ($count) 
// من الدالة، يعني ممكن تستخدمها داخليًا في الكود بدون طباعة أي شيء.

    return $count;
}


function updateData($table, $data, $where, $json = true)
{
    global $con;
    $cols = array();
    $vals = array();

    // هنا بنمشي على كل عنصر في المصفوفة
    // $data
    //  (اللي هي البيانات الجديدة اللي عايزين نحدثها)
    // $key
    //  هو اسم العمود
    // (مثلاً "name" أو "age")

    foreach ($data as $key => $val) {

        // بنضيف اسم العمود مع علامة "=" وقيمة المتغير الوهمي
        // (مثلاً "name = :name")
        // $vals
        //  هي مصفوفة حتحتوي على القيم الفعلية اللي حندخلها في الجدول.
        // $val
        //  هي القيمة الجديدة للعمو
        $vals[] = "$val";
        // هنا بنضيف اسم العمود مع علامة "=" وقيمة المتغير الوهمي
        // (مثلاً "name = :name")
        // هذا السطر يضمن أن كل عمود في الجدول سيتم تحديثه بالقيمة الجديدة.


        $cols[] = "`$key` =  ? ";
    }
    $sql = "UPDATE $table SET " . implode(', ', $cols) . " WHERE $where";

    $stmt = $con->prepare($sql);
    $stmt->execute($vals);
    $count = $stmt->rowCount();
    if ($json == true) {
    if ($count > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "failure"));
    }
    }
    return $count;
}


function deleteData($table, $where, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

function uploadeImage($requestName){
    //*The first things is recive the image data like "name,type,size,temp location".
    $imageName  = $_FILES[$requestName]['name'];
    $tmpLocation= $_FILES[$requestName]['tmp_name'];
    $imageSize  = $_FILES[$requestName]['size'];
    //We make it global var so it can be accessable outside the function.
    global $errorMsg;
    //This var will containe the allowed extend for the image.
    $allowExt   = array("jpg","png","gif","jpeg");
 //أكيد، هذا هو السطر مع التعليق المضاف بشكل مرتب يمكنك نسخه مباشرة في الكود:


// هنا نستخدم الدالة explode لفصل اسم الصورة عن امتدادها.
// نفترض أن $imageName = "cat.png".
// explode(".", $imageName) بتقسم النص عند كل نقطة ".".
// فتصبح النتيجة مصفوفة مثل ["cat", "png"].
// الهدف هو استخراج امتداد الصورة (مثل png) للتحقق من نوع الملف.
    $strToArray = explode(".", $imageName);


    //2-Get the last element in the array and it's the "extend".
    $ext=end($strToArray);
    //3-Make sure that the extend in lower case:
    $ext=strtolower($ext);
// هنا بنتأكد إنو اسم الصورة مش فاضي (يعني في صورة مرفوعة)
// وبنشيك إذا كان امتداد الصورة 
// $ext 
// مش موجود ضمن الامتدادات المسموحة 
// $allowExt
// لو الامتداد غير مسموح، الشرط حيكون صحيح ونضيف رسالة خطأ
if (!empty($imageName) && !in_array($ext, $allowExt)) {

       $errorMsg[]="File type is not allowed"; 
    }
    //Make sure that the image size is the allowed image size
    if($imageSize> 2*MP){
        $errorMsg[]="Image size is greter than the allowed size";
    }
    if(empty($errorMsg)){
        //The "move_uploaded" file method is use to upload the files to the server and it takes:
        //1-المسار المؤقت
        //2-المسار الذي سيتم وضع الملف فية في السيرفر.
        //note the '.' sympoal is use for concatnation.
        //Note:because of we are working in a lcoal server
        //the "upload" folder will represent the folder that we will save the image on it.
        move_uploaded_file($tmpLocation,"upload".$imageName);
    }else{
        echo '<pre>';
        print_r($errorMsg);
        echo '/pre';
    }
    
}


   function deleteImage($dir,$imageName){
    //This method is use to delete the image from the server.
    //We will use the "unlink" method to delete the image.
    //The unlink method take the path of the image that we want to delete.
    if(file_exists($dir."/".$imageName)){
        unlink($dir."/".$imageName);
    }}


//الدالة دي ما مفترض تحظها مفترض بس تعرف كيف تتعامل معاها :
//By using this method we will secure our api with username & password.
function checkAuthenticate(){
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
//Here we will just add the "username&password" for securing our sever and this username&password.
//shoud also be added in flutter app.
        if ($_SERVER['PHP_AUTH_USER'] != "qasim" ||  $_SERVER['PHP_AUTH_PW'] != "qasim#0909"){
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }
}
?>