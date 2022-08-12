import 'package:expense_tracker/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatelessWidget {
  List<Expense> expenseList;

  ExpenseList(this.expenseList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: expenseList.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text('No expense has been added'),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/nodata.png',
                    fit: BoxFit.cover,
                  ),
                ],
              )
            : ListView.builder(
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
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            "\$${expenseList[i].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).errorColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expenseList[i].title.toString(),
                              style: Theme.of(context).textTheme.bodyText1,
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
