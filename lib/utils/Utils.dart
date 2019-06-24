import 'package:sprintf/sprintf.dart';
import 'package:intl/intl.dart';

class Utils {
  // money
  static String getMoneyFormat(double money) {
    var tmpMoney = money;
    if (tmpMoney < 0) tmpMoney *= -1;
    var str = sprintf("%.2f", [tmpMoney]);
    var index = str.indexOf('.');
    var list = List<String>();
    for (var i = index; i > 0; i -= 3) {
      if (i - 3 >= 0) {
        list.insert(0, str.substring(i - 3, i));
      } else {
        list.insert(0, str.substring(0, i));
      }
    }
    var format = "";
    for (var item in list) {
      format = format + item + ",";
    }
    return format.substring(0, format.length - 1) + str.substring(index);
  }

  static String getSimpleMoneyFormat(double money) {
    var sign = "￥";
    var tmpMoney = money;
    if (money < 0) {
      tmpMoney *= -1;
      sign = "-￥";
    }
    if (tmpMoney < 1000) return sign + getMoneyFormat(tmpMoney);

    if (tmpMoney >= 1000.0) {
      return "$sign${(tmpMoney / 1000).floor()}K";
    } else if (tmpMoney >= 1000000.0) {
      return "$sign${(tmpMoney / 1000000).floor()}M";
    } else if (tmpMoney >= 1000000000.0) {
      return "$sign${(tmpMoney / 1000000000).floor()}B";
    }
    return "￥0";
  }

  // time
  static String getDateAndTime(String time) {
    return time.substring(5, 16);
  }

  static String getDate(String time) {
    return time.substring(0, 10);
  }

  static String getYearAndMonth(String time) {
    return time.substring(0, 7);
  }

  static String getYear(String yearAndMonth) {
    var groups = yearAndMonth?.split('-');
    return groups.isNotEmpty ? groups[0] : '';
  }

  static String getMonth(String yearAndMonth) {
    var groups = yearAndMonth?.split('-');
    var month = groups.length > 1 ? groups[1] : '';
    if (month.isNotEmpty && month[0] == '0') return month[1];
    return month;
  }

  static String getDay(String time) {
    return time.substring(8, 10);
  }

  static bool isToday(String time) {
    var formatter = DateFormat("yyyy-MM-dd");
    return time.substring(0, 10) == formatter.format(DateTime.now());
  }

  static String getNowDate() {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
  }

  static bool isSameDate(String time1, String time2) {
    return getDate(time1) == getDate(time2);
  }

  static bool isSameYearAndMonthWith(String yearAndMonth, String time) {
    return yearAndMonth == getYearAndMonth(time);
  }

  static bool isPhoneNumber(String phone) {
    if (phone == null || phone.isEmpty) return false;
    var reg = "^[1]\\d{10}\$";
    return RegExp(reg).hasMatch(phone);
  }
}
