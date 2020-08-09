import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function _addNewTransaction;

  TransactionForm(this._addNewTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget._addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Enter title',
                labelText: 'Name *',
              ),
              autocorrect: true,
              keyboardType: TextInputType.text,
              controller: titleController,
              onSubmitted: (_) => submitData(), //use _ when you won't use the argument
              // onChanged: (val) { titleInput = val; }
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Enter amount',
                labelText: 'Amount *',
              ),
              autocorrect: true,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: amountController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) { amountInput = val; }
            ),
            RaisedButton(
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('Add entry'),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
