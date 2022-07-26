import 'package:expense_tracker/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpenseInput extends StatelessWidget {
  void Function(Expense) addNewExpense;

  ExpenseInput(this.addNewExpense);

  String titleInput = '';
  String amountInput = '';

  void setTitle(input) {
    titleInput = input;
  }

  void setAmount(input) {
    amountInput = input;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          renderTextField("Title", setTitle),
          SizedBox(height: 10),
          renderTextField("Amount", setAmount),
          SizedBox(height: 10),
          TextButton(
              onPressed: () {
                print('title is: $titleInput, amount is $amountInput');
                addNewExpense(Expense(
                  id: '23',
                  title: titleInput,
                  amount: double.parse(amountInput),
                  date: DateTime.now(),
                ));
              },
              child: Text("Add Transaction"))
        ],
      ),
    );
  }

  TextField renderTextField(
      String labelText, void Function(dynamic) onChanged) {
    return TextField(
      onChanged: (input) {
        onChanged(input);
      },
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
