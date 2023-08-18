import 'package:flutter/material.dart';
import '../data/dummy_habit.dart';
import '../widgets/habit_item.dart';

class HabitGrid extends StatelessWidget {

  final DateTime selectedDate;

  HabitGrid(this.selectedDate, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_HABITS.map((e) => HabitItem(e, selectedDate)).toList() 
      ),
    );
  }
}
