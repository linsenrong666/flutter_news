import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../values/values.dart';

/// 缓存图片
Widget imageCached(
  String url, {
  double width = 48,
  double height = 48,
  EdgeInsetsGeometry? margin,
}) {
  return CachedNetworkImage(
    imageUrl: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fcdn.shejipi.com%2Fwp-content%2Fuploads%2F2021%2F07%2Ffrc-e29fc63898ce27d04469fd25e6ad4fd3.jpeg&refer=http%3A%2F%2Fcdn.shejipi.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1669368237&t=f3b321bf3a439222d2b8acef184df71d',
    imageBuilder: (context, imageProvider) => Container(
      height: duSetHeight(height),
      width: duSetWidth(width),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: Radii.k6pxRadius,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          // colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        ),
      ),
    ),
    placeholder: (context, url) {
      return Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    },
    errorWidget: (context, url, error) {
      return const Center(
        child: Icon(Icons.error),
      );
    },
  );
}
