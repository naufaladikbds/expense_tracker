import 'dart:math';

import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expense_chart.dart';
import 'package:expense_tracker/expense_input.dart';
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
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Expense> expenseHistory = [
    Expense(
      id: "01",
      title: "Jajan",
      amount: 10000,
      date: DateTime.now(),
    ),
    Expense(
      id: "02",
      title: "New car",
      amount: 500000,
      date: DateTime.now(),
    ),
  ];

  void addNewExpense(Expense expense) {
    setState(() {
      expenseHistory.add(expense);
      print(expenseHistory.length);
    });
  }

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
            ExpenseInput(addNewExpense),
            ExpenseList(expenseHistory),
          ],
        ),
      ),
    );
  }
}
