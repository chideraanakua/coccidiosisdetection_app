// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../styles.dart';


class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.label,
      this.textColor = Colors.white,
      this.buttonColor,
      this.loading = false})
      : super(key: key);

  final String label;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onTap;
  final bool loading;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: widget.buttonColor ?? Color(0xff36474f),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: widget.loading ? CircularProgressIndicator(color: kColorGreen,): Text(
            widget.label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: widget.textColor,
                fontSize: 16,
                fontFamily: 'urbanist',
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}