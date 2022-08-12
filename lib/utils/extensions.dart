import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Size get queryScreenSize => MediaQuery.of(this).size;

  NavigatorState get navigator => Navigator.of(this);
}

extension ListExtension<T> on List<T> {
  List<String> toEachString() => map<String>((e) => e.toString()).toList();
}

extension DateTimeExtension on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
  }) =>
      DateTime(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
        hour ?? this.hour,
        minute ?? this.minute,
        second ?? this.second,
      );
}

extension DoubleExtension on num {
  ///returns value * (percentage/100)
  double percent(num percentage) => (this * (percentage / 100)).toDouble();

  double get negate => this * -1;
}
