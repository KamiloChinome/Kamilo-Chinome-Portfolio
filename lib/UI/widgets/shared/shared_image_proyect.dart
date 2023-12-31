import 'package:flutter/material.dart';
import 'package:portfolio/UI/widgets/animations/rotation_folower_animation.dart';

class ImageProyect extends StatelessWidget {
  final String asset;
  const ImageProyect({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return RotatorFollower(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * .01),
            border: Border.all(color: Colors.black45, width: width * .005, strokeAlign: BorderSide.strokeAlignCenter)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(width * .01),
          child: Image.asset(
            asset,
            fit: BoxFit.cover,
            width: width * .15,
          ),
        ),
      ),
    );
  }
}