import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as developer;

class HabitGraph extends StatelessWidget {
  List<FlSpot> dotsList;
  int step;
  int maxValue;

  HabitGraph(this.dotsList, {super.key}): step = 1, maxValue = 1{
    double minValue = double.infinity;
    double maxValue = double.negativeInfinity;
    for(FlSpot spot in dotsList){
      if(spot.y < minValue){
        minValue = spot.y;
      }
      if(spot.y > maxValue){
        maxValue = spot.y;
      }
    }
    this.maxValue = maxValue.ceil();
    step = ((maxValue - minValue) / 5).ceil();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 12,
  );
  Widget text = const Text('');
  if(value.toInt()%2 == 0){
    DateTime date = DateTime.now().subtract(Duration(days: (10-value.toInt())*7));
    text = Text("${DateFormat.d().format(date)} ${DateFormat.MMM().format(date)}", style: style);
  }
  

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
  );
  String text = value.toInt()%(step)==0? value.toInt().toString():"";

  return Text(text, style: style, textAlign: TextAlign.left);
}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: false,
      drawVerticalLine: true,
      horizontalInterval: 2,
      verticalInterval: 2,
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: maxValue.toDouble()+step,
    lineBarsData: [
      LineChartBarData(
        spots: dotsList,
        isCurved: false,
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white30],
        ),
        barWidth: 5,
        isStrokeCapRound: false,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.white10]
                .map((color) => color.withOpacity(0.3))
                .toList(),
          ),
        ),
      ),
    ],
  );
}


}

