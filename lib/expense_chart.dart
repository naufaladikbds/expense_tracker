import 'package:expense_tracker/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseChart extends StatelessWidget {
  final List<Expense> recentExpenses;

  const ExpenseChart({required this.recentExpenses});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for (var i = 0; i < recentExpenses.length; i++) {
        if (recentExpenses[i].date.day == weekday.day &&
            recentExpenses[i].date.month == weekday.month &&
            recentExpenses[i].date.year == weekday.year) {
          totalSum = totalSum + recentExpenses[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 3),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get weeklySpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return (previousValue + (element['amount'] as double));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color.fromARGB(255, 214, 214, 214),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 8, bottom: 12, left: 10, right: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues
              .map((e) => CandleChart(
                    day: e['day'] as String,
                    amountSpent: e['amount'] as double,
                    weeklySpending: weeklySpending,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class CandleChart extends StatelessWidget {
  double amountSpent;
  String day;
  double weeklySpending;

  CandleChart(
      {required this.day,
      required this.amountSpent,
      required this.weeklySpending});

  @override
  Widget build(BuildContext context) {
    double percentAmountSpent = amountSpent / weeklySpending;
    print(percentAmountSpent);

    return Column(
      children: [
        Text("\$"),
        Container(
          color: Colors.grey,
          width: 10,
          height: 50,
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: amountSpent == 0 ? 0 : percentAmountSpent,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
          // child: Container(
          //   color: Colors.blue,
          //   width: 10,
          //   height: amountSpent == 0 ? 0 : percentAmountSpent * 100 / 2,
          // ),
        ),
        Text(day),
      ],
    );
  }
}
