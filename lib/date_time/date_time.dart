String getCurrentDateYYYYMMDD() {
  var now = DateTime.now();
  return "${now.year.toString().padLeft(4, '0')}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}";
}

DateTime convertYYYYMMDDToDateTime(String yyyymmdd) {
  int year = int.parse(yyyymmdd.substring(0, 4));
  int month = int.parse(yyyymmdd.substring(4, 6));
  int day = int.parse(yyyymmdd.substring(6, 8));
  return DateTime(year, month, day);
}

String convertDateTimeToYYYYMMDD(DateTime dateTime) {
  return "${dateTime.year.toString().padLeft(4, '0')}${dateTime.month.toString().padLeft(2, '0')}${dateTime.day.toString().padLeft(2, '0')}";
}
