import 'package:dailyexpenses/models/transaction.dart';
import 'package:dailyexpenses/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSPending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }
//huhuhiuhoojhjhkjsdcl sdkchdshhwdfsdcsdfcgxd
  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                data['day'] as String,
                data['amount'] as double,
                totalSPending == 0.0
                    ? 0
                    : (data['amount'] as double) / totalSPending),
          );
        }).toList(),
      ),
    );
  }
}
