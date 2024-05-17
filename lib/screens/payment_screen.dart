import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internship_task/screens/success_screen.dart';

import '../reusable/components.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isClicked1 = false;
  bool isClicked2 = false;
  bool isClicked3 = false;
  Color color1() => isClicked1 ? Colors.white : Colors.black;
  Color color2() => isClicked2 ? Colors.black : Colors.white;
  Color color3() => isClicked3 ? Colors.white : Colors.black;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;
  var formKey = GlobalKey<FormState>();
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/pay_images/payment.png"),
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                color: Colors.cyan,
              ),
              const SizedBox(height: 15),
              paymentMethods(
                  isClicked: isClicked1,
                  color: color1(),
                  containerColor:
                      isClicked1 ? Colors.blue : Colors.grey.withOpacity(0.4),
                  text: 'Cash payment',
                  icon: Icons.call_to_action_outlined,
                  onTap: () {
                    setState(() {
                      isClicked1 = !isClicked1;
                      isClicked2 = true;
                      isClicked3 = false;
                    });
                  }),
              const SizedBox(height: 15),
              paymentMethods(
                  isClicked: isClicked2,
                  color: color2(),
                  containerColor:
                      isClicked2 ? Colors.grey.withOpacity(0.4) : Colors.blue,
                  text: 'Credit/Debit Card',
                  icon: Icons.call_to_action_outlined,
                  onTap: () {
                    setState(() {
                      isClicked2 = !isClicked2;
                      isClicked1 = false;
                      isClicked3 = false;
                    });
                  }),
              const SizedBox(height: 10),
              AnimatedContainer(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                height: isClicked2 ? 0 : 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.3),
                ),
                duration: const Duration(milliseconds: 1000),
                child: !isClicked2
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            CreditCardForm(
                              formKey: formKey, // Required
                              cardNumber: cardNumber, // Required
                              expiryDate: expiryDate, // Required
                              cardHolderName: cardHolderName, // Required
                              cvvCode: cvvCode, // Required
                              // cardNumberKey: cardNumberKey,
                              // cvvCodeKey: cvvCodeKey,
                              // expiryDateKey: expiryDateKey,
                              // cardHolderKey: cardHolderKey,
                              onCreditCardModelChange: (CreditCardModel data) {}, // Required
                              obscureCvv: true,
                              obscureNumber: true,
                              isHolderNameVisible: true,
                              isCardNumberVisible: true,
                              isExpiryDateVisible: true,
                              enableCvv: true,
                              cvvValidationMessage: 'Please input a valid CVV',
                              dateValidationMessage: 'Please input a valid date',
                              numberValidationMessage: 'Please input a valid number',
                              cardNumberValidator: (String? cardNumber){},
                              expiryDateValidator: (String? expiryDate){},
                              cvvValidator: (String? cvv){},
                              cardHolderValidator: (String? cardHolderName){},
                              onFormComplete: () {
                                // callback to execute at the end of filling card data
                              },
                              autovalidateMode: AutovalidateMode.always,
                              disableCardNumberAutoFillHints: false,
                              inputConfiguration: const InputConfiguration(
                                cardNumberDecoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Number',
                                  hintText: 'XXXX XXXX XXXX XXXX',
                                ),
                                expiryDateDecoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Expired Date',
                                  hintText: 'XX/XX',
                                ),
                                cvvCodeDecoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CVV',
                                  hintText: 'XXX',
                                ),
                                cardHolderDecoration: InputDecoration(
                                  contentPadding:  EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                                  border: OutlineInputBorder(),
                                  labelText: 'Card Holder',
                                ),
                                cardNumberTextStyle: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                                cardHolderTextStyle: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                                expiryDateTextStyle: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                                cvvCodeTextStyle: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
              ),
              if (!isClicked2) ...{
                const SizedBox(height: 10),
                defaultButton(
                    backgroundColor: HexColor("#adcf96"),
                    onPress: () {},
                    widget: const Text('Add other Card'),
                    width: 180)
              },
              const SizedBox(height: 10),
              paymentMethods(
                  isClicked: isClicked3,
                  color: color3(),
                  containerColor:
                      isClicked3 ? Colors.blue : Colors.grey.withOpacity(0.4),
                  text: 'Mobil wallet',
                  icon: Icons.call_to_action_outlined,
                  onTap: () {
                    setState(() {
                      isClicked3 = !isClicked3;
                      isClicked2 = true;
                      isClicked1 = false;
                    });
                  }),
              const SizedBox(
                height: 15,
              ),
              stepsWidget(
                text: 'Add Payment Method',
                color1: Colors.green,
                color2: Colors.green,
                color3: HexColor('#a9a9a9'),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultButton(
                    backgroundColor: Colors.grey.withOpacity(0.4),
                    onPress: () {
                      Navigator.pop(context);
                    },
                    width: 180,
                    height: 50,
                    widget: const Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  defaultButton(
                    backgroundColor: Colors.blue,
                    onPress: () {
                      navigateTo(context, const SuccessScreen());
                    },
                    width: 180,
                    height: 50,
                    widget: const Text(
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
