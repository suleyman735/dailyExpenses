import 'package:dailyexpenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: FittedBox(child: Text('\$${transaction[index].amount}')),
              ),
            ),
            title: Text(
              transaction[index].title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(transaction[index].date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => deleteTx(transaction[index].id),
            ),
          ),
        );
      },
      itemCount: transaction.length,
    );
  }
}

// Card(
// child: Row(
// children: [
// Container(
// margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// decoration: BoxDecoration(
// border: Border.all(
// color: Theme.of(context).primaryColor, width: 2),
// ),
// padding: EdgeInsets.all(10),
// child: Text(
// '\$${transaction[index].amount.toStringAsFixed(2)}',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 20,
// color: Theme.of(context).primaryColor,
// ),
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// transaction[index].title,
// style:
// TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// ),
// Text(
// DateFormat('yyyy-MM-dd').format(transaction[index].date),
// style: TextStyle(color: Colors.grey),
// ),
// ],
// )
// ],
// ),
// );
