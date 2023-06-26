import 'package:doctor_appointment_ui/screens/appoint_screen.dart';
import 'package:doctor_appointment_ui/screens/colors.dart';
import 'package:flutter/material.dart';

class DoctorsSection extends StatelessWidget {
  const DoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 295,
                width: 200,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: sdColor,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AppointScreen(),
                                ));
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.asset(
                              "images/profile1.png",
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dr.Ram",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: pColor,
                              ),
                            ),
                            Text(
                              "Surgeon",
                              style: TextStyle(
                                fontSize: 18,
                                color: bColor.withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "4.9",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: bColor.withOpacity(0.6),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
