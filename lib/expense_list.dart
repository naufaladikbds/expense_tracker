import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  List<Expense> expenseList;
  void Function(String) deleteExpense;

  ExpenseList(this.expenseList, this.deleteExpense);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: expenseList.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  SizedBox(height: 30),
                  Text("No transactions yet!"),
                  SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/nodata.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            )
          : ListView(
              children: expenseList
                  .map(
                    (e) => ExpenseItem(
                      expense: e,
                      deleteExpense: deleteExpense,
                      key: Key(e.id),
                    ),
                  )
                  .toList(),

              // itemBuilder: (ctx, i) => Card(
              //   margin: EdgeInsets.only(
              //     top: 10,
              //     right: 10,
              //     left: 10,
              //   ),
              //   child: Container(
              //     padding: const EdgeInsets.only(
              //         top: 10, bottom: 10, left: 15, right: 30),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Container(
              //           padding: EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //             border: Border.all(
              //               color: Theme.of(context).primaryColor,
              //               width: 2,
              //             ),
              //           ),
              //           child: Text(
              //             "\$${expenseList[i].amount.toStringAsFixed(2)}",
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               color: Theme.of(context).errorColor,
              //             ),
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               expenseList[i].title.toString(),
              //               style: Theme.of(context).textTheme.bodyText1,
              //             ),
              //             Text(
              //               DateFormat.yMMMd().format(expenseList[i].date),
              //               style: TextStyle(
              //                 color: Color.fromARGB(255, 165, 165, 165),
              //               ),
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ),
    );
  }
}
