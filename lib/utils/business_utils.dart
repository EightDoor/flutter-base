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
}
