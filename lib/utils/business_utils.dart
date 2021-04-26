/// 业务utils
class BusinessUtils {
  // 表单根据name替换对应的value值
  static List<Map<String, dynamic>> replaceFormValue(
      List<Map<String, dynamic>> list, String name, String value) {
    final List<Map<String, dynamic>> r = list;
    final int index = r.indexWhere((e) => e['properties']["name"] == name);
    if (index != -1) {
      r[index]["properties"]['value'] = value;
    }
    return r;
  }
}
