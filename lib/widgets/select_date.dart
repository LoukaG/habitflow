import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'date_item.dart';

class SelectDate extends StatelessWidget {
  final DateTime selectedDate;
  final Function onDateChanged;

  const SelectDate(
      {required this.selectedDate, required this.onDateChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (context, index) {
          DateTime date = DateTime.now()
              .subtract(const Duration(days: 3))
              .subtract(Duration(days: -index));

          return GestureDetector(
            onTap: () => onDateChanged(date),
            child: DateItem(
                date: date,
                isSelected: date.year == selectedDate.year &&
                    date.month == selectedDate.month &&
                    date.day == selectedDate.day),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 30,
      ),
    );
  }
}
