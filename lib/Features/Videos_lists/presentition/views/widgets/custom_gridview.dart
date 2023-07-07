import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/constance/variables.dart';
import '../../../../../Core/utils/widgets/build_book_item.dart';
import '../../../controller/videos_cubit/video_cubit.dart';
import 'numbers_list.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key, required this.cubit}) : super(key: key);
  final VideoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              cubit.categorySelected == 0
                  ? AppVariable.phonicsVideosNames.length
                  : cubit.categorySelected == 1
                      ? AppVariable.mathsVideosNames.length
                      : cubit.categorySelected == 2
                          ? AppVariable.programmingVideosLinks.length
                          : cubit.categorySelected == 3
                              ? AppVariable.storiesVideosLinks.length
                              : cubit.categorySelected == 4
                                  ? AppVariable.scienceVideosLinks.length
                                  : AppVariable.phonicsVideosNames.length,
              (index) => buildGridBooks(
                cubit.categorySelected == 0
                    ? AppVariable.phonicsVideosNames[index]
                    : cubit.categorySelected == 1
                        ? AppVariable.mathsVideosNames[index]
                        : cubit.categorySelected == 2
                            ? AppVariable.mathsVideosLinks[index]
                            : cubit.categorySelected == 3
                                ? AppVariable.storiesVideosLinks[index]
                                : cubit.categorySelected == 4
                                    ? AppVariable.scienceVideosLinks[index]
                                    : AppVariable.phonicsVideosNames[index],
                cubit,
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
