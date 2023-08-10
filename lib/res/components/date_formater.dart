import 'package:intl/intl.dart';

String getFormattedDate(DateTime date) {
  // Format the date using the desired pattern: "d'th' MMMM y"
  String formattedDate = DateFormat("MMMM d',' y").format(date);
  return formattedDate;
}