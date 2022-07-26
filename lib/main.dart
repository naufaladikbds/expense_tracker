import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expense_chart.dart';
import 'package:expense_tracker/expense_list.dart';
import "package:flutter/material.dart";

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Expense Tracker", home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  final List<Expense> expenseHistory = [
    Expense(
      id: "01",
      title: "Jajan",
      amount: 10000,
      description: 'oops',
      date: DateTime.now(),
    ),
    Expense(
      id: "02",
      title: "New car",
      amount: 500000,
      description: 'hehe',
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker",
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 179, 179, 179),
        child: Column(
          children: [
            ExpenseChart(),
            ExpenseList(expenseHistory),
          ],
        ),
      ),
    );
  }
}
