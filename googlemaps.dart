import 'package:doctor_appointment_ui/forMap.dart';
import 'package:flutter/material.dart';

class GoogleMap extends StatelessWidget {
  const GoogleMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(87, 193, 142, 1),
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 160,
            height: 100,
            child: TextButton(
              style: TextButton.styleFrom(
                elevation: 10,
                shadowColor: Color.fromRGBO(128, 45, 83, 1),
                backgroundColor: Color.fromARGB(224, 0, 128, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                MapUtils.openMap(37.4851, -122.1483);
              },
              child: Text(
                'Open Maps',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          // Add your onPressed code here!
        },
        backgroundColor: Color.fromARGB(224, 0, 128, 255),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
