import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function _addNewTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  TransactionForm(this._addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Enter title',
                labelText: 'Name *',
              ),
              autocorrect: true,
              controller: titleController,
              // onChanged: (val) { titleInput = val; }
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Enter amount',
                labelText: 'Amount *',
              ),
              autocorrect: true,
              keyboardType: TextInputType.number,
              controller: amountController,
              // onChanged: (val) { amountInput = val; }
            ),
            RaisedButton(
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('Add entry'),
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
                _addNewTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
