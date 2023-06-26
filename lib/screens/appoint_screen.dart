
import 'package:doctor_appointment_ui/screens/appointmentdone.dart';
import 'package:doctor_appointment_ui/screens/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppointScreen extends StatelessWidget {
  const AppointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 228, 228, 228),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "images/doctor_icon.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      pColor.withOpacity(0.9),
                      pColor.withOpacity(0.5),
                      pColor.withOpacity(0.0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(15, 18, 50, 10),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Icon(Icons.arrow_back_rounded,
                                    color: pColor, size: 28),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Patients",
                                style: TextStyle(
                                  color: wColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "1.8k",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: wColor,
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Experience",
                                style: TextStyle(
                                  color: wColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "10 years",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: wColor,
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Rating",
                                style: TextStyle(
                                  color: wColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "4.9",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: wColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dr.Ram",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: pColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(MdiIcons.heartPulse, color: Colors.red, size: 28),
                      const SizedBox(width: 5),
                      Text(
                        "Surgeon",
                        style: TextStyle(
                          fontSize: 17,
                          color: bColor.withOpacity(0.6),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Dr.Ram is our lead surgeon and one of the most talented doctors",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Book a date",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 31,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 9),
                            decoration: BoxDecoration(
                              color: index == 1
                                  ? pColor
                                  : const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: sdColor,
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: index == 1
                                        ? wColor
                                        : bColor.withOpacity(0.6),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "DEC",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: index == 1
                                        ? wColor
                                        : bColor.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Choose a Time",
                    style: TextStyle(
                      fontSize: 18,
                      color: bColor.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            decoration: BoxDecoration(
                              color: index == 2 ? pColor : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: sdColor,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                " ${index + 8}:00 AM",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: index == 2
                                      ? wColor
                                      : bColor.withOpacity(0.6),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: pColor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppointmentDone(),
                  ));
                      },
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(
                            "Book an Appointment",
                            style: TextStyle(
                              color: wColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
