import 'package:fl_chart/fl_chart.dart';

class Habit {
  final String name;
  final String description;
  final int targetFrequency; // Number of times per week
  final List<DateTime> datesCompleted;
  final List<Score> scores;
  final DateTime dateCreated;

  Habit(
      {required this.name,
      required this.description,
      required this.targetFrequency,
      this.datesCompleted = const [],
      this.scores = const [],
      DateTime? dateCreated})
      : dateCreated = dateCreated ?? DateTime.now();

  List<FlSpot> getScoresDot(int numberOfDots) {
    List<FlSpot> scoresDot = [];
    DateTime now = DateTime.now();
    DateTime start = DateTime.now().subtract(Duration(days: numberOfDots * 7));
    
    scores.where((e) => e.date.isAfter(start)).forEach((element) {
      double diff = 10-((-element.date.difference(now).inDays.toDouble() / (numberOfDots * 7))*10);
      scoresDot.add(FlSpot(diff, element.score.toDouble()));
    });

    

    return scoresDot;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'targetFrequency': targetFrequency,
      'scores': scores.map((score) => score.toJson()).toList(), // Add this line
      'datesCompleted':
          datesCompleted.map((date) => date.toIso8601String()).toList(),
      'dateCreated': dateCreated.toIso8601String(),
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      name: json['name'],
      description: json['description'],
      targetFrequency: json['targetFrequency'],
      scores: (json['scores'] as List<dynamic>)
          .map((score) => Score.fromJson(score))
          .toList(), // Add this line
      datesCompleted: (json['datesCompleted'] as List<dynamic>)
          .map((date) => DateTime.parse(date))
          .toList(),
      dateCreated: DateTime.parse(json['dateCreated']),
    );
  }
}

class Score {
  final int score;
  final DateTime date;

  Score({required this.score, required this.date});

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'date': date.toIso8601String(),
    };
  }

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      score: json['score'],
      date: DateTime.parse(json['date']),
    );
  }
}
