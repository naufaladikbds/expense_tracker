import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'expense.dart';
import 'dart:math';

class ExpenseItem extends StatefulWidget {
  const ExpenseItem({
    Key? key,
    required this.expense,
    required this.deleteExpense,
  }) : super(key: key);

  final Expense expense;
  final void Function(String p1) deleteExpense;

  @override
  State<ExpenseItem> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  Color _bgColor = Colors.purple;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.grey,
    ];

    _bgColor = availableColors.elementAt(Random().nextInt(3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 6, bottom: 0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text("\$${widget.expense.amount.toStringAsFixed(0)}"),
            ),
          ),
        ),
        title: Text(widget.expense.title),
        subtitle: Text(
          DateFormat.yMMMEd().format(widget.expense.date),
        ),
        trailing: MediaQuery.of(context).size.width < 600
            ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.deleteExpense(widget.expense.id);
                },
              )
            : Container(
                width: 100,
                child: Row(
                  children: [
                    Text("Delete"),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        widget.deleteExpense(widget.expense.id);
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
