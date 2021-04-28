import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/models/Form/input.dart';

import 'Input.dart';

/// 单选

class FormRadio extends StatefulWidget {
  final FormInputModel formInputModel;
  final FormCallBackItem onCallBack;
  FormRadio(
    Key key,
    this.onCallBack,
    this.formInputModel,
  ) : super(key: key);
  @override
  _FormRadioState createState() => _FormRadioState();
}

class _FormRadioState extends State<FormRadio> {
  String _value = '';
  List<Map<String, dynamic>> list = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      list = widget.formInputModel.list!;
    });
  }

  @override
  void didUpdateWidget(covariant FormRadio oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 存在更新值， 直接更新
    if (widget.formInputModel.value != null) {}
    if (widget.formInputModel.list != null) {
      setState(() {
        list = widget.formInputModel.list!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.sp,
      height: 50.sp,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _generateItem(),
      ),
    );
  }

  List<Widget> _generateItem() {
    return list
        .map(
          (e) => Container(
            width: e["width"] ?? 100.sp,
            child: RadioListTile<String>(
              contentPadding: EdgeInsets.all(0),
              title: Text(e["label"] ?? ""),
              value: e["value"],
              groupValue: _value,
              onChanged: (v) {
                setState(() {
                  _value = v!;
                });
              },
            ),
          ),
        )
        .toList();
  }
}
