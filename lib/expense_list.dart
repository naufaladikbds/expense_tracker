import 'package:expense_tracker/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatelessWidget {
  List<Expense> expenseHistory;

  ExpenseList(this.expenseHistory);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(10),
        color: Color.fromARGB(255, 214, 214, 214),
        child: ListView.builder(
          itemCount: expenseHistory.length,
          itemBuilder: (ctx, i) => Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 15, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "\$${expenseHistory[i].amount.toInt().toString()}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expenseHistory[i].title.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        DateFormat('yyyy/MM/dd').format(expenseHistory[i].date),
                        style: TextStyle(
                          color: Color.fromARGB(255, 165, 165, 165),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
