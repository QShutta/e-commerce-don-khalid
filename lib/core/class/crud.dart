import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_halfa/core/class/stauts_requet.dart';
import 'package:e_commerce_halfa/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class CRUD {
  Future<Either<StatusRequest, Map>> postData(
    String linkUrl,
    Map<String, dynamic> data,
  ) async {
    try {
      if (checkInternet()) {
        var res = await http.post(Uri.parse(linkUrl), body: data);
        if (res.statusCode == 200 || res.statusCode == 201) {
          var responseBody = jsonDecode(res.body);
          return Right(responseBody);
        } else {
          return Left(StatusRequest.serverFailure);
        }
      } else {
        return Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return Left(StatusRequest.serverFailure);
    }
  }
}
