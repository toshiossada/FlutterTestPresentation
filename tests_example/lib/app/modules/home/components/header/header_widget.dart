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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ??
              TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
        ),
        Text(
          subTitle,
          style: subtitleStyle ??
              TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[600],
              ),
        ),
      ],
    );
  }
}
