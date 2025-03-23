import 'package:intl/intl.dart';

String beautyDate(DateTime dateTime) {
  final DateTime now = DateTime.now();
  final DateFormat dateFormat = DateFormat.yMMMd(
      'en_US'); //MMM returns abrebiations for months MMMM returns complete months
  final DateFormat timeFormat = DateFormat.jm('en_US');
  final Duration difference = now.difference(dateTime);
  if (now.difference(dateTime).inSeconds < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 6) {
    return '${difference.inHours} hours ago';
  } else if (now.month == dateTime.month &&
      now.year == dateTime.year &&
      (now.day - dateTime.day) != 0) {
    return timeFormat.format(dateTime);
  }

  return dateFormat.format(dateTime);
}
