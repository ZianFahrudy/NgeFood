part of 'extension.dart';

extension DateTimeExtension on DateTime {
  String get shortDateTime => "${this.shortMonth} ${this.day}, ${this.hour}:00";

  String get shortMonth {
    switch (this.month) {
      case 1:
        return "Jan";
        break;
      case 2:
        return "Feb";
        break;
      case 3:
        return "Mar";
        break;
      case 4:
        return "Apr";
        break;
      case 5:
        return "Mei";
        break;
      case 6:
        return "Jun";
        break;
      case 7:
        return "Jul";
        break;
      case 8:
        return "Agu";
        break;
      case 9:
        return "Sep";
        break;
      case 10:
        return "Okt";
        break;
      case 11:
        return "Nov";
        break;
      default:
        return "Des";
    }
  }
}
