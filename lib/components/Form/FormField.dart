import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/components/Svg.dart';
import 'package:flutterbbase/models/Form/input.dart';

import 'Input.dart';

/// 整体布局输入
class FormFieldCom extends StatelessWidget {
  final FormInputModel formInputModel;
  final FormCallBackItem onCallBack;
  FormFieldCom(this.formInputModel, this.onCallBack);
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
          child: FormInput(
            Key(formInputModel.name),
            (val) {
              onCallBack(val);
            },
            formInputModel,
          ),
        ),
      ],
    );
  }
}
