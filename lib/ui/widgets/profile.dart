import 'package:flutter/material.dart';
import 'package:pos/ui/components/heading.dart';
import 'package:pos/ui/components/texts/display_text.dart';
import 'package:pos/ui/components/texts/label_text.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: 750,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xff1f2029)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Heading(
                  text: 'Personal Information',
                  fontSize: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, bottom: 10),
                      child: const LabelText(
                        text: "First Name",
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      width: 330,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      margin: const EdgeInsets.only(right: 20, left: 20),
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
                            Icons.person,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          DisplayText(
                            text: "Siti",
                            fontSize: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30, bottom: 10),
                      child: const LabelText(
                        text: "Last Name",
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      width: 330,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      margin: const EdgeInsets.only(right: 20, left: 30),
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
                          // Icon(
                          //   Icons.email,
                          //   color: Colors.white,
                          // ),
                          SizedBox(
                            width: 20,
                          ),
                          DisplayText(
                            text: "Sarah",
                            fontSize: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, bottom: 10),
                  child: const LabelText(
                    text: "Email",
                    fontSize: 15,
                  ),
                ),
                Container(
                  width: 710,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  margin: const EdgeInsets.only(right: 20, left: 20),
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
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20, bottom: 10),
                          child: const LabelText(
                            text: "Phone Number",
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          width: 330,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          margin: const EdgeInsets.only(right: 20, left: 20),
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
                                Icons.phone_android,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              DisplayText(
                                text: "01165097507",
                                fontSize: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 30, bottom: 10),
                          child: const LabelText(
                            text: "Position",
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          width: 330,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          margin: const EdgeInsets.only(right: 20, left: 30),
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
                                Icons.work,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              DisplayText(
                                text: "Cashier",
                                fontSize: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                // Center(
                //   child: SizedBox(
                //     width: 200,
                //     height: 50,
                //     child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             backgroundColor: Colors.red),
                //         onPressed: () => null,
                //         child: const Text("Save Changes")),
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
