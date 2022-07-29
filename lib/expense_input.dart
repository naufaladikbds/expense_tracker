import 'package:expense_tracker/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpenseInput extends StatefulWidget {
  final void Function(Expense) addNewExpense;

  ExpenseInput(this.addNewExpense);

  @override
  State<ExpenseInput> createState() => _ExpenseInputState();
}

class _ExpenseInputState extends State<ExpenseInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  // String titleInput = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          renderTextField("Title", titleController),
          SizedBox(height: 10),
          renderTextField("Amount", amountController),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              if (titleController.value.text.isNotEmpty ||
                  double.parse(amountController.value.text) <= 0) {
                widget.addNewExpense(
                  Expense(
                    id: DateTime.now().toString(),
                    title: titleController.value.text,
                    amount: double.parse(amountController.value.text),
                    date: DateTime.now(),
                  ),
                );
                Navigator.pop(context);
              }
            },
            child: Text("Add Transaction"),
          ),
        ],
      ),
    );
  }

  TextField renderTextField(
    String labelText,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      keyboardType: labelText == 'Amount' ? TextInputType.number : null,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
