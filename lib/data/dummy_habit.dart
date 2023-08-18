import '../models/habit.dart';

List<Habit> DUMMY_HABITS = [
  Habit(
      name: 'Morning Run',
      description: 'Go for a run in the morning',
      targetFrequency: 5,
      datesCompleted: [
        DateTime(2023, 8, 15, 8, 0),
        DateTime(2023, 8, 16, 7, 30),
        DateTime(2023, 8, 18, 8, 15),
      ],
    ),
    Habit(
      name: 'Read a Book',
      description: 'Read a chapter of a book every day',
      targetFrequency: 7,
      datesCompleted: [
        DateTime(2023, 8, 16, 18, 0),
        DateTime(2023, 8, 18, 19, 30),
      ],
      scores: [
        Score(score: 0, date: DateTime(2023, 6, 4)),
        Score(score: 1, date: DateTime(2023, 6, 11)),
        Score(score: 2, date: DateTime(2023, 6, 18)),
        Score(score: 11, date: DateTime(2023, 6, 25)),
        Score(score: 2, date: DateTime(2023, 7, 2)),
        Score(score: 3, date: DateTime(2023, 7, 9)),
        Score(score: 4, date: DateTime(2023, 7, 16)),
        Score(score: 5, date: DateTime(2023, 7, 23)),
        Score(score: 4, date: DateTime(2023, 7, 30)),
        Score(score: 3, date: DateTime(2023, 8, 6)),
        Score(score: 4, date: DateTime(2023, 8, 13)),
      ]
    ),
    Habit(
      name: 'Meditate',
      description: 'Practice meditation for 10 minutes',
      targetFrequency: 3,
      datesCompleted: [
        DateTime(2023, 8, 15, 20, 0),
        DateTime(2023, 8, 17, 21, 30),
      ],
    ),
];