import 'package:task_scheduler/model/transaction.dart';
import 'day.dart';

class DB {
  static final List<Transaction> db = [
    //Transaction(price: 20.1, title: 'demo', date: DateTime.now()),
  ];
  static List<double> output = [0, 0, 0, 0, 0, 0, 0];
  static List<String> DayName = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];
  static void work() {
    for (var i = 0; i < 7; i++) {
      output[i] = 0;
    }
    for (int i = 0; i < db.length; i++) {
      var obj = new Day(db[i].date);
      String s = obj.day();
      print(s);
      switch (s) {
        case 'Monday':
          output[1] += db[i].price;
          break;
        case 'Tuesday':
          output[2] += db[i].price;
          break;
        case 'Wedday':
          output[3] += db[i].price;
          break;
        case 'Thursday':
          output[4] += db[i].price;
          break;
        case 'Friday':
          output[5] += db[i].price;
          break;
        case 'Saturday':
          output[6] += db[i].price;
          break;
        case 'Sunday':
          output[0] += db[i].price;
          break;
        default:
          print(s);
          break;
      }
    }
  }
}
