import 'package:flutter/material.dart';

import './transaction_form.dart';
import './transaction_list.dart';

import '../models/transaction.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'mcbook pro',
      amount: 150000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'mechanical keyboard mechanical keyboard mechanical keyboard mechanical keyboardmechanical keyboardmechanical keyboardmechanical keyboardmechanical keyboardmechanical keyboard',
      amount: 3456.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'weekly groceries',
      amount: 1450.25,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'house bill',
      amount: 1100,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'electricity bill',
      amount: 8000.80,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(),
        TransactionList(transactions),
      ],
    );
  }
}
