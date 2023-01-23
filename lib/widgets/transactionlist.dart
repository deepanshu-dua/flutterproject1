import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 340,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'No Transaction',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      width: 300,
                      child: Image.asset(
                        'assets/image/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1,
                            )),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(transactions[index].title,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle),
                            Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade900),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
