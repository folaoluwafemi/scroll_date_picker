import 'package:flutter/material.dart';
import 'package:scroll_date_picker/ui/functions/ui_functions.dart';
import 'package:scroll_date_picker/utils/colors.dart';
import 'package:scroll_date_picker/utils/extensions.dart';
import 'package:scroll_date_picker/utils/values.dart';

// class DateOfBirthDialog extends StatefulWidget {
//   final ValueChanged<DateTime> onSet;
//
//   const DateOfBirthDialog({
//     required this.onSet,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<DateOfBirthDialog> createState() => _DateOfBirthDialogState();
// }
//
// class _DateOfBirthDialogState extends State<DateOfBirthDialog> {
//   onDateTimeChanged(DateTime date) {
//     currentDate = date;
//   }
//
//   DateTime? currentDate;
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = context.queryScreenSize.height;
//     return WillPopScope(
//       onWillPop: () async {
//         final bool willPop = currentDate != null;
//         if (willPop) widget.onSet(currentDate!);
//         return willPop;
//       },
//       child: Dialog(
//         elevation: 0,
//         insetPadding: EdgeInsets.zero,
//         child: Container(
//           color: AppColors.white,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomDatePicker(
//                 height: screenHeight.percent(18),
//                 spacing: 16,
//                 onDateChanged: onDateTimeChanged,
//               ),
//               TextButton(
//                 onPressed: () {
//                   if (currentDate == null) {
//                     Ui.showFailureSnackBar(
//                       context,
//                       'Please select a date',
//                     );
//                     return;
//                   }
//                   widget.onSet(currentDate!);
//                   context.navigator.pop();
//                 },
//                 child: AppText.semiBold(
//                   Strings.set,
//                   fontSize: 24,
//                   color: AppColors.orange,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomDatePicker extends StatefulWidget {
  final ValueChanged<DateTime> onDateChanged;
  final double height;
  final double spacing;

  const CustomDatePicker({
    required this.onDateChanged,
    required this.height,
    required this.spacing,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final DateTime now = DateTime.now();
  final List<int> years = [];
  final List<String> months = [];
  List<int> days = [];

  @override
  void initState() {
    super.initState();
    years.addAll(_getYears());
    months.addAll(Values.shortMonths);
  }

  List<int> _getYears() {
    return List<int>.generate(
      200,
      (index) => (now.year - index),
    );
  }

  DateTime currentDateTime = DateTime.now();

  int currentYear = 0;

  onYearChanged(int index) {
    currentYear = index;
    setState(() {
      currentDateTime = currentDateTime.copyWith(
        year: years[index],
      );
    });
    widget.onDateChanged(currentDateTime);
  }

  int currentMonth = 1;

  onMonthChanged(int index) {
    print('month changed');
    currentMonth = index;

    setState(() {
      currentDateTime = currentDateTime.copyWith(
        month: index + 1,
      );
      _getListOfDays();
    });
    widget.onDateChanged(currentDateTime);
  }

  onDaysChanged(int index) {
    setState(() {
      currentDateTime = currentDateTime.copyWith(
        day: index + 1,
      );
    });
    widget.onDateChanged(currentDateTime);
  }

  _getListOfDays() {
    final int monthLength = DateTime(
      currentDateTime.year,
      currentDateTime.month + 1,
      0,
    ).day;

    List<int> daysList = List<int>.generate(
      monthLength,
      (index) => index + 1,
    ).toList();

    days = daysList;
  }

  @override
  Widget build(BuildContext context) {
    _getListOfDays();
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 63),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Picker(
              itemExtent: widget.height / 3,
              height: widget.height,
              items: days.toEachString(),
              onIndexChanged: onDaysChanged,
            ),
          ),
          Ui.boxWidth(16),
          Flexible(
            child: Picker(
              itemExtent: widget.height / 3,
              height: widget.height,
              items: months,
              onIndexChanged: onMonthChanged,
            ),
          ),
          Ui.boxWidth(16),
          Flexible(
            child: Picker(
              itemExtent: widget.height / 3,
              height: widget.height,
              onIndexChanged: onYearChanged,
              items: years.toEachString(),
            ),
          ),
        ],
      ),
    );
  }
}

class Picker extends StatelessWidget {
  final ValueChanged<int> onIndexChanged;
  final List<String> items;
  final double itemExtent;
  final double height;

  const Picker({
    Key? key,
    required this.onIndexChanged,
    required this.items,
    required this.itemExtent,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListDateWheel(
      height: height,
      itemExtent: itemExtent,
      onChanged: onIndexChanged,
      items: items,
    );
  }
}

class CustomListDateWheel extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final double height;
  final double itemExtent;
  final List<String> items;

  const CustomListDateWheel({
    Key? key,
    required this.onChanged,
    required this.items,
    required this.itemExtent,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          child: ListWheelScrollView.useDelegate(
            squeeze: 0.9,
            onSelectedItemChanged: onChanged,
            diameterRatio: 3,
            physics: const FixedExtentScrollPhysics(),
            itemExtent: itemExtent,
            useMagnifier: true,
            overAndUnderCenterOpacity: 0.2,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: items.length,
              builder: (context, index) {
                return Text(
                  items[index],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          height: height,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                thickness: 1.5,
                color: AppColors.black,
              ),
              Ui.boxHeight(56),
              const Divider(
                thickness: 1.5,
                color: AppColors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
