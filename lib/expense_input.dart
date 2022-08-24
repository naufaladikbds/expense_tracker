import 'package:expense_tracker/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseInput extends StatefulWidget {
  final void Function(Expense) addNewExpense;

  ExpenseInput(this.addNewExpense) {
    print("Expense input constructor called");
  }

  @override
  State<ExpenseInput> createState() {
    print("Expense input state created");
    return _ExpenseInputState();
  }
}

class _ExpenseInputState extends State<ExpenseInput> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  var transDate = DateTime.now();

  _ExpenseInputState() {
    print("constructor expense input state called");
  }

  setTransDate(val) {
    transDate = val;
  }

  @override
  void initState() {
    print("INIT STATE expense input");
    super.initState();
  }

  // String titleInput = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            renderTextField("Title", titleController),
            SizedBox(height: 10),
            renderTextField("Amount", amountController),
            SizedBox(height: 10),
            CustomDatePicker(
              transDate,
              setTransDate,
            ),
            TextButton(
              onPressed: () {
                if (titleController.value.text.isNotEmpty ||
                    double.parse(amountController.value.text) <= 0) {
                  widget.addNewExpense(
                    Expense(
                      id: DateTime.now().toString(),
                      title: titleController.value.text,
                      amount: double.parse(amountController.value.text),
                      date: transDate,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text("Add Transaction"),
            ),
          ],
        ),
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

class CustomDatePicker extends StatefulWidget {
  DateTime transDate;
  void Function(DateTime) setTransDate;

  CustomDatePicker(this.transDate, this.setTransDate);

  @override
  State<CustomDatePicker> createState() {
    return CustomDatePickerState();
  }
}

class CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1999),
            lastDate: DateTime(2200),
          ).then((value) {
            setState(() {
              widget.transDate = value!;
              widget.setTransDate(value);
            });
          });
        },
        child: Text(DateFormat.yMMMEd().format(widget.transDate)),
      ),
    );
  }
}
