import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expense_input.dart';
import 'package:expense_tracker/expense_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpenseListAndInput extends StatefulWidget {
  @override
  State<ExpenseListAndInput> createState() => _ExpenseListAndInputState();
}

class _ExpenseListAndInputState extends State<ExpenseListAndInput> {
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ExpenseInput(addNewExpense),
          ExpenseList(expenseList),
        ],
      ),
    );
  }
}
