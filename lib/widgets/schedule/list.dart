import 'package:flutter/material.dart';

import 'package:estudent/api/client.dart';
import 'package:estudent/constants.dart';
import 'package:estudent/widgets/settings.dart';
import 'package:estudent/models/subject.dart';
import 'package:estudent/widgets/schedule/card.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList({super.key});

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  List<List<Subject>>? _schedule;

  Future<List<List<Subject>>> _getSchedule(BuildContext context) async {
    if (_schedule == null) {
      final client = Client(
        url: DynamicSettings.of(context).provider,
        // TODO: Check for username & password null
        username: DynamicSettings.of(context).username ?? "",
        password: DynamicSettings.of(context).password ?? "",
      );

      _schedule = await client.getSchedule();
    }

    return _schedule!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getSchedule(context),
      builder: _futureBuilder,
    );
  }

  Widget _futureBuilder(
    BuildContext ctx,
    AsyncSnapshot<List<List<Subject>>> snap,
  ) {
    if (snap.hasData) {
      return CustomScrollView(
        slivers: snap.data!
            .expand<Widget>((elem) => _dayBuilder(ctx, elem))
            .toList(),
      );
    } else if (snap.hasError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: kScheduleListErrorIconSize,
            color: Theme.of(context).colorScheme.error,
          ),
          SizedBox(
            height: kScheduleListSpacing,
          ),
          Text(
            snap.error!.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: kScheduleListSpacing,
          ),
          Text(
            "Check provider and user credentials in the Settings dialog.",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Theme.of(context).disabledColor),
          ),
        ],
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  List<Widget> _dayBuilder(BuildContext ctx, List<Subject> subjects) {
    return [
      // TODO:
      // SliverPersistentHeader(delegate: )
      SliverList.builder(
        itemBuilder: (ctx, index) => _subjectBuilder(ctx, subjects[index]),
      )
    ];
  }

  Widget _subjectBuilder(BuildContext ctx, Subject subject) {
    return ScheduleCard();
  }
}
