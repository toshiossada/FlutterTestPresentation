import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;

  const HeaderWidget(
      {Key key, this.title, this.subTitle, this.subtitleStyle, this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: title,
            style: titleStyle ??
                TextStyle(
                  fontSize: 32,
                  color: Colors.blue[800],
                ),
          ),
          TextSpan(text: '\n'),
          TextSpan(
            text: subTitle,
            style: subtitleStyle ??
                TextStyle(
                  color: Colors.blue[600],
                ),
          ),
        ],
      ),
    );
  }
}
