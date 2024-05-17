import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internship_task/screens/payment_screen.dart';

import '../reusable/components.dart';
import '../widgets/invoice_animate_container.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({Key? key}) : super(key: key);

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage("assets/pay_images/man.png"),
                width: 130,
                height: 120,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    'Invoices details',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InvoiceAnimateContainer(isClicked: isClicked,),
              const SizedBox(
                height: 10,
              ),
              InvoiceAnimateContainer(isClicked: isClicked,),

              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    'Pay now (14,500 EGP)',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              stepsWidget(text: 'Invoice Details',
                  color1: HexColor('#a9a9a9'),
                  color2: HexColor('#a9a9a9'),
                  color3: HexColor('#a9a9a9')
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultButton(
                    backgroundColor: Colors.grey,
                    onPress: (){
                      Navigator.pop(context);
                    },
                    width: 180,
                    height: 50,
                    widget:  const Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  defaultButton(
                    backgroundColor: Colors.blue,
                    onPress: (){
                     navigateTo(context, PaymentScreen());

                    },
                    width: 180,
                    height: 50,
                    widget:  const Text(
                      'Confirm',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
