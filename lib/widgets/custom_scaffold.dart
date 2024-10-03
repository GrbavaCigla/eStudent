import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Key? scaffoldKey;
  final Widget? body;
  final Widget? appBar;
  final Widget? drawer;

  const CustomScaffold({
    super.key,
    this.scaffoldKey,
    this.body,
    this.appBar,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawer,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            body ?? Container(),
            appBar ?? Container(),
          ],
        ),
      ),
    );
  }
}
