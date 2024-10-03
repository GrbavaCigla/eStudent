import 'package:estudent/constants.dart';
import 'package:flutter/material.dart';

class ScheduleHeader extends StatelessWidget {
  final String title;

  const ScheduleHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: kPageInset + kCardMargin + kCardPadding,
        vertical: kCardPadding,
      ),
      margin: EdgeInsets.symmetric(
          // vertical: kCardMargin,
          ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
