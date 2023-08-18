import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../screens/habit_details.dart';

class HabitItem extends StatelessWidget {
  final Habit habit;
  final DateTime selectedDate;

  const HabitItem(this.habit, this.selectedDate, {super.key});

  void _selectHabit(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => HabitDetails(habit)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
      child: InkWell(
        onTap: ()=>_selectHabit(context),
        splashColor: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(habit.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black, fontSize: 18)),
                  const SizedBox(height: 10),
                  Text(habit.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black45)),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Icon(
                  habit.datesCompleted.last.day == selectedDate.day &&
                          habit.datesCompleted.last.month ==
                              selectedDate.month &&
                          habit.datesCompleted.last.year == selectedDate.year
                      ? Icons.check_circle
                      : Icons.circle_outlined,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
