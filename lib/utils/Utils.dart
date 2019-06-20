import 'package:sprintf/sprintf.dart';

String getMoneyFormat(double money) {
  var str = sprintf("%.2f", [money]);
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
  return format.substring(0,format.length-1)+str.substring(index);
}