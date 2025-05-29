import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class inputWidget extends StatelessWidget {
  inputWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.textPaddingHorizontal=10,
    this.textPaddingVertical=10,
  });
  final hintText;
  final labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double textPaddingHorizontal;
  final double textPaddingVertical;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: textPaddingHorizontal,
          vertical: textPaddingVertical
      ),
      child: TextFormField(
        controller: controller,
        keyboardType:TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(suffixIcon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  width: 2,
                  color: Colors.black
              )
          ),
          focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  width: 2,
                  color: Colors.black
              )
          ),
        ),
      ),
    );
  }
}

ButtonStyle commonButtonStyle()=>ButtonStyle(
    backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
    foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
    minimumSize: WidgetStatePropertyAll<Size>(Size.fromHeight(45),)
);