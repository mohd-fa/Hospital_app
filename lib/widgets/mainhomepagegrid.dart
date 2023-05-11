import 'package:doctor_appointment_ui/screens/ambulance_call.dart';
import 'package:doctor_appointment_ui/screens/appoint_screen.dart';
import 'package:doctor_appointment_ui/screens/home_screen.dart';
import 'package:doctor_appointment_ui/screens/loginPage.dart';
import 'package:doctor_appointment_ui/screens/models/grid.dart';
import 'package:doctor_appointment_ui/screens/profile_page.dart';
import 'package:doctor_appointment_ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/models/grid.dart';

class MainHomePageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: allGrid.grid.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () async {
            if (i == 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            }

            if (i == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointScreen(),
                  ));
            }

            if (i == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Ambulance(),
                  ));
            }

            if (i == 3) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointScreen(),
                  ));
            }

            if (i == 4) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
            }

            if (i == 5) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
            }
          },
          child: Container(
            margin: EdgeInsets.only(
                top: i.isEven ? 0 : 0, bottom: i.isEven ? 0 : 0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 237, 233),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset(allGrid.grid[i].path),
                Text(
                  allGrid.grid[i].title,
                  style: MainHeading,
                ),
              ],
            ),
          ),
        ),
      ),
      //griddelegates shows how many items u want in a particular row
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
