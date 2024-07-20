import 'package:flutter/material.dart';

class CustomInfoText extends StatelessWidget {
  final String text; // Text content
  final double fontSize; // Font size (optional)
  final FontWeight fontWeight; // Font weight (optional)
  final Color color; // Text color (optional)

  const CustomInfoText({
    Key? key,
    required this.text,
    this.fontSize = 16, // Default values
    this.fontWeight = FontWeight.w500,
    this.color = Colors.black54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color==Colors.black54?null:color,
      ),
    );
  }
}