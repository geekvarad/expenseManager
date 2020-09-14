import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_scheduler/model/db.dart';
//import 'package:task_scheduler/widgets/chart.dart';

class Display extends StatelessWidget {
  final Function f;
  Display(this.f);
  del(int i) {
    f(i);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 2 / 3 - 80,
      child: ListView.builder(
        itemCount: DB.db.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 5,
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      (DB.db[i].price.toStringAsFixed(2)).toString(),
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.all(20),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              DB.db[i].title.toString().toUpperCase(),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              DateFormat('yyyy-MM-dd').format(DB.db[i].date) +
                                  '\n' +
                                  DateFormat('h-mm-ss').format(DB.db[i].date),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        del(i);
                      },
                      child: Text('delete'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
//db[i].date.day.toString() +
//     '/' +
//   db[i].date.month.toString() +
// '/' +
// db[i].date.year.toString()
