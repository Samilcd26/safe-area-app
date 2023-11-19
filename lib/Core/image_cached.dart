import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NETWORK_IMAGE {
  static CachedNetworkImage GetImage(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  static CachedNetworkImageProvider GetImageProvier(String url) {
    return CachedNetworkImageProvider(url);
  }
}
