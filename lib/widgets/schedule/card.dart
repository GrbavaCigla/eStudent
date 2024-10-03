import 'package:flutter/material.dart';

import 'package:estudent/models/subject.dart';
import 'package:estudent/constants.dart';

class ScheduleCard extends StatelessWidget {
  final Subject subject;

  const ScheduleCard({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(kScheduleCardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subject.time?.trim() ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Theme.of(context).disabledColor),
                ),
                Text(
                  subject.group ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Theme.of(context).disabledColor),
                ),
              ],
            ),
            SizedBox(height: kScheduleCardSpacing),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        subject.code == null ? "" : "${subject.code?.trim()} ",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).disabledColor,
                        ),
                  ),
                  TextSpan(
                    text: subject.name?.trim() ?? "",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: kScheduleCardSpacing),
            Text(
              subject.place?.trim() ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
