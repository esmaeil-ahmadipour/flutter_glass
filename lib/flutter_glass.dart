import 'dart:ui';
import 'package:flutter/material.dart';
/// [GlassContainer] this class is main widget of this package and handle and manage all ui elements.
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    Key? key,
    required this.width,
    this.height,
    required this.children,
    this.borderWidth = 1.5,
    this.mainColor = Colors.white,
    this.shadowColor = Colors.black,
    this.innerPadding = const EdgeInsets.all(16.0),
    this.outerPadding = const EdgeInsets.all(8.0),
    this.blurRadius = 16.0,
    this.spreadRadius = 16.0,
    this.sigmaX = 10.0,
    this.sigmaY = 10.0,
    this.decorationImage,
    this.shadowOpacity = 0.1,
    this.mainColorOpacity = 0.2,
    this.borderRadius = const GlassBorderSide(bottomSide: 16.0, topSide: 16.0),
  }) : super(key: key);

  /// [width] , this property is REQUIRED & used for width of glass container .
  final double width;

  /// [height] , this property used for height of glass container .
  final double? height;

  /// [borderRadius] , this property used for rounded corners in glass container .
  final GlassBorderSide borderRadius;

  /// [borderWidth] , this property set size for border around of glass container .
  final double borderWidth;

  /// [mainColor] , this property used for background color of glass container & border of this widget  (this color used in widget , by opacity 0.2) .
  final Color mainColor;

  /// [shadowColor] , this property set color of shadow in boxShadow (this color used in widget , by opacity 0.1) .
  final Color shadowColor;

  /// [innerPadding] , this property set padding to inside of  glass container .
  final EdgeInsetsGeometry innerPadding;

  /// [outerPadding] , this property set padding to outside of  glass container .
  final EdgeInsetsGeometry outerPadding;

  /// [children] , this property is REQUIRED & hold content in glass container .
  final List<Widget> children;

  /// [blurRadius] , this property used for rounded corners in boxShadow .
  final double blurRadius;

  /// [spreadRadius] , this property used for shadow impact width in boxShadow .
  final double spreadRadius;

  /// [decorationImage] , this property set background image for glass container .
  final DecorationImage? decorationImage;

  /// [sigmaX] : Users can set amount of blurring in X directions for increasing the blurring of the background .
  final double sigmaX;

  /// [sigmaY]  : Users can set amount of blurring in Y directions for increasing the blurring of the background .
  final double sigmaY;

  /// [shadowOpacity]  : this property used when users need set shadow Opacity  for outer of glass container.
  final double shadowOpacity;

  /// [mainColorOpacity]  : this property used when users need set Opacity on mainColor of glass container.
  final double mainColorOpacity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              color: shadowColor.withOpacity(shadowOpacity),
            )
          ],
          image: decorationImage,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius.bottomSide),
            bottomRight: Radius.circular(borderRadius.bottomSide),
            topLeft: Radius.circular(borderRadius.topSide),
            topRight: Radius.circular(borderRadius.topSide),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius.bottomSide),
            bottomRight: Radius.circular(borderRadius.bottomSide),
            topLeft: Radius.circular(borderRadius.topSide),
            topRight: Radius.circular(borderRadius.topSide),
          ),
          child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigmaX,
                sigmaY: sigmaY,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                          color: mainColor.withOpacity(mainColorOpacity),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(borderRadius.bottomSide),
                            bottomRight: Radius.circular(borderRadius.bottomSide),
                            topLeft: Radius.circular(borderRadius.topSide),
                            topRight: Radius.circular(borderRadius.topSide),
                          ),
                          border: Border.all(
                            width: borderWidth,
                            color: mainColor.withOpacity(mainColorOpacity),
                          ),
                        ),
                        child: Padding(
                          padding: innerPadding,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: children),
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
/// [GradiantContainer] this class used  for gradiant background of glass container.
class GradiantContainer extends StatelessWidget {
  const GradiantContainer({
    Key? key,
    required this.child,
    this.colors = const [
      Colors.deepPurple,
      Colors.pink,
      Colors.red,
      Colors.orange,
    ],
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  })  : assert(
            !(colors.length == 0),

            /// use colors parameter in optional but send empty color list is forbidden .
            "error on colors parameter, this parameter isEmpty."
            "use colors parameter in optional but send empty color list is forbidden ."),
        super(key: key);

  /// [child] , this property is REQUIRED & used for foreground widget on the gradiant widget .
  final Widget child;

  /// [begin] , this property used for start gradiant location .
  final AlignmentGeometry begin;

  /// [end] , this property used for end gradiant location .
  final AlignmentGeometry end;

  /// [colors] , this property list of colors used in gradiant .
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    /// [stops] contain height of colors used in gradiant widget and
    /// we set equal height size for all used colors .
    List<double> stops = [];
    for (var i = 0; i < colors.length; ++i) {
      stops.add((1.0 / (colors.length + 1)) * (i + 1));
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: begin,
          end: end,
          stops: stops,
        ),
      ),
      child: child,
    );
  }
}

/// [GlassBorderSide] this class used for rounded border of image and glass container.
class GlassBorderSide {
  /// [topSide]  , used for rounded border of top side of image and glass container
  final double topSide;
  /// [bottomSide]  , used for rounded border of top side of image and glass container
  final double bottomSide;

  const GlassBorderSide({this.topSide = 16.0, this.bottomSide = 16.0});
}