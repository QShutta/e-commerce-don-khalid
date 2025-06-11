import 'package:e_commerce_halfa/core/class/stautus_request.dart';

handlingStatusRequest(response) {
  if (response is StautusRequest) {
    return response;
  } else {
    return StautusRequest.success;
  }
}
