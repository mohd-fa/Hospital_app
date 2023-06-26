
import 'package:doctor_appointment_ui/screens/colors.dart';
import 'package:doctor_appointment_ui/screens/mainhomepage.dart';
import 'package:doctor_appointment_ui/widgets/doctors_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  final List catNames = [
    "Dental",
    "Heart",
    "Eye",
    "Brain",
    "Ear",
  ];
  final List<Icon> catIcons = [
    const Icon(MdiIcons.toothOutline, color: pColor),
    const Icon(
      MdiIcons.heartPlus,
      color: Color(0xff5ac18e),
      size: 30,
    ),
    const Icon(
      MdiIcons.eye,
      color: pColor,
      size: 30,
    ),
    const Icon(
      MdiIcons.brain,
      color: pColor,
      size: 30,
    ),
    const Icon(
      MdiIcons.earHearing,
      color: pColor,
      size: 30,
    ),
  ];

  HomeScreen({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff5ac18e),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1000,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x665ac18e),
                      Color(0x995ac18e),
                      Color.fromARGB(204, 80, 198, 139),
                      Color.fromARGB(255, 46, 222, 134),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 57),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("images/doctor.png"),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainHomePage(),
                                    ));
                              },
                              icon: const Icon(Icons.logout),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              iconSize: 30,
                              splashRadius: 50,
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Hi,User",
                          style: TextStyle(
                            color: wColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Your Health is our\nFirst Priority!",
                          style: TextStyle(
                            color: wColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: wColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: sdColor,
                                  blurRadius: 6,
                                  spreadRadius: 3,
                                )
                              ]),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search here...",
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  size: 25,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: bColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: catNames.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: sdColor,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: catIcons[index],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                catNames[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: bColor.withOpacity(0.7),
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Recommended Doctors",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: bColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  const DoctorsSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
