import 'package:flutter/material.dart';
import '../model/db.dart';

class Chart extends StatelessWidget {
  double max() {
    double j = DB.output[0];
    for (int i = 1; i < 7; i++) {
      if (DB.output[i] > j) j = DB.output[i];
    }
    return j;
  }

  double get index {
    if (DB.output.isNotEmpty) {
      Chart obj = new Chart();
      return obj.max();
    } else
      return 1;
  }

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height / 3;
    double wei = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      child: Container(
        height: hei - 20,
        width: wei,
        decoration: BoxDecoration(
            //border: Border.all(color: Colors.black),
            //backgroundBlendMode: BlendMode.color,
            color: Colors.blue),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          //physics: NeverScrollableScrollPhysics(),
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              for (int i = 0; i < 7; i++)
                Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Column(
                    children: <Widget>[
                      Text(
                        DB.output[i].toString(),
                        style:
                            Theme.of(context).appBarTheme.textTheme.headline6,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                              width: 10,
                              height: hei - 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              )),
                          Container(
                            width: 10,
                            height: (hei - 100) * (DB.output[i] / index),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          )
                        ],
                      ),
                      Text(
                        DB.DayName[i],
                        style: Theme.of(context).accentTextTheme.caption,
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
