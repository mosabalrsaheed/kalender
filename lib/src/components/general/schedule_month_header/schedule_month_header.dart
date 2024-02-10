import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalender/src/providers/calendar_style.dart';

class ScheduleMonthHeader extends StatelessWidget {
  const ScheduleMonthHeader({
    super.key,
    required this.date,
  });
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final style =
        CalendarStyleProvider.of(context).style.scheduleMonthHeaderStyle;

    final dateFormat = DateFormat(style?.dateFormat ?? 'yyyy - MMMM');

    return Padding(
      padding: style?.margin ?? const EdgeInsets.all(0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: style?.monthColors[date.month] ?? Colors.transparent,
        ),
        child: Padding(
          padding: style?.padding ?? const EdgeInsets.all(0),
          child: Text(
            dateFormat.format(date),
            style: style?.textStyle ?? Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
