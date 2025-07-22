//The job of this class is to handle
//the request to the server and return the response
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

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
      print("Error occurred: $e");
      return Left(StautusRequest.serverException);
    }
  }
}
