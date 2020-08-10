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
      child: Padding(
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text('No Date Chosen'),
                FlatButton(
                  child: Text('Choose Date'),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 60,
              minWidth: double.infinity,
              color: Theme.of(context).accentColor,
              padding: EdgeInsets.all(20),
              shape: StadiumBorder(),
              child: Text(
                'Add Expense',
                // ignore: deprecated_member_use
                style: Theme.of(context).appBarTheme.textTheme.title,
              ),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
