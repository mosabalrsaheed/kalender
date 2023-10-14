import 'package:flutter/material.dart';
import 'package:kalender/kalender.dart';
import 'package:kalender/src/extensions.dart';

class MonthConfiguration extends MonthViewConfiguration {
  const MonthConfiguration({
    this.firstDayOfWeek = 1,
    this.enableResizing = true,
    this.enableRescheduling = true,
    this.createMultiDayEvents = true,
    this.multiDayTileHeight = 24,
  });

  @override
  String get name => 'Month';

  @override
  final Duration horizontalStepDuration = const Duration(days: 1);

  @override
  final Duration verticalStepDuration = const Duration(days: 7);

  @override
  final int firstDayOfWeek;

  @override
  final bool enableRescheduling;

  @override
  final bool enableResizing;

  @override
  final bool createMultiDayEvents;

  @override
  final double multiDayTileHeight;

  MonthConfiguration copyWith({
    int? firstDayOfWeek,
    bool? enableResizing,
    bool? enableRescheduling,
    bool? createMultiDayEvents,
    double? multiDayTileHeight,
  }) {
    return MonthConfiguration(
      firstDayOfWeek: firstDayOfWeek ?? this.firstDayOfWeek,
      enableResizing: enableResizing ?? this.enableResizing,
      enableRescheduling: enableRescheduling ?? this.enableRescheduling,
      createMultiDayEvents: createMultiDayEvents ?? this.createMultiDayEvents,
      multiDayTileHeight: multiDayTileHeight ?? this.multiDayTileHeight,
    );
  }

  @override
  DateTimeRange calculateVisibleDateTimeRange(DateTime date) {
    final monthRange = date.monthRange;
    return DateTimeRange(
      start: monthRange.start.startOfWeekWithOffset(firstDayOfWeek),
      end: monthRange.end.endOfWeekWithOffset(firstDayOfWeek),
    );
  }

  @override
  DateTimeRange calculateAdjustedDateTimeRange({
    required DateTimeRange dateTimeRange,
    required DateTime visibleStart,
  }) {
    return DateTimeRange(
      start: dateTimeRange.start.startOfMonth
          .startOfWeekWithOffset(firstDayOfWeek),
      end: dateTimeRange.end.endOfMonth.endOfWeekWithOffset(firstDayOfWeek),
    );
  }

  @override
  int calculateDateIndex(DateTime date, DateTime startDate) {
    return DateTimeRange(start: startDate, end: date).monthDifference;
  }

  @override
  int calculateNumberOfPages(DateTimeRange calendarDateTimeRange) {
    return calendarDateTimeRange.monthDifference;
  }

  @override
  DateTimeRange calculateVisibleDateRangeForIndex({
    required int index,
    required DateTime calendarStart,
  }) {
    final monthRange = DateTime(
      calendarStart.year,
      calendarStart.month + index,
    ).monthRange;

    return DateTimeRange(
      start: monthRange.start.startOfWeekWithOffset(firstDayOfWeek),
      end: monthRange.end.endOfWeekWithOffset(firstDayOfWeek),
    );
  }
}
