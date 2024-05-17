import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internship_task/screens/subject_screen.dart';

import '../reusable/components.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/success_images/success.jpg')),
            const Image(
              image: AssetImage('assets/success_images/check.png'),
              color: Colors.green,
              width: 200,
              height: 200,
            ),
            const Text(
              'THANK YOU!',
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Your reservation is being confirmed',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            stepsWidget(text: 'Add Payment Method',
                color1: Colors.green,
                color2: Colors.green,
                color3: Colors.green
            ),
            const SizedBox(height: 30,),
            Container(
              width: 150,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black87,width: 1)
              ),
              child: MaterialButton(onPressed: () {
                navigateTo(context,SubjectsScreen());
              }, child:  const Text(
                'Browse Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),),
            )
          ],
        ),
      ),
    );
  }
}
