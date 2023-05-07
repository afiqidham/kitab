import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos/services/api_service.dart';

class LoginViewModel extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isChecked = false.obs;

  // final _authError = Rx<AuthError?>(null);

  checkBoxChecked() {
    isChecked.value = !isChecked.value;
  }

  // void login() async {
  //   unfocusKeyboard(Get.context);
  //   _authError.value = null;

  //   if (formKey.currentState!.validate()) return;
  //   String errorMessage;

  //   EasyLoading.show();

  //   try{
  //     await AuthService.get.login(
  //       emailController.value.text,
  //       passwordController.value.text,
  //     );

  //     EasyLoading.dismiss();

  //     on DioError catch (error){
  //       errorMessage = "Please check your information";

  //       if (error.response.statusCode == 422){
  //         _authError.value = AuthError.fromJson(error.response.data['errors']??[]);
  //       }
  //     }  catch (error){
  //       errorMessage = "Try Again";
  //     }    finally {
  //       if(errorMessage != null)
  //       EasyLoading.showError(errorMessage);
  //     }
  //   }

  //   AuthError? get authError => _authError.value;

  //   List<String> get emailErrors => _authError.value != null [...authError.email] : [];
  //   List<String> get passwordErrors => _authError.value != null [...authError.password] : [];
  // }
}
