import 'package:flutter/material.dart';

import 'package:estudent/constants.dart';

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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: kPageInset),
              height: MediaQuery.of(context).size.height,
              child: body ?? Container(),
            ),
            appBar ?? Container()
          ],
        ),
      ),
    );
  }
}
