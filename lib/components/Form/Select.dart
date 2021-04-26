import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/components/Tapped.dart';
import 'package:flutterbbase/models/Form/input.dart';
import 'package:flutterbbase/utils/show_picker_utils.dart';

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
          ShowPickerUtils.showSingPicker(
            context: context,
            sourceList: widget.data.list ?? [],
            selectLabel: selectLabel,
            callChange: (val) {
              setState(() {
                selectLabel = val;
              });
            },
            callResult: (val) {
              widget.onCallBack(val);
            },
          );
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
}
