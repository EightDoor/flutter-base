import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';

var selectData = {
  DateMode.YMDHMS: '',
  DateMode.YMDHM: '',
  DateMode.YMDH: '',
  DateMode.YMD: '',
  DateMode.YM: '',
  DateMode.Y: '',
  DateMode.MDHMS: '',
  DateMode.HMS: '',
  DateMode.MD: '',
  DateMode.S: '',
};

/// 业务utils
class BusinessUtils {
  // 表单根据name替换对应的value值
  static List<Map<String, dynamic>> replaceFormValue(
      List<Map<String, dynamic>> list, List<Map<String, dynamic>> obj) {
    final List<Map<String, dynamic>> r = list;
    obj.forEach((v) {
      final int index =
          r.indexWhere((e) => e['properties']["name"] == v['name']);
      if (index != -1) {
        r[index]["properties"]['value'] = v['value'];
      }
    });

    return r;
  }

  // 格式化选择时间
  static String? formatModel(PDuration p, DateMode modeS) {
    switch (modeS) {
      case DateMode.YMDHMS:
        selectData[modeS] =
            '${p.year}-${p.month}-${p.day} ${p.hour}:${p.minute}:${p.second}';
        break;
      case DateMode.YMDHM:
        selectData[modeS] =
            '${p.year}-${p.month}-${p.day} ${p.hour}:${p.minute}';
        break;
      case DateMode.YMDH:
        selectData[modeS] = '${p.year}-${p.month}-${p.day} ${p.hour}';
        break;
      case DateMode.YMD:
        selectData[modeS] = '${p.year}-${p.month}-${p.day}';
        break;
      case DateMode.YM:
        selectData[modeS] = '${p.year}-${p.month}';
        break;
      case DateMode.Y:
        selectData[modeS] = '${p.year}-${p.month}';
        break;
      case DateMode.MDHMS:
        selectData[modeS] =
            '${p.month}-${p.day} ${p.hour}:${p.minute}:${p.second}';
        break;
      case DateMode.HMS:
        selectData[modeS] = '${p.hour}:${p.minute}:${p.second}';
        break;
      case DateMode.MD:
        selectData[modeS] = '${p.month}-${p.day}';
        break;
      case DateMode.S:
        selectData[modeS] = '${p.second}';
        break;
    }
    return selectData[modeS];
  }
}
