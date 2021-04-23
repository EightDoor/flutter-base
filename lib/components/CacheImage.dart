import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 图片缓存统一封装
class CacheImage extends StatelessWidget {
  final String url;
  CacheImage({required this.url});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url != null ? url : "",
      fit: BoxFit.cover,
      // CircularProgressIndicator()
      placeholder: (context, url) => Container(
        width: double.infinity,
        color: Colors.white,
        child: Image.asset(
          "assets/images/village_space.png",
          fit: BoxFit.cover,
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
