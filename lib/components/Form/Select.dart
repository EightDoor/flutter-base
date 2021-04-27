import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/components/Form/Time.dart';
import 'package:flutterbbase/components/Tapped.dart';
import 'package:flutterbbase/models/Form/input.dart';
import 'package:flutterbbase/utils/show_picker_utils.dart';

import 'Input.dart';

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

/// 选择
class FormSelectCom extends StatefulWidget {
  final FormCallBackItem onCallBack;
  final FormInputModel data;
  final String type;
  FormSelectCom(
      {required Key key,
      required this.onCallBack,
      required this.data,
      required this.type})
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
  void didUpdateWidget(covariant FormSelectCom oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data.value != null) {
      setState(() {
        selectLabel = widget.data.value ?? "";
      });
    }
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
          switch (widget.type) {
            case "select":
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
              break;
            case "time":
              PDuration defaultValue = PDuration.now();
              DateMode defaultMode =
                  (widget.data.mode != null ? widget.data.mode : DateMode.YMD)!;
              if (widget.data.value != null) {
                final String time = widget.data.value ?? "";
                DateTime? dateTime = DateUtil.getDateTime(time);
                if (dateTime != null) {
                  defaultValue = PDuration.parse(dateTime);
                }
              }
              setState(() {
                selectLabel = formatModel(defaultValue, defaultMode)!;
              });
              showFormTimePicker(
                  context: context,
                  selectDate: defaultValue,
                  mode: defaultMode,
                  callBackChange: (val) {
                    setState(() {
                      selectLabel = val;
                    });
                  },
                  callBackItem: (val) {
                    widget.onCallBack(val);
                  });
              break;
          }
        },
        child: Row(
          children: [
            Text((selectLabel.isNotEmpty
                ? selectLabel
                : widget.data.placeHolder != null
                    ? widget.data.placeHolder
                    : "")!),
            Icon(Icons.expand_more),
          ],
        ),
      ),
    );
  }
}

String? formatModel(PDuration p, DateMode modeS) {
  switch (modeS) {
    case DateMode.YMDHMS:
      selectData[modeS] =
          '${p.year}-${p.month}-${p.day} ${p.hour}:${p.minute}:${p.second}';
      break;
    case DateMode.YMDHM:
      selectData[modeS] = '${p.year}-${p.month}-${p.day} ${p.hour}:${p.minute}';
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
