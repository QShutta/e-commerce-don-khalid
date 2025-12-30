import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart' ; 
class AppAuth {
  LocalAuthentication auth = LocalAuthentication() ; 
  Future<bool> checkBiometrics()  async{
   bool isAvailable = await auth.canCheckBiometrics ; 
   bool isDeviceSupported = await auth.isDeviceSupported() ; 
   return isAvailable || isDeviceSupported ; 
  }
   Future<bool>  authLogin() async {
        try {
   bool checkCapabiltes = await checkBiometrics();
   List biometerics = await auth.getAvailableBiometrics() ; 
   if(checkCapabiltes) {
     if(biometerics.isEmpty) {
              Get.defaultDialog(
            title: 'Message' , 
            middleText: 'The Biometric Authentication is not Enable Please Enable it in Settings' , 
            textCancel: 'OK' , 
          ) ; 
     return false ; 
     }else {
    return await auth.authenticate(localizedReason: "Hi Please Pass your finger to Login " , biometricOnly: true) ; 
     }
   }
   else {
      Get.defaultDialog(
            title: 'Message' , 
            middleText: 'Your Device is not Supported Biometric' , 
            textCancel: 'OK' , 

          ) ; 
    return false ;  
   }
        } 
                    on LocalAuthException catch (e) {
               if (e.code == LocalAuthExceptionCode.noBiometricHardware) {
                    Get.defaultDialog(
                         title: 'Message',
                         middleText: 'Your Device is not Supported Biometric',
                         textCancel: 'OK',
                    );
               } else if (e.code == LocalAuthExceptionCode.biometricHardwareTemporarilyUnavailable) {
                    Get.defaultDialog(
                         title: 'Message',
                         middleText: 'The Biometric Feature is not Available Currently',
                         textCancel: 'OK',
                    );
               }
               return false;
          } catch (e, st) {
               // Catch any other unexpected errors from the local_auth package or platform channels
               print('Unexpected exception in authLogin: $e');
               print(st);
               Get.defaultDialog(
                    title: 'Error',
                    middleText: 'Biometric authentication failed: ${e.toString()}',
                    textCancel: 'OK',
               );
               return false;
          }

        
     }
}