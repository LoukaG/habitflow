import 'package:flutter/material.dart';
import 'package:habitflow/widgets/habit_grid.dart';
import '../widgets/select_date.dart';

class HabitList extends StatefulWidget {
  @override
  _HabitListState createState() => _HabitListState();
}

class _HabitListState extends State<HabitList> {
  DateTime selectedDate = DateTime.now();

  void onDateChanged(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "HabitFlow",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.dark(),
                                    child: child!,
                                  );
                                },
                                initialDate: selectedDate,
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 3)),
                                lastDate: DateTime.now()
                                    .subtract(const Duration(days: -7)))
                            .then((date) {
                          if (date != null) {
                            onDateChanged(date);
                          }
                        });
                      },
                      child: const Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            SelectDate(
              selectedDate: selectedDate,
              onDateChanged: onDateChanged,
            ),
            HabitGrid(selectedDate)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
