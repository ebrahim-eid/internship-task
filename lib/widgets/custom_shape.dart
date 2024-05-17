import 'package:flutter/material.dart';

class CustomShape extends StatelessWidget {
  const CustomShape({Key? key, required this.widget}) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 150,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        color: Colors.blue,

      ),
      child: widget
    );
  }
}