import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(
        itemBuilder: (context,index){
            return Container(
              height:MediaQuery.of(context).size.height*0.4,
              child: Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      '\$${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].title,
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
          ),
            );
        },
        itemCount:transactions.length,
      ),
    );
  }
}
