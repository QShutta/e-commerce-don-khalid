//The job of this class is to handle
//the request to the server and return the response
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Crud {
  /// This method sends data to the server and returns a response.
  ///
  /// The return type can be either:
  /// - A Map containing the response data from the server, or
  /// - A StatusRequest indicating the status of the request (like success, failure, loading).

  /// Using Either lets us to be able to return to datatype either a StatusRequest (error/status)
  /// or data (Map).
  /// This makes handling success and error cleaner in one method.
  Future<Either<StautusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var res = await http.post(Uri.parse(linkUrl), body: data);
        print("Raw Status Code: ${res.statusCode}");
        print("Raw Body: ${res.body}");
        if (res.statusCode == 200 || res.statusCode == 201) {
          print("Response status code: ${res.statusCode}");
          // If the request is successful
          Map resBody = json.decode(res.body);
          print(
            " -------------------------------$resBody---------------------------",
          );
          return Right(resBody);
        } else {
          // If the request fails, return a failure status
          // with the error message from the server
          return Left(StautusRequest.serverFailure);
        }
      } else {
        // If there is no internet connection, return an offline failure status
        // This is a failure in the request, not in the server
        // so we return a Left with the StautusRequest.offlineFailure
        return Left(StautusRequest.offlineFailure);
      }
    } catch (e) {
      print("Server Exception: $e");
      return Left(StautusRequest.serverException);
    }
  }

  postRequestWithFile(
    String url,
    Map data,
    File file, {
    String? fileName,
    //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    String? oldImageName,
  }) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));

    var fileLenght = await file.length();
    var fileStream = http.ByteStream(file.openRead());

    var multiPartFile = http.MultipartFile(
      "user_image_url",
      fileStream,
      fileLenght,
      filename:
          fileName ?? basename(file.path), // ← استعمل الاسم اللي انت مررته
    );

    request.files.add(multiPartFile);

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    //دة بعمل شنو ؟
    if (oldImageName != null && oldImageName.isNotEmpty) {
      // If oldImageName has a value, add it to the request fields.
      // This sends the name of the old image to the server so it can delete
      // the old image after successfully uploading the new one.
      request.fields['old_image_name'] = oldImageName;
    }

    var myRequest = await request.send();

    var response = await http.Response.fromStream(myRequest);

    if (myRequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Error");
    }
  }

  //In the recomendation system we have to pass the data in the form of json so we create this method:
  Future<Either<StautusRequest, Map>> postDataAsJson(
    String linkUrl,
    Map data,
  ) async {
    try {
      if (await checkInternet()) {
        var res = await http.post(
          Uri.parse(linkUrl),
          headers: {"Content-Type": "application/json"},
          //The job of this line of code is to pass the data as json format not a map.
          //Because in the recomendation system we expect the data to be in json format.
          body: jsonEncode(data),
        );
        print("Raw Status Code: ${res.statusCode}");
        print("Raw Body: ${res.body}");
        if (res.statusCode == 200 || res.statusCode == 201) {
          print("Response status code: ${res.statusCode}");
          // If the request is successful
          Map resBody = json.decode(res.body);
          print(
            " -------------------------------$resBody---------------------------",
          );
          return Right(resBody);
        } else {
          // If the request fails, return a failure status
          // with the error message from the server
          return Left(StautusRequest.serverFailure);
        }
      } else {
        // If there is no internet connection, return an offline failure status
        // This is a failure in the request, not in the server
        // so we return a Left with the StautusRequest.offlineFailure
        return Left(StautusRequest.offlineFailure);
      }
    } catch (e) {
      print("Server Exception: $e");
      return Left(StautusRequest.serverException);
    }
  }
}
