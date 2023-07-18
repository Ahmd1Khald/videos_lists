import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/widgets/build_book_item.dart';
import '../../controller/videos_cubit/video_cubit.dart';
import 'numbers_list.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key, required this.cubit}) : super(key: key);
  final VideoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.w,
          height: 250.h,
          child: GridView.count(
            //padding: const EdgeInsets.all(5),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            children: List.generate(
              cubit.itemsData?.length ?? 0,
              (index) => buildGridBooks(
                cubit.itemsData?[index].title ?? 'no title',
                cubit,
                index,
              ),
            ),
          ),
        ),
        NumberList(
          cubit: cubit,
        ),
      ],
    );
  }
}
