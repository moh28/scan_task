/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Ellipse 48.png
  AssetGenImage get ellipse48 =>
      const AssetGenImage('assets/images/Ellipse 48.png');

  /// File path: assets/images/blur_linear_24px.png
  AssetGenImage get blurLinear24px =>
      const AssetGenImage('assets/images/blur_linear_24px.png');

  /// File path: assets/images/collections_24px.png
  AssetGenImage get collections24px =>
      const AssetGenImage('assets/images/collections_24px.png');

  /// File path: assets/images/flash_on_24px.png
  AssetGenImage get flashOn24px =>
      const AssetGenImage('assets/images/flash_on_24px.png');

  /// File path: assets/images/head1.png
  AssetGenImage get head1 => const AssetGenImage('assets/images/head1.png');

  /// File path: assets/images/head2.png
  AssetGenImage get head2 => const AssetGenImage('assets/images/head2.png');

  /// File path: assets/images/top_icon.png
  AssetGenImage get topIcon =>
      const AssetGenImage('assets/images/top_icon.png');

  /// File path: assets/images/top_icon_2.png
  AssetGenImage get topIcon2 =>
      const AssetGenImage('assets/images/top_icon_2.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        ellipse48,
        blurLinear24px,
        collections24px,
        flashOn24px,
        head1,
        head2,
        topIcon,
        topIcon2
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
