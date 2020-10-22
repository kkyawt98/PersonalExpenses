import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty ? Column(
children: <Widget>[
  Text("No transaction is added yet!", style: Theme.of(context).textTheme.title,),
  Image.asset('assets/images/empty.png')
],
      ) : ListView.builder(
        itemBuilder: (ctx, index){
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
            elevation: 10,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                      child: Text('\$${transactions[index].amount}')),
                ),
              ),
              title: Text(transactions[index].title,style: Theme.of(context).textTheme.title,),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor,),
                onPressed: () => deleteTransaction(transactions[index].id),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      )
    );
  }
}
