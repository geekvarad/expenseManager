import 'package:flutter/material.dart';
import 'package:task_scheduler/model/transaction.dart';
import 'package:task_scheduler/widgets/chart.dart';
//import 'package:task_scheduler/widgets/chart.dart';
import 'package:task_scheduler/widgets/display.dart';
import 'package:task_scheduler/model/db.dart';

class AddTransaction extends StatefulWidget {
  final bool display;
  final bool addwidget;
  AddTransaction({@required this.display, @required this.addwidget});
  @override
  _AddTransactionState createState() =>
      _AddTransactionState(display, addwidget);
}

class _AddTransactionState extends State<AddTransaction> {
  //final List<Transaction> db = [
  //Transaction(price: 20.1, title: 'demo', date: DateTime.now()),
  //];
  bool check = false;
  bool display;
  bool addwidget;
  _AddTransactionState(this.display, this.addwidget);
  final TextEditingController price = TextEditingController();
  final TextEditingController title = TextEditingController();
  void add(String name, double amt) {
    if (check == true)
      setState(() {
        DB.db.add(Transaction(price: amt, title: name, date: DateTime.now()));
        DB.work();
      });
    check = false;
  }

  void delete(int a) {
    setState(() {
      DB.db.removeAt(a);
      DB.work();
    });
  }

  void onpress() {
    String s = title.text;
    double num = double.parse(price.text);
    if (s.isEmpty || num <= 0) return;
    check = true;
    //add(title.text, double.parse(price.text));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (addwidget == true)
          Container(
            child: Card(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: price,
                    decoration: InputDecoration(labelText: 'price'),
                    keyboardType: TextInputType.number,
                    onSubmitted: (value) => onpress(),
                  ),
                  TextField(
                    controller: title,
                    decoration: InputDecoration(labelText: 'EnterTitle'),
                    onSubmitted: (value) => onpress(),
                  ),
                  RaisedButton(
                    onPressed: () {
                      add(title.text, double.parse(price.text));
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  )
                ],
              ),
            ),
          ),
        if (display == true)
          if (DB.db.isNotEmpty)
            Column(
              children: [
                Chart(),
                Display(delete),
              ],
            )
          else
            Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/welcome.jpg',
                fit: BoxFit.fill,
              ),
            ),
      ],
    );
  }
}
