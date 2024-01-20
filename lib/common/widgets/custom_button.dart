import 'dart:math';

import 'package:amazon_two/constants/global_variables.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const CustomButton({super.key, required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
        child: Text(text,
          style: TextStyle(
            color: color == null ? Colors.white : Colors.black,
          ),
        ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        primary: color,
        backgroundColor: GlobalVariables.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        )
      ),
    );
  }
}
