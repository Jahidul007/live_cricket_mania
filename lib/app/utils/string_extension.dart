import 'package:cricket_mania/app/module/core/network/error_handlers.dart';
import 'package:intl/intl.dart';

extension MyString on String {
  String capitalize() {
    if (trim().isEmpty) return "";

    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String lastChars(int n) => substring(length - n);

  String capitalizeOnlyFirstLater() {
    if (trim().isEmpty) return "";

    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String capitalizeEachWord() {
    if (trim().isEmpty) return "";

    List<String> parts = split(" ");
    String newString = "";
    for (var element in parts) {
      newString += element.capitalize();
      newString += " ";
    }
    return newString;
  }

  String capitalizeEachWordIfNotAlready() {
    if (trim().isEmpty) return "";

    List<String> parts = split(" ");
    String newString = "";
    for (var element in parts) {
      newString += element.capitalizeOnlyFirstLater();
      newString += " ";
    }
    return newString;
  }

  String getFormattedDateTimeFromString({required String desiredFormat}) {
    String formattedDate = "";
    if (isNotEmpty) {
      try {
        DateTime _date = DateTime.parse(this);
        // DateTime dateTime = DateFormat(currentFormat).parse(date);
        formattedDate = DateFormat(desiredFormat).format(_date);
      } catch (e) {
        logger.d("$e");
      }
    }
    return formattedDate;
  }

  String getFormattedDateFromFormattedString(
      {required String currentFormat,
      required String desiredFormat,
      isUtc = false}) {
    String formattedDate = "";
    if (isNotEmpty) {
      try {
        DateTime dateTime =
            DateFormat(currentFormat).parse(this, isUtc).toLocal();
        formattedDate = DateFormat(desiredFormat).format(dateTime);
      } catch (e) {
        logger.d("$e");
      }
    }
    return formattedDate;
  }

  String getEnumFormattedString() {
    return replaceAll("_", " ").capitalizeEachWord();
  }

  String getUtcFormattedDate(
      {currentDateFormat = "yyyy-MM-dd HH:mm:ss", bool isUtc = false}) {
    String formattedDate = "";
    if (isNotEmpty) {
      String value = this;
      DateTime now = DateTime.now();

      try {
        if (currentDateFormat == "yyyy-MM-ddTHH:mm:ss") {
          value = value.split("T").first +
              " ${now.hour}:${now.minute}:${now.second}";
        } else if (value.length <= 10) {
          value = value + " ${now.hour}:${now.minute}:${now.second}";
        }
        DateTime dateTime =
            DateFormat("yyyy-MM-dd HH:mm:ss").parse(value, isUtc).toUtc();
        formattedDate =
            DateFormat("yyyy-MM-ddTHH:mm:ss").format(dateTime) + "Z";
      } catch (e) {
        logger.d("utc formatted time$e");
      }
    }
    return formattedDate;
  }
}
