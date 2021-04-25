import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/components/Tapped.dart';
import 'package:flutterbbase/models/Form/input.dart';
import 'package:flutterbbase/utils/index.dart';
import 'package:flutterbbase/utils/show_bottom_sheet.dart';
import 'package:get/get.dart';

import 'Input.dart';

/// 选择
class FormSelectCom extends StatefulWidget {
  final FormCallBackItem onCallBack;
  final FormInputModel data;
  FormSelectCom(
      {required Key key, required this.onCallBack, required this.data})
      : super(key: key);
  @override
  _FormSelectComState createState() => _FormSelectComState();
}

class _FormSelectComState extends State<FormSelectCom> {
  String selectLabel = '';
  @override
  void initState() {
    super.initState();
    // widget.onCallBack("test");
    selectLabel = widget.data.placeHolder ?? "请选择";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom:
      //         BorderSide(color: Theme.of(context).dividerColor, width: 1.sp),
      //   ),
      // ),
      padding: EdgeInsets.only(bottom: 15.sp),
      margin: EdgeInsets.only(top: 15.sp),
      child: Tapped(
        onTap: () {
          showBottomSheetUtil(context,
              child: _generateList(), title: widget.data.title);
        },
        child: Row(
          children: [
            Text(selectLabel),
            Icon(Icons.expand_more),
          ],
        ),
      ),
    );
  }

  List<Widget> _generateList() {
    var list = widget.data.list ?? [];
    return list.map((e) => _item(e["label"], e["value"])).toList();
  }

  Widget _item(
    String label,
    String value,
  ) {
    return ListTile(
      onTap: () {
        formatValue(value);
        widget.onCallBack(value);
        Get.back();
      },
      title: Text(label),
    );
  }

  void formatValue(String value) {
    final list = widget.data.list ?? [];
    var result = list.firstWhere((e) => e["value"] == value);
    if (result.isNotEmpty) {
      Utils.log().i('当前选择的: select -> ' + result.toString());
      setState(() {
        selectLabel = result['label'];
      });
    }
  }
}
