import 'package:flutter/material.dart';
import 'package:flutterbbase/components/Form/Form.dart';
import 'package:flutterbbase/components/TextCom.dart';
import 'package:flutterbbase/utils/index.dart';

/// 表单统一使用form
class DemoForm extends StatefulWidget {
  @override
  _DemoFormState createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  List<Map<String, dynamic>> list = [
    {
      "type": "input",
      "properties": {
        "placeHolder": "默认值",
        "prefix": TextCom("测试"),
        "name": "title",
        "required": "0",
        "requiredMsg": "哈哈哈",
      }
    },
    {
      "type": "input",
      "properties": {
        "placeHolder": "666",
        "prefix": Icon(Icons.ac_unit),
        "name": "title",
      }
    },
    {
      "type": "select",
      "properties": {
        "placeHolder": "请选择",
        "prefix": Icon(Icons.ac_unit),
        "name": "xuanze",
        "list": [
          {
            "value": "2",
            "label": "测试",
          },
          {
            "value": "1",
            "label": "测试1",
          },
        ]
      }
    },
  ];

  @override
  void initState() {
    super.initState();

    // 填充默认值
    Future.delayed(Duration(seconds: 2), () {
      final List<Map<String, dynamic>> r = list;
      final int index = r.indexWhere((e) => e['properties']["name"] == 'title');
      if (index != -1) {
        r[index]["properties"]['value'] = 'test 自动填充的数据';
        setState(() {
          list = r;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表单demo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormCom(
              list,
              onCallBack: (val) {
                Utils.log().i('form值 ${val.toList()}');
              },
              submit: Text("保存"),
            ),
            RaisedButton(
              onPressed: () {
                setState(
                  () {
                    list.add(
                      {
                        "type": "input",
                        "properties": {
                          "placeHolder": "1111",
                          "prefix": Text("55555"),
                          "name": "666"
                        }
                      },
                    );
                  },
                );
              },
              child: Text("点击增加"),
            ),
            RaisedButton(
              onPressed: () {
                formKey.currentState!.reset();
              },
              child: Text("清空表单"),
            ),
          ],
        ),
      ),
    );
  }
}
