import 'package:flutter/material.dart';

import 'package:estudent/models/subject.dart';
import 'package:estudent/constants.dart';

class ScheduleCard extends StatefulWidget {
  final Subject subject;

  const ScheduleCard({super.key, required this.subject});

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    List<Widget>? items =
        widget.subject.lecturers?.map((elem) => Text(elem)).toList();
    items = items == null
        ? []
        : [
            SizedBox(
              height: kScheduleCardSpacing,
            ),
            ...items
          ];

    return Card(
      child: InkWell(
        customBorder: Theme.of(context).cardTheme.shape,
        onTap: () => setState(() {
          _isOpen = !_isOpen;
        }),
        child: Padding(
          padding: const EdgeInsets.all(kScheduleCardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.subject.time?.trim() ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Theme.of(context).disabledColor),
                      ),
                      Text(
                        widget.subject.group ?? "",
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
                          text: widget.subject.code == null
                              ? ""
                              : "${widget.subject.code?.trim()} ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).disabledColor,
                              ),
                        ),
                        TextSpan(
                          text: widget.subject.name?.trim() ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: kScheduleCardSpacing),
                  Text(
                    widget.subject.place?.trim() ?? "",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ] +
                [
                  AnimatedSwitcher(
                    duration: kScheduleCardAnimationDuration,
                    transitionBuilder: (child, animation) {
                      return SizeTransition(
                        axisAlignment: -1.0,
                        sizeFactor: animation,
                        child: child,
                      );
                    },
                    child: (_isOpen
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: items,
                          )
                        : null),
                  ),
                ],
          ),
        ),
      ),
    );
  }
}
