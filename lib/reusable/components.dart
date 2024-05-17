import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultButton(
        {required Color backgroundColor,
        double radius = 10,
        double width = 100,
        double height = 40,
        required VoidCallback onPress,
        required Widget widget}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: MaterialButton(onPressed: onPress, child: widget),
    );

/// navigation

void navigateTo(context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

/// unselected error Message

void unselectedMessage(context,String text)=>ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text)));

/// invoices text

Widget invoiceText(
  String text, {
  bool isGrey = true,
}) =>
    Text(
      text,
      style: TextStyle(
        color: HexColor('#a9a9a9'),
        fontWeight: FontWeight.w600,
      ),
    );

/// steps widget

Widget stepsWidget({
  required String text,
  required Color color1,
  required Color color2,
  required Color color3,
  double font = 10,
  double iconSize = 15,
}) =>
    Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.green,
              size: iconSize,
            ),
            Text(
              text,
              style: TextStyle(fontSize: font, color: Colors.green),
            ),
            const Spacer(),
            Transform.scale(
                scaleX: 1.5, child: Icon(Icons.arrow_right_alt, color: color1)),
            const Spacer(),
            Icon(Icons.check_circle_outline_outlined,
                size: iconSize, color: color2),
            Text(
              'payment type',
              style: TextStyle(fontSize: font, color: color2),
            ),
            const Spacer(),
            Transform.scale(
                scaleX: 1.5, child: Icon(Icons.arrow_right_alt, color: color3)),
            const Spacer(),
            Icon(Icons.check_circle_outline_outlined,
                size: iconSize, color: color3),
            Text(
              'Done',
              style: TextStyle(fontSize: font, color: color3),
            ),
          ],
        ));


///payment methods

Widget paymentMethods({
  required bool isClicked,
  required Color color,
  required Color containerColor,
  required String text,
  required IconData icon,
  required GestureTapCallback onTap,
}){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: containerColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon,color: color,),
          Text(text,style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color
          ),),
          Transform.scale(
            scale: 1.5,
            child: Icon(
              isClicked
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: color,
            ),
          ),
        ],
      ),
    ),
  );
}
