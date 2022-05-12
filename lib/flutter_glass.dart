import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    Key? key,
    required this.cardWidth,
    required this.cardHeight,
    required this.children,
    this.borderRadius = 16.0,
    this.borderWidth = 1.5,
    this.mainColor = Colors.white,
    this.shadowColor = Colors.black,
    this.innerPadding = const EdgeInsets.all(16.0),
    this.outerPadding = const EdgeInsets.all(8.0),
    this.blurRadius = 16.0,
    this.spreadRadius = 16.0,
    this.sigmaX = 20.0,
    this.sigmaY = 20.0,
  }) : super(key: key);
  final double cardWidth;
  final double cardHeight;
  final double borderRadius;
  final double borderWidth;
  final Color mainColor;
  final Color shadowColor;
  final EdgeInsetsGeometry innerPadding;
  final EdgeInsetsGeometry outerPadding;
  final List<Widget> children;
  final double blurRadius;
  final double spreadRadius;
  final double sigmaX;
  final double sigmaY;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            color: shadowColor.withOpacity(0.1),
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: sigmaX,
              sigmaY: sigmaY,
            ),
            child: Container(
                width: cardWidth,
                height: cardHeight,
                decoration: BoxDecoration(
                    color: mainColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(borderRadius),
                    border: Border.all(
                      width: borderWidth,
                      color: mainColor.withOpacity(0.2),
                    )),
                child: Padding(
                  padding: innerPadding,
                  child: Column(
                    children: children,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
