import 'package:flutter/material.dart';

import '../../../../../Core/utils/Assets/assets_images.dart';

class BeeImage extends StatelessWidget {
  const BeeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage(
        AssetsImages.logoImage,
      ),
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height * 0.24,
    );
  }
}
