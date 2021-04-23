import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/components/Tapped.dart';
import 'package:flutterbbase/utils/font.dart';
import 'package:flutterbbase/utils/navigator_util.dart';

// 当前点击的索引
typedef onCallBack = void Function(int index);

/// 顶部tabBar
class TabBarList extends StatefulWidget {
  // 标题
  final Widget title;
  // 右侧功能区域
  final List<Widget>? actions;
  // 左侧区域
  final Widget? leading;
  // 内容区域
  final List<Widget> child;
  // tab列表
  final List<Map<String, String>> tabs;
  // 默认选择的index
  final defaultIndex;
  final onCallBack callBack;
  TabBarList(
      {Key? key,
      required this.title,
      this.actions,
      this.leading,
      required this.child,
      required this.tabs,
      this.defaultIndex,
      required this.callBack})
      : super(key: key);

  @override
  _TabBarListState createState() => _TabBarListState();
}

class _TabBarListState extends State<TabBarList>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  // Tab控制器
  late TabController _tabController;
  List<Tab> myTabs = [];
  var listen;

  // 初始化
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: widget.tabs.length,
        vsync: this,
        initialIndex: widget.defaultIndex ?? 0);
    _tabController
      ..addListener(() {
        if (_tabController.index.toDouble() ==
            _tabController.animation!.value) if (widget.callBack != null) {
          _callBack();
        }
      });
    _callBack();
    setState(() {
      myTabs = widget.tabs
          .map(
            (e) => Tab(
              text: e["title"],
            ),
          )
          .toList();
    });
  }

  void _callBack() {
    if (widget.callBack != null) {
      widget.callBack(_tabController.index);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Tapped(
          onTap: () {
            NavigatorUtil.goBack();
          },
          child: widget.leading ?? Container(),
        ),
        title: widget.title,
        actions: widget.actions,
        shadowColor: Colors.white,
        bottom: TabBar(
          isScrollable: true,
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).toggleableActiveColor,
                  width: 3.sp,
                  style: BorderStyle.solid),
            ),
          ),
          tabs: myTabs,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: Font.font_20,
              fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(
              color: Theme.of(context).colorScheme.primaryVariant,
              fontSize: Font.font_18),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.child,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
