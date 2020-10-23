import 'dart:math';
import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Color _bgTheme;

  @override
  void initState() {
   const changingColor =[
      Colors.yellow, Colors.red, Colors.pink, Colors.purple, Colors.deepOrangeAccent
    ] ;

   _bgTheme = changingColor[Random().nextInt(5)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: widget.transactions.isEmpty ? Column(
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
                backgroundColor: _bgTheme,
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                      child: Text('\$${widget.transactions[index].amount}')),
                ),
              ),
              title: Text(widget.transactions[index].title,style: Theme.of(context).textTheme.title,),
              subtitle: Text(DateFormat.yMMMd().format(widget.transactions[index].date)),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor,),
                onPressed: () => widget.deleteTransaction(widget.transactions[index].id),
              ),
            ),
          );
        },
        itemCount: widget.transactions.length,
      )
    );
  }
}
