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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Expense> expenseList = [
    Expense(
      id: "01",
      title: "Bruh",
      amount: 10500,
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
      expenseList.add(expense);
      print(expenseList[0].amount);
    });
  }

  void startAddNewExpense(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: ExpenseInput(addNewExpense),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print("MAIN IS CALLED AGAIN");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              startAddNewExpense(context);
            },
            icon: Icon(Icons.add_box),
          ),
        ],
        title: Text(
          "Expense Tracker",
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 179, 179, 179),
        child: Column(
          children: [
            ExpenseChart(),
            ExpenseList(expenseList),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddNewExpense(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
