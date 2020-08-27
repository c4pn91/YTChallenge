class StringUtils {
  static String getViewCount(int viewCount) {
    String viewString = viewCount.toString();
    String value = "";
    if (viewString.length >= 10) {
      value = "B";
      viewString = compressViews([11, 12], viewString);
    } else if (viewString.length >= 7) {
      value = "M";
      viewString = compressViews([8, 9], viewString);
    } else if (viewString.length >= 4) {
      value = "K";
      viewString = compressViews([5, 6], viewString);
    }
    return viewString + value;
  }

  static String compressViews(List<int> numbers, String viewString) {
    if (viewString.length == numbers[0]) {
      viewString = viewString.substring(0, 3);
    } else if (viewString.length == numbers[1]) {
      viewString = viewString.substring(0, 2);
    } else {
      String newString = viewString.substring(0, 1);
      viewString = newString +"." + viewString.substring(1, 2);
    }
    return viewString;
  }

  static String getTimeSinceUpload(DateTime uploadDate) {
    DateTime now = DateTime.now();
    int minutes = now.difference(uploadDate).inMinutes;
    int hours = now.difference(uploadDate).inHours;
    int days = now.difference(uploadDate).inDays;
    double weeks = days / 7;
    double months = weeks / 4;
    double years = days /365;

    if (years >= 1) {
      String year = " año";
      if (years >= 2) {
        year = " años";
      }
      return years.toInt().toString() + year;
    } else if (months >= 1){
      String month = " mes";
      if (months >= 2) {
        month = " meses";
      }
      return months.toInt().toString() + month;
    } else if (weeks >= 1){
      String week = " semana";
      if (weeks >= 2) {
        week = " semanas";
      }
      return weeks.toInt().toString() + week;
    } else if (days >= 1){
      String day = " día";
      if (days >= 2) {
        day = " dias";
      }
      return days.toInt().toString() + day;
    } else if (hours >= 1){
      String hour = " hora";
      if (hours >= 2) {
        hour = " horas";
      }
      return hours.toInt().toString() + hour;
    } else if (minutes >= 1){
      String minute = " minutos";
      if (minutes >= 2) {
        minute = " minutos";
      }
      return minutes.toInt().toString() + minute;
    } else {
      return "hace instantes";
    }
  }
}

