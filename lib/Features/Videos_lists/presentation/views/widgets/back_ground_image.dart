import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Core/utils/Assets/assets_images.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.8,
      child: SvgPicture.asset(
        AssetsImages.backgroundImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
