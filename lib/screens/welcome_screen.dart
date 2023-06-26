import 'package:doctor_appointment_ui/screens/colors.dart';
import 'package:doctor_appointment_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
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
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Image.asset("images/doctor.png"),
            ),
            const SizedBox(height: 50),
            const Text(
              "Doctors Online",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Appoint your Doctor",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 70),
            Material(
              color: wColor,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: const Text(
                    "Let's go",
                    style: TextStyle(
                      color: Color(0xff5ac18e),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
