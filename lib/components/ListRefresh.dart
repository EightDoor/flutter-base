import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/components/Empty.dart';
import 'package:flutterbbase/components/Svg.dart';
import 'package:flutterbbase/components/Tapped.dart';

typedef ScrollType = void Function(int val);

class ListRefresh extends StatefulWidget {
  // controller
  final EasyRefreshController controller;
  // 列表
  final List<Widget> child;
  // 上拉加载更多
  final OnLoadCallback onLoad;
  // 下拉刷新
  final OnRefreshCallback onRefresh;
  // 首次是否加載
  final bool? firstRefresh;
  // 当前的滚动位置
  final ScrollType? scrollOffset;
  // 是否显示右边返回顶部按钮
  final bool isShowTop;
  ListRefresh(
      {required this.controller,
      required this.child,
      required this.onLoad,
      required this.onRefresh,
      this.firstRefresh,
      this.scrollOffset,
      this.isShowTop = false})
      : assert(controller != null);

  @override
  _ListRefreshState createState() => _ListRefreshState();
}

class _ListRefreshState extends State<ListRefresh> {
  late EasyRefreshController _controller;
  ScrollController _scrollController = ScrollController();
  bool isShowTop = true;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _scrollController.addListener(() {
      // print('当前滚动距离: ${_scrollController.offset}');
      if (widget.scrollOffset != null) {
        widget.scrollOffset!(
          _scrollController.offset.round(),
        );
      }

      // 右侧滚动区域监听
      int position = _scrollController.offset.round();
      if (position > 100) {
        if (isShowTop) {
          setState(() {
            isShowTop = false;
          });
        }
      } else if (!isShowTop) {
        setState(() {
          isShowTop = true;
        });
      }
    });
  }

  Animation<Color> valueColorHeaderAndFooter(BuildContext context) {
    return AlwaysStoppedAnimation<Color>(
        Theme.of(context).toggleableActiveColor);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EasyRefresh.custom(
          emptyWidget: widget.child.length == 0 ? Empty() : null,
          controller: _controller,
          firstRefresh: widget.firstRefresh == null ? true : false,
          enableControlFinishRefresh: false,
          enableControlFinishLoad: true,
          taskIndependence: true,
          header: MaterialHeader(
            valueColor: valueColorHeaderAndFooter(context),
          ),
          footer: MaterialFooter(
            valueColor: valueColorHeaderAndFooter(context),
          ),
          // header: ClassicalHeader(
          //   bgColor: Theme.of(context).scaffoldBackgroundColor,
          //   textColor: Colors.black,
          //   infoColor: Theme.of(context).toggleableActiveColor,
          //   refreshText: EasyRefreshText.refreshText,
          //   refreshReadyText: EasyRefreshText.refreshReadyText,
          //   refreshingText: EasyRefreshText.refreshingText,
          //   refreshedText: EasyRefreshText.refreshedText,
          //   infoText: EasyRefreshText.infoText,
          // ),
          scrollController: _scrollController,
          // footer: ClassicalFooter(
          //   enableInfiniteLoad: true,
          //   bgColor: Theme.of(context).scaffoldBackgroundColor,
          //   textColor: Colors.black,
          //   infoColor: Theme.of(context).toggleableActiveColor,
          //   loadedText: EasyRefreshText.loadedText,
          //   loadReadyText: EasyRefreshText.loadReadyText,
          //   loadingText: EasyRefreshText.loadingText,
          //   loadFailedText: EasyRefreshText.loadFailedText,
          //   noMoreText: EasyRefreshText.noMoreText,
          //   infoText: EasyRefreshText.infoText,
          // ),
          // 上拉加载更多
          onLoad: widget.child.length == 0 ? null : widget.onLoad,
          // 下拉刷新
          onRefresh: widget.onRefresh,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ...widget.child,
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30.sp,
          right: 30.sp,
          child: Tapped(
            onTap: () {
              _scrollController.animateTo(
                0,
                duration: Duration(microseconds: 2),
                curve: Curves.ease,
              );
              if (widget.controller != null) {
                widget.controller.callRefresh();
              }
            },
            child: Offstage(
              offstage: widget.isShowTop ? widget.isShowTop : isShowTop,
              child: SvgComponent(
                width: 35.sp,
                height: 35.sp,
                url: "assets/home/returnTop.svg",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
