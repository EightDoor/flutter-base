import 'package:flutter/material.dart';
import 'package:flutterbbase/pages/home/home.dart';
import 'package:flutterbbase/pages/my/my.dart';
import 'package:flutterbbase/utils/index.dart';

/// 导航
class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // 当前选择的页面
  int _currentIndex = 0;
  late PageController _pageController;
  List<Map<String, dynamic>> _item = [
    {
      "title": "首页",
      "icon": Icon(Icons.add),
    },
    {
      "title": "我的",
      "icon": Icon(Icons.add),
    },
  ];
  List<BottomNavigationBarItem> _list = [];
  List<Widget> _pages = [
    Home(),
    My(),
  ];
  @override
  void initState() {
    super.initState();
    // app升级初始化
    // UpgradeUtil.upgrade(context: context);
    this._pageController = PageController(initialPage: this._currentIndex);
    this._list = _item
        .map(
          (e) => BottomNavigationBarItem(
            icon: e["icon"],
            title: Text(
              e['title'],
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: this._pageController,
        onPageChanged: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        currentIndex: this._currentIndex,
        onTap: (int index) {
          Utils.log().i(index);
          setState(() {
            this._currentIndex = index;
            this._pageController.jumpToPage(this._currentIndex);
          });
        },
        items: _list,
      ),
    );
  }
}
