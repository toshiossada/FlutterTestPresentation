import 'package:flutter/material.dart';

class RoundedTextFieldWidget extends StatelessWidget {
  final Function onSaved;
  final Function validator;
  final Function onTap;
  final Function onChanged;
  final String labelText;
  final String initialValue;
  final TextEditingController controller;
  final bool readOnly;
  final bool obscureText;
  final int maxLines;
  final Color backgroundColor;
  final Color fontColor;
  final Widget suffixIcon;
  final Color labelStyleColor;
  final bool showBorder;

  RoundedTextFieldWidget({
    this.onSaved,
    this.validator,
    this.labelText,
    this.onChanged,
    this.controller,
    this.onTap,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.backgroundColor = Colors.transparent,
    this.labelStyleColor,
    @required this.fontColor,
    this.initialValue,
    this.showBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        readOnly: readOnly,
        controller: this.controller,
        obscureText: this.obscureText,
        keyboardType: TextInputType.text,
        maxLines: this.maxLines,
        style: TextStyle(color: fontColor),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          border: showBorder ? null : InputBorder.none,
          suffixIcon: suffixIcon,
          fillColor: Colors.greenAccent,
          labelText: this.labelText,
          labelStyle: TextStyle(
            color: labelStyleColor == null
                ? Theme.of(context).accentColor
                : labelStyleColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        validator: this.validator,
        onTap: onTap,
        onSaved: this.onSaved ?? (v) {},
        onChanged: this.onChanged ?? (v) {},
      ),
    );
  }
}
