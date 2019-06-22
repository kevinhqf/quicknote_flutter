import 'package:sprintf/sprintf.dart';
import 'package:intl/intl.dart';

class Utils {
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

  static String getDateAndTime(String time) {
    return time.substring(5, 16);
  }

  static bool isPhoneNumber(String phone) {
    if (phone == null || phone.isEmpty) return false;
    var reg = "^[1]\\d{10}\$";
    return RegExp(reg).hasMatch(phone);
  }

  static bool isToday(String time) {
    var formatter = DateFormat("yyyy-MM-dd");
    return time.substring(0, 10) == formatter.format(DateTime.now());
  }
}
