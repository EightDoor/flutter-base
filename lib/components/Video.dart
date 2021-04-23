import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import 'Loading.dart';

class Video extends StatefulWidget {
  final String url;
  final double? width;
  final double? height;
  Video({Key? key, required this.url, this.width, this.height})
      : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;
  // 播放控制ui显示状态
  bool playUiShow = false;
  bool _videoError = false;
  bool _videoInit = false;
  bool _videoLoading = false;

  @override
  void initState() {
    super.initState();

    /// 加载资源完成时，监听播放进度，并且标记_videoInit=true加载完成
    _controller = VideoPlayerController.network(widget.url)..setLooping(true);
    _controller.addListener(_videoListener);
    _controller.initialize().then((_) {
      // 确保在视频初始化后显示第一帧
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_videoListener);
    _controller.dispose();
  }

  void _videoListener() async {
    if (_controller.value.hasError) {
      setState(() {
        _videoError = true;
      });
    } else if (_controller.value.isInitialized) {
      _videoInit = true;
    } else if (_controller.value.isBuffering) {
      _videoLoading = true;
    } else {
      Duration res = (await _controller.position)!;
      if (res >= _controller.value.duration) {
        await _controller.seekTo(Duration(seconds: 0));
        await _controller.pause();
      }
      // if (_controller.value.isPlaying && _key.currentState != null) {
      //   /// 减少build次数
      //   _key.currentState.setPosition(
      //     position: res,
      //     totalDuration: _controller.value.duration,
      //   );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (playUiShow && _controller.value.isPlaying) {
                setState(() {
                  _controller.pause();
                  playUiShow = false;
                });
              }
            },
            child: Center(
              child: _videoError
                  ? Text("视频加载失败")
                  : _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Loading(title: '视频加载中...'),
            ),
          ),
          Offstage(
            offstage: !_controller.value.isInitialized || playUiShow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // 是否在播放
                      final bool status = _controller.value.isPlaying;
                      if (status) {
                        _controller.pause();
                        setState(() {
                          playUiShow = false;
                        });
                      } else {
                        _controller.play();
                        setState(() {});
                        // 2s之后自动隐藏按钮
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            // 如果是播放状态才隐藏按钮
                            if (_controller.value.isPlaying) {
                              playUiShow = true;
                            }
                          });
                        });
                      }
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause_circle_outline_outlined
                          : Icons.play_circle_outline,
                      color: Colors.white,
                      size: 40.sp,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
