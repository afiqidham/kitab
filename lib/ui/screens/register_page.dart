// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isar/isar.dart';
// import 'package:pos/model/user/user.dart';
// import 'package:pos/service/isar_service.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key, required this.isarService}) : super(key: key);

//   final IsarService isarService;

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final GlobalKey<FormState> formKey = GlobalKey();

//   TextEditingController firstTextEditingController = TextEditingController();
//   TextEditingController lastTextEditingController = TextEditingController();
//   TextEditingController emailTextEditingController = TextEditingController();
//   TextEditingController passwordTextEditingController = TextEditingController();
//   TextEditingController phoneTextEditingController = TextEditingController();
//   TextEditingController positionTextEditingController = TextEditingController();

//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xff17161f),
//         body: Center(
//           child: SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.only(
//                   left: 100, right: 100, top: 40, bottom: 40),
//               margin: const EdgeInsets.only(
//                   left: 150, right: 150, top: 40, bottom: 60),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: const Color(0xff1f2029),
//               ),
//               child: Column(children: <Widget>[
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const CircleAvatar(
//                   radius: 95,
//                   backgroundColor: Colors.red,
//                   child: CircleAvatar(
//                     radius: 90,
//                     backgroundImage: AssetImage("images/logo.png"),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 const Text(
//                   "Staff Register",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'Bubblegum',
//                       fontSize: 20),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 350,
//                       height: 100,
//                       child: TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         controller: firstTextEditingController,
//                         keyboardType: TextInputType.text,
//                         validator: (value) {
//                           if (!GetUtils.isAlphabetOnly(value!)) {
//                             return "First name is not valid";
//                           } else {
//                             return null;
//                           }
//                         },
//                         style: const TextStyle(color: Colors.white),
//                         decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.black12,
//                             suffixIcon: const Icon(Icons.person),
//                             labelText: 'First Name',
//                             hintText: 'Enter your first name',
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             hintStyle: const TextStyle(
//                               color: Colors.white54,
//                             ),
//                             labelStyle: const TextStyle(
//                                 color: Colors.white, fontSize: 16),
//                             suffixIconColor: MaterialStateColor.resolveWith(
//                                 (states) =>
//                                     states.contains(MaterialState.focused)
//                                         ? Colors.red
//                                         : Colors.black)),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     SizedBox(
//                       width: 350,
//                       height: 100,
//                       child: TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         controller: lastTextEditingController,
//                         keyboardType: TextInputType.text,
//                         validator: (value) {
//                           if (!GetUtils.isAlphabetOnly(value!)) {
//                             return "Last name is not valid";
//                           } else {
//                             return null;
//                           }
//                         },
//                         style: const TextStyle(color: Colors.white),
//                         decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.black12,
//                             suffixIcon: const Icon(Icons.person),
//                             labelText: 'Last Name',
//                             hintText: 'Enter your last name',
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             hintStyle: const TextStyle(
//                               color: Colors.white54,
//                             ),
//                             labelStyle: const TextStyle(
//                                 color: Colors.white, fontSize: 16),
//                             suffixIconColor: MaterialStateColor.resolveWith(
//                                 (states) =>
//                                     states.contains(MaterialState.focused)
//                                         ? Colors.red
//                                         : Colors.black)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 350,
//                       height: 100,
//                       child: TextFormField(
//                         key: formKey,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         controller: emailTextEditingController,
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           if (!GetUtils.isEmail(value!)) {
//                             return "Email is not valid";
//                           } else {
//                             return null;
//                           }
//                         },
//                         style: const TextStyle(color: Colors.white),
//                         decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.black12,
//                             suffixIcon: const Icon(Icons.email),
//                             labelText: 'Email',
//                             hintText: 'Enter your email',
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             hintStyle: const TextStyle(
//                               color: Colors.white54,
//                             ),
//                             labelStyle: const TextStyle(
//                                 color: Colors.white, fontSize: 16),
//                             suffixIconColor: MaterialStateColor.resolveWith(
//                                 (states) =>
//                                     states.contains(MaterialState.focused)
//                                         ? Colors.red
//                                         : Colors.black)),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     SizedBox(
//                       width: 350,
//                       height: 100,
//                       child: TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         controller: phoneTextEditingController,
//                         keyboardType: TextInputType.phone,
//                         validator: (value) {
//                           if (!GetUtils.isPhoneNumber(value!)) {
//                             return "Phone Number is not valid";
//                           } else {
//                             return null;
//                           }
//                         },
//                         style: const TextStyle(color: Colors.white),
//                         decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.black12,
//                             suffixIcon: const Icon(Icons.phone_android),
//                             labelText: 'Phone Number',
//                             hintText: 'Enter your phone number',
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             hintStyle: const TextStyle(
//                               color: Colors.white54,
//                             ),
//                             labelStyle: const TextStyle(
//                                 color: Colors.white, fontSize: 16),
//                             suffixIconColor: MaterialStateColor.resolveWith(
//                                 (states) =>
//                                     states.contains(MaterialState.focused)
//                                         ? Colors.red
//                                         : Colors.black)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 350,
//                       height: 100,
//                       child: TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         controller: passwordTextEditingController,
//                         keyboardType: TextInputType.visiblePassword,
//                         obscureText: true,
//                         validator: (value) {
//                           if (!GetUtils.isLengthGreaterThan(value, 5)) {
//                             return "Password is not valid";
//                           } else {
//                             return null;
//                           }
//                         },
//                         style: const TextStyle(
//                           color: Colors.white,
//                         ),
//                         decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.black12,
//                             suffixIcon: const Icon(Icons.password),
//                             labelText: 'Password',
//                             hintText: 'Enter your password',
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             hintStyle: const TextStyle(
//                               color: Colors.white54,
//                             ),
//                             labelStyle: const TextStyle(
//                                 color: Colors.white, fontSize: 16),
//                             suffixIconColor: MaterialStateColor.resolveWith(
//                                 (states) =>
//                                     states.contains(MaterialState.focused)
//                                         ? Colors.red
//                                         : Colors.black)),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     SizedBox(
//                       width: 350,
//                       height: 100,
//                       child: TextFormField(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         controller: positionTextEditingController,
//                         keyboardType: TextInputType.text,
//                         validator: (value) {
//                           if (!GetUtils.isAlphabetOnly(value!)) {
//                             return "Position is not valid";
//                           } else {
//                             return null;
//                           }
//                         },
//                         style: const TextStyle(
//                           color: Colors.white,
//                         ),
//                         decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.black12,
//                             suffixIcon: const Icon(Icons.work),
//                             labelText: 'Position',
//                             hintText: 'Enter your position',
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             hintStyle: const TextStyle(
//                               color: Colors.white54,
//                             ),
//                             labelStyle: const TextStyle(
//                                 color: Colors.white, fontSize: 16),
//                             suffixIconColor: MaterialStateColor.resolveWith(
//                                 (states) =>
//                                     states.contains(MaterialState.focused)
//                                         ? Colors.red
//                                         : Colors.black)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(left: 20),
//                       child: Checkbox(
//                           checkColor: Colors.white,
//                           fillColor: MaterialStateColor.resolveWith(
//                               (states) => Colors.red),
//                           value: isChecked,
//                           onChanged: (bool? value) {
//                             setState(() {
//                               isChecked = value!;
//                             });
//                           }),
//                     ),
//                     const Text(
//                       "I agree to all the",
//                       style: TextStyle(
//                         color: Colors.white70,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () => null,
//                       child: const Text(
//                         "Term and Privacy Policy",
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 450,
//                   height: 50,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                         textStyle: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         )),
//                     onPressed: () {
//                       final user = User(
//                           email: 'sitisarah@gmail.com',
//                           userId: Isar.autoIncrement,
//                           first: 'Siti',
//                           last: 'Sarah',
//                           position: 'Cashier',
//                           phone: '01165097507');

//                       widget.isarService.addUser(user);
//                     },
//                     child: const Text(
//                       "Register",
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Get.back();
//                     // Get.toNamed('/LoginPage');
//                   },
//                   child: const Text(
//                     "Have an Account?",
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//         ));
//   }
// }
