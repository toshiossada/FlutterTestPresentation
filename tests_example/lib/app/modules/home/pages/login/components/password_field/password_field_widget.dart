import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tests_example/app/modules/home/pages/login/components/password_field/password_field_controller.dart';
import 'package:tests_example/app/modules/home/pages/login/components/rounded_text_field/rounded_text_field_widget.dart';

class PasswordFieldWidget extends StatelessWidget {
  final PasswordFieldController _passwordFieldController = Modular.get();
  final Function onChanged;
  final String label;
  final Function validator;
  final Color fontColor;
  final Color backgroundColor;
  final Color labelStyleColor;
  final bool showBorder;
  final Key key;

  PasswordFieldWidget(
      {this.onChanged,
      @required this.label,
      this.validator,
      this.fontColor,
      this.backgroundColor,
      this.labelStyleColor,
      this.showBorder,
      this.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (_) => RoundedTextFieldWidget(
          key: key,
          showBorder: showBorder,
          labelText: label,
          fontColor: fontColor,
          backgroundColor: backgroundColor,
          obscureText: !_passwordFieldController.passwordVisible,
          onChanged: onChanged,
          validator: validator,
          labelStyleColor: labelStyleColor,
          suffixIcon: IconButton(
            onPressed: () {
              _passwordFieldController.passwordVisible =
                  !_passwordFieldController.passwordVisible;
            },
            icon: Icon(
              _passwordFieldController.passwordVisible
                  ? FontAwesomeIcons.eyeSlash
                  : FontAwesomeIcons.eye,
              color: labelStyleColor,
            ),
          ),
        ),
      ),
    );
  }
}
