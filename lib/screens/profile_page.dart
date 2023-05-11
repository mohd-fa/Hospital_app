import 'package:doctor_appointment_ui/screens/colors.dart';
import 'package:doctor_appointment_ui/screens/mainhomepage.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pColor,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainHomePage(),
                  ));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
          child: Column(children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image(
                  image: AssetImage("images/profile1.png"),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "User",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "test@gmail.com",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(700),
                  color: Color.fromARGB(255, 40, 110, 207).withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 40, 110, 207),
                ),
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
