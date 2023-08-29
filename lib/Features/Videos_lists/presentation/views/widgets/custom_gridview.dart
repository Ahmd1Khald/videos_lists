import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:videos_lists/Core/utils/Assets/assets_images.dart';

import '../../../../../Core/utils/widgets/build_book_item.dart';
import '../../controller/videos_cubit/video_cubit.dart';
import 'numbers_list.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key, required this.cubit}) : super(key: key);
  final VideoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AssetsImages.libraryImage,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.7,
              child: GridView.count(
                //padding: const EdgeInsets.all(5),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 2,
                children: List.generate(
                  cubit.itemsData?.length ?? 0,
                  (index) => buildGridBooks(
                      cubit.itemsData?[index].title ?? 'no title',
                      cubit,
                      index),
                ),
              ),
            ),
            NumberList(
              cubit: cubit,
            ),
          ],
        ),
      ],
    );
  }
}
