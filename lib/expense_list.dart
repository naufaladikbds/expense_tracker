import 'package:expense_tracker/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatelessWidget {
  List<Expense> expenseList;

  ExpenseList(this.expenseList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Color.fromARGB(255, 214, 214, 214),
        child: ListView.builder(
          itemCount: expenseList.length,
          itemBuilder: (ctx, i) => Card(
            margin: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
            ),
            child: Container(
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
                      "\$${expenseList[i].amount.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expenseList[i].title.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(expenseList[i].date),
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
