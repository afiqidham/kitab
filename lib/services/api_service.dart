// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:get/get_connect/connect.dart';

// class ApiService with ErrorPrinter {
//   late Dio _dio;

//   ApiService() {
//     _dio = Dio()
//       ..options.baseUrl = AppUtil.apiBaseUrl
//       ..options.headers = {'Accept': 'application/json'};
//     // ..options.validateStatus = (statusCode) {
//     //   if (statusCode == null) return false;
//     //   if (statusCode >= 200 && statusCode < 500) return true;
//     //   return false;
//     // };
//     _dio.interceptors.add(AppInterceptors());
//   }

//   // Future<FPXBankScreenResponse> fetchFpxBanks(List<int> bills) async {
//   //   final response = await _dio.post(AppUtil.apiURL('fpx/banks'), data: {
//   //     'bills': bills,
//   //   });
//   //   return FPXBankScreenResponse.fromJson(response.data);
//   // }

//   // Future<bool> preFPXUpdateTransaction(Map<String, dynamic> data) async {
//   //   final response = await _dio.post(
//   //     AppUtil.apiURL('fpx/pre-fpx-update'),
//   //     data: data,
//   //   );

//   //   if (response.statusCode != 200) throw response.statusCode!;

//   //   return true;
//   // }

//   // Future<Transaction> fetchReceiptScreen(String orderNumber) async {
//   //   final response =
//   //       await _dio.get(AppUtil.apiURL('fpx/receipt'), queryParameters: {
//   //     'order_number': orderNumber,
//   //   });
//   //   return Transaction.fromJson(response.data);
//   // }

//   // Future<FPXConfirmationScreenResponse> fetchFpxConfirmationScreen(
//   //   Map<String, dynamic> data,
//   // ) async {
//   //   final response = await _dio.post(
//   //     AppUtil.apiURL('fpx/initiate'),
//   //     data: data,
//   //   );

//   //   return FPXConfirmationScreenResponse.fromJson(response.data);
//   // }



//   Future<bool> addToCart(int applicationId, double amount) async {
//     final response = await _dio.post(AppUtil.apiURL('cart/add'), data: {
//       'application_id': applicationId,
//       'amount': amount,
//     });

//     return response.statusCode! >= 200 && response.statusCode! <= 299;
//   }

//   Future<bool> removeCartItem(int id) async {
//     final response = await _dio.delete(AppUtil.apiURL('cart/$id'));
//     return response.statusCode! >= 200 && response.statusCode! <= 299;
//   }

//   Future<Map<int, CartItem>> fetchCartItems() async {
//     final response = await _dio.get(AppUtil.apiURL('cart'));

//     return (response.data as List<dynamic>).asMap().map((_, data) {
//       final cart = CartItem.fromJson(data);
//       return MapEntry(cart.id, cart);
//     });
//   }

//   // Future<HomeScreenResponse> fetchHomeScreen() async {
//   //   final response = await _dio.get(AppUtil.apiURL(ApiRouteUtil.homeScreen));
//   //   return HomeScreenResponse.fromJson(response.data);
//   // }



//   Future<User> fetchUserByToken(String token) async {
//     final response = await _dio.get(AppUtil.apiURL("auth/user"));
//     return User.fromJson(response.data);
//   }

//   Future<AuthResponse> login(String username, String password) async {
//     final response = await _dio.post(AppUtil.apiURL(ApiRouteUtil.login), data: {
//       'email': username,
//       'password': password,
//     });
//     return AuthResponse.fromJson(response.data);
//   }

//   Future<AuthResponse> register(formData) async {
//     final response =
//         await _dio.post(AppUtil.apiURL(ApiRouteUtil.register), data: formData);
//     return AuthResponse.fromJson(response.data);
//   }
// }

// class AppInterceptors extends InterceptorsWrapper {
//   @override
//   Future onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final apiToken = AuthService.get.token;

//     if (apiToken == null) {
//       log('trying to send request without token exist!');
//       return super.onRequest(options, handler);
//     }

//     options.headers["Authorization"] = "Bearer $apiToken";
//     return super.onRequest(options, handler);
//   }

//   @override
//   onResponse(Response response, ResponseInterceptorHandler handler) {
//     return super.onResponse(response, handler);
//   }
// }