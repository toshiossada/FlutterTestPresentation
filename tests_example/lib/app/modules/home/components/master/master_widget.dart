import 'package:flutter/material.dart';
import 'package:tests_example/app/modules/home/components/header/header_widget.dart';

class MasterWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget body;
  final String title;
  final String subTitle;
  final PreferredSizeWidget appBar;

  MasterWidget(
      {Key key,
      this.body,
      this.title,
      this.subTitle,
      this.scaffoldKey,
      this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey ?? GlobalKey<ScaffoldState>(),
      appBar: appBar ??
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HeaderWidget(
                  title: title,
                  subTitle: subTitle,
                ),
                SizedBox(
                  height: 50,
                ),
                body
              ],
            ),
          ),
        ),
      ),
    );
  }
}
