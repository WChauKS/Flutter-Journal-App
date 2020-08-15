import 'package:intl/intl.dart';

String formatDate(timestamp, details) {
  if(details != 1){
    // formatting for the list screen
    return DateFormat('EEE, MM/dd/yyyy').format(timestamp);
  } else {
    // formatting for the details screen
    return DateFormat('MM/dd/yyyy - kk:mm').format(timestamp);
  }
}