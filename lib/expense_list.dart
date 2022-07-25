import 'package:expense_tracker/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpenseList extends StatelessWidget {
  List<Expense> expenseHistory;

  ExpenseList(this.expenseHistory);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.green,
        child: ListView.builder(
          itemCount: expenseHistory.length,
          itemBuilder: (ctx, i) => Text(expenseHistory[i].amount.toString()),
        ),
      ),
    );
  }
}
