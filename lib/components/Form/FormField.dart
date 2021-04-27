import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/components/Form/Select.dart';
import 'package:flutterbbase/components/Svg.dart';
import 'package:flutterbbase/models/Form/form.dart';
import 'package:flutterbbase/models/Form/input.dart';

import 'Input.dart';

/// 整体布局输入
class FormFieldCom extends StatelessWidget {
  final FormInputModel formInputModel;
  final FormCallBackItem onCallBack;
  final FormSelfModel formSelfModel;
  FormFieldCom(this.formInputModel, this.formSelfModel, this.onCallBack);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          formInputModel.mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      children: [
        formInputModel.prefix != null
            ? SizedBox(
                width: formInputModel.prefixWidth ?? 50.w,
                child: formInputModel.prefix,
              )
            : Container(),
        formInputModel.required != null
            ? SvgComponent(
                url: 'assets/images/required.svg',
                color: Colors.red,
              )
            : Container(),
        Expanded(
          flex: 1,
          child: _generateItem(formSelfModel),
        ),
      ],
    );
  }

  Widget _generateItem(m) {
    /// type = 'input' FormInputModel转换
    Widget item = Text("没有匹配类型, 请输入 input、");
    switch (m.type) {
      case "input":
        item = FormInput(
          Key(formInputModel.name),
          (val) {
            onCallBack(val);
          },
          formInputModel,
        );
        break;
      case "select":
        item = FormSelectCom(
            type: "select",
            key: Key(formInputModel.name),
            onCallBack: (val) {
              onCallBack(val);
            },
            data: formInputModel);
        break;
      case "time":
        item = FormSelectCom(
            type: "time",
            key: Key(formInputModel.name),
            onCallBack: (val) {
              onCallBack(val);
            },
            data: formInputModel);
    }
    return item;
  }
}
