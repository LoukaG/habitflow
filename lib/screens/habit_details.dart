import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../widgets/habit_graph.dart';

class HabitDetails extends StatelessWidget {
  final Habit habit;
  const HabitDetails(this.habit, {super.key});

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }
                    
                  , child: Icon(Icons.arrow_back, color: Colors.white,)),
                  const Text(
                    "HabitFlow",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          habit.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        Text(
                          habit.description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white60),
                        ),
                      ],
                    ),
                  ),
                  HabitGraph(habit.getScoresDot(10))
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
