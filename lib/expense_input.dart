import 'package:expense_tracker/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpenseInput extends StatelessWidget {
  final void Function(Expense) addNewExpense;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  ExpenseInput(this.addNewExpense);

  // String titleInput = '';
  // String amountInput = '';

  // void setTitle(input) {
  //   titleInput = input;
  // }
  // void setAmount(input) {
  //   amountInput = input;
  // }

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
                print(
                  'title is: $titleController, amount is $amountController',
                );
                addNewExpense(
                  Expense(
                    id: DateTime.now().toString(),
                    title: titleController.value.text,
                    amount: double.parse(amountController.value.text),
                    date: DateTime.now(),
                  ),
                );
              },
              child: Text("Add Transaction"))
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
