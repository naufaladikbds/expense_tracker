import 'dart:math';

import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expense_chart.dart';
import 'package:expense_tracker/expense_input.dart';
import 'package:expense_tracker/expense_list.dart';
import 'package:expense_tracker/expense_list_and_input.dart';
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

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MAIN IS CALLED AGAIN");
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
            ExpenseListAndInput(),
          ],
        ),
      ),
    );
  }
}
