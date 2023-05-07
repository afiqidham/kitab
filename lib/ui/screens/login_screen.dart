import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/ui/components/buttons/button_login.dart';
import 'package:pos/ui/components/inputs/custom_input.dart';
import 'package:pos/ui/view_models/login_view_model.dart';
import 'package:pos/utils/route.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final lvm = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff17161f),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
                width: 490,
                height: 700,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xff1f2029),
                ),
                child: Column(children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  const CircleAvatar(
                    radius: 95,
                    backgroundColor: Colors.red,
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage("images/logo.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    "Staff Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Bubblegum',
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 450,
                    height: 100,
                    child: CustomInput(
                      text: "Email",
                      // key: lvm.formKey,
                      controller: lvm.emailController,
                      keyboardType: TextInputType.emailAddress,
                      obsecureText: false,
                      validator: (value) {
                        if (!GetUtils.isEmail(value!)) {
                          return "Email is not valid";
                        } else {
                          return null!;
                        }
                      },
                      suffixIcon: const Icon(Icons.email),
                    ),
                  ),
                  SizedBox(
                    width: 450,
                    height: 100,
                    child: CustomInput(
                      text: "Password",
                      controller: lvm.passwordController,
                      obsecureText: true,
                      validator: (value) {
                        if (GetUtils.isLengthGreaterThan(5, 12)) {
                          return "Password not long enough";
                        } else {
                          return null!;
                        }
                      },
                      suffixIcon: const Icon(Icons.lock),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Obx(()=>
                          Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.red),
                              value: lvm.isChecked.value,
                              onChanged: (bool? value) {
                                lvm.checkBoxChecked();
                              }),
                        ),
                      ),
                      const Text(
                        "Remember Me",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 190),
                        child: TextButton(
                          onPressed: () => null,
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ButtonLogin(
                      text: 'Login', onPressed: () => Get.toNamed(RouteUtil.home)),
                ])),
          ),
        ));
  }
}
