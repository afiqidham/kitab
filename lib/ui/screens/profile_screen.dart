import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/ui/components/texts/display_text.dart';
import 'package:pos/ui/components/texts/label_text.dart';
import 'package:pos/ui/view_models/profile_view_model.dart';
import 'package:pos/ui/widgets/bottomsheet.dart';
import 'package:pos/ui/widgets/profile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ProfileViewModel pvm = Get.put(ProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => AnimatedAlign(
              alignment:
                  pvm.selected.value ? Alignment.centerLeft : Alignment.center,
              duration: const Duration(seconds: 10),
              curve: Curves.fastOutSlowIn,
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 70, bottom: 70),
                margin: const EdgeInsets.only(bottom: 30, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xff1f2029),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Material(
                          shape: CircleBorder(side: BorderSide.none),
                          shadowColor: Colors.black,
                          color: Colors.black,
                          elevation: 15,
                          child: CircleAvatar(
                            radius: 94,
                            backgroundColor: Colors.red,
                            child: Obx(
                              () => CircleAvatar(
                                radius: 90,
                                backgroundImage: pvm.profilePicturePath.value ==
                                        true
                                    ? FileImage(File(pvm.profilePicture.value))
                                        as ImageProvider
                                    : AssetImage("images/human.jpg"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 15,
                            bottom: 10,
                            child: InkWell(
                              child: const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.photo_camera,
                                    size: 20,
                                  )),
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Bottomsheet());
                              },
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Siti Sarah",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'Bubblegum',
                      ),
                    ),
                    const Text(
                      "Cashier",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LabelText(
                          text: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 330,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.red,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 3,
                                offset: Offset(4, 8),
                              )
                            ],
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              DisplayText(
                                text: "sitisarah92@gmail.com",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LabelText(
                          text: "Phone Number",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 330,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.red,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 3,
                                offset: Offset(4, 8),
                              )
                            ],
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              DisplayText(
                                text: "01165097507",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shadowColor: Colors.black),
                      onPressed: () {
                        pvm.showProfileDetails();
                        pvm.changeAlignment();
                      },
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(() => Visibility(
              visible: pvm.isVisible.value, child: const PersonalInfo())),
          // ElevatedButton(
          //     onPressed: () {
          //       Get.toNamed('/AddBook');
          //     },
          //     child: Text('Add Book'))
        ],
      ),
    );
  }
}
