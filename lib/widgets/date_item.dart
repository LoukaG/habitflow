import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateItem extends StatelessWidget{
  final DateTime date;
  final bool isSelected;

  const DateItem({required this.date, required this.isSelected, super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 320,
      width: MediaQuery.of(context).size.width * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(DateFormat.d().format(date), style: isSelected? theme.textTheme.bodyMedium?.copyWith(color: Colors.black): theme.textTheme.bodyMedium,),
          ),
          Text(DateFormat.E().format(date), style: isSelected? theme.textTheme.bodyMedium?.copyWith(color: Colors.white): theme.textTheme.bodyMedium?.copyWith(color: Colors.white60)),
        ],
      )
    );
  }

}