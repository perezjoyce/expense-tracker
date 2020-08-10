import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function _addNewTransaction;

  TransactionForm(this._addNewTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isNotEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget._addNewTransaction(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      //asynchronous part
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(), //use _ when you won't use the argument
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
              controller: _amountController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) { amountInput = val; }
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_selectedDate == null ? 'No Date Chosen' : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    style: TextStyle(
                      color: Colors.black87,
                    )),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text('Choose Date'),
                  onPressed: _presentDatePicker,
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
              textColor: Theme.of(context).textTheme.button.color,
              padding: EdgeInsets.all(20),
              shape: StadiumBorder(),
              child: Text(
                'Add Expense',
                // ignore: deprecated_member_use
                style: Theme.of(context).appBarTheme.textTheme.title,
              ),
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
