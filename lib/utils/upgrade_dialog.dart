import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/models/upgrade.dart';
import 'package:flutterbbase/utils/index.dart';

class UpgradeDialog extends StatefulWidget {
  final Upgrade upgrade;
  UpgradeDialog({required this.upgrade});
  @override
  _UpgradeDialogState createState() => _UpgradeDialogState();
}

class _UpgradeDialogState extends State<UpgradeDialog> {
  late Data data;
  @override
  void initState() {
    super.initState();
    setState(() {
      data = widget.upgrade.data;
    });
    Utils.log().i(widget.upgrade.data.toJson(),);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: data.buildFileSize != null
          ? ListView(
              children: [
                ListTile(
                  leading: Text("大小"),
                  title: Text(
                    (int.parse(data.buildFileSize) / 1024 / 1024)
                            .round()
                            .toString() +
                        " M",
                  ),
                ),
                ListTile(
                  leading: Text("版本号"),
                  title: Text(
                    data.buildVersion,
                  ),
                ),
                ListTile(
                  leading: Text("应用更新说明"),
                ),
                Text(data.buildUpdateDescription)
              ],
            )
          : Container(),
    );
  }
}
