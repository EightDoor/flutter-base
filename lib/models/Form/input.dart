import 'package:flutter/cupertino.dart';

class FormInputModel {
  // 标识name
  final String name;
  // 占位符
  final String? placeHolder;
  // 前缀
  final Widget? prefix;
  // 宽度
  final double? prefixWidth;
  // 样式排版
  final MainAxisAlignment? mainAxisAlignment;
  // 正则表达式 验证
  final String? required;
  // 验证失败消息提示
  final String? requiredMsg;
  // 值 添加为默认值
  final String? value;

  FormInputModel(
    this.placeHolder,
    this.prefix,
    this.mainAxisAlignment,
    this.prefixWidth,
    this.name,
    this.required,
    this.requiredMsg,
    this.value,
  );
  FormInputModel.formJson(Map<String, dynamic> json)
      : placeHolder = json['placeHolder'],
        prefix = json["prefix"],
        mainAxisAlignment = json["mainAxisAlignment"],
        prefixWidth = json['prefixWidth'],
        name = json["name"],
        required = json["required"],
        requiredMsg = json["requiredMsg"],
        value = json["value"];

  Map<String, dynamic> toJson() => {
        'placeHolder': placeHolder,
        'prefix': prefix,
        "mainAxisAlignment": mainAxisAlignment,
        "prefixWidth": prefixWidth,
        "name": name,
        "required": required,
        "requiredMsg": requiredMsg,
        "value": value,
      };
}
