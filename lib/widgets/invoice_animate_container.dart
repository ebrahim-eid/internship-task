import 'package:flutter/material.dart';

import '../reusable/components.dart';

class InvoiceAnimateContainer extends StatefulWidget {
   InvoiceAnimateContainer({Key? key, required this.isClicked}) : super(key: key);
   bool isClicked;

  @override
  State<InvoiceAnimateContainer> createState() => _InvoiceAnimateContainerState();
}

class _InvoiceAnimateContainerState extends State<InvoiceAnimateContainer> {
  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      width: double.infinity,
      height: widget.isClicked ? 55 : 225,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      duration: const Duration(milliseconds: 1000),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Invoices (1) details',
                  style: TextStyle(
                    color: Color(0xffa9a9a9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.isClicked = !widget.isClicked;
                    });
                  },
                  child: Icon(
                    widget.isClicked
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Color(0xffa9a9a9),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Color(0xffa9a9a9),
          ),
          if (!widget.isClicked)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        invoiceText('invoice number'),
                        invoiceText('12600045125'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        invoiceText('Total'),
                        invoiceText('8,000 EGP'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        invoiceText('Student name'),
                        invoiceText('Mohamed Amr'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        invoiceText('Year'),
                        invoiceText('Fall 2023-2024'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        invoiceText('Payment date'),
                        invoiceText('01/10/2023-04:45 AM'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        invoiceText('teacher Name'),
                        invoiceText('MR.Mohaed Ali'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        invoiceText('Teacher subject'),
                        invoiceText('English'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
