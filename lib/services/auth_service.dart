// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class AuthService extends GetxController {
//   static AuthService get = Get.find();

//   final _apiService = ApiService();
//   final storage = GetStorage();

//   final _token = Rx<String?>(null);
//   final _user = Rx<User?>(null);

//   @override
//   void onInit() {
//     ever(_token, handleTokenChanged);
//     ever(_user, handleAuthChanged);
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     attemptLoginWithSavedToken();
//     super.onReady();
//   }

//   Future<bool?> login(String username, String password) async {
//     try {
//       final response = await _apiService.login(username, password);

//       if (response.data.apiToken == null) return false;

//       _user.value = response.data.user;
//       _token.value = response.data.apiToken;

//       return true;
//     } catch (error) {
//       if (kDebugMode) print(error);
//       rethrow;
//     }
//   }

//   Future<bool> attemptLoginWithSavedToken() async {

//     _token.value = GetStorage().read('API_TOKEN');

//     if (token == null) {
//       _user.value = null;
//       print('dsa');
//       return false;
//     }

//     if (kDebugMode) print('Attempting to log in with Token: $token');

//     try {
//       final response = await _apiService.fetchUserByToken(token!);
//       _user.value = response;
//       return true;
//     } catch (error) {
//       if (kDebugMode) {
//         print(
//           "[AuthService][AttemptLoginWithSavedToken] Failed to fetch user: $error",
//         );
//       }
//     }

//     _user.value = null;
//     return false;
//   }

//   Future<bool> register(dio.FormData formData) async {
//     try {
//       final response = await _apiService.register(formData);

//       if (response.data.apiToken == null) return false;

//       _user.value = response.data.user;
//       _token.value = response.data.apiToken;

//       return true;
//     } catch (error) {
//       if (kDebugMode) print(error);
//       rethrow;
//     }
//   }

//   void logout() async {
//     _user.value = _token.value = null;
//     storage.remove('API_TOKEN');
//   }

//   handleTokenChanged(val) {
//     storage.write('API_TOKEN', val);
//     print('[AUTH_TOKEN]: $val');
//   }

//   handleAuthChanged(val) {
//     User? user = val;

//     if (user == null) {
//       return Get.offAllNamed(RouteUtil.landing);
//     }

//     return Get.offAllNamed(
//         user.isVerified ? RouteUtil.home : RouteUtil.incompleteRegisteration);
//   }

//   String? get token => _token.value;
//   User? get user => _user.value;
// }