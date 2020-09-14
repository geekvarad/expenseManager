import 'package:intl/intl.dart';

class Day {
  DateTime date;
  Day(this.date);
  String day() {
    return (new DateFormat.EEEE().format(date));
  }
}
