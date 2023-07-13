import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/constance/variables.dart';
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
              cubit.categorySelected == 0 && cubit.numberSelected == 0
                  ? AppVariable.phonicsVideosNames.length
                  : cubit.categorySelected == 1 && cubit.numberSelected == 0
                      ? AppVariable.mathsVideosNames.length
                      : cubit.categorySelected == 2 && cubit.numberSelected == 0
                          ? AppVariable.programmingVideosLinks.length
                          : cubit.categorySelected == 3 &&
                                  cubit.numberSelected == 0
                              ? AppVariable.storiesVideosLinks.length
                              : cubit.categorySelected == 4 &&
                                      cubit.numberSelected == 0
                                  ? AppVariable.scienceVideosLinks.length
                                  : cubit.categorySelected == 0 &&
                                          cubit.numberSelected == 1
                                      ? AppVariable.phonicsVideosNames.length -
                                          9
                                      : cubit.categorySelected == 1 &&
                                              cubit.numberSelected == 1
                                          ? AppVariable
                                                  .mathsVideosNames.length -
                                              9
                                          : cubit.categorySelected == 2 &&
                                                  cubit.numberSelected == 1
                                              ? AppVariable
                                                      .programmingVideosLinks
                                                      .length -
                                                  9
                                              : cubit.categorySelected == 3 &&
                                                      cubit.numberSelected == 1
                                                  ? AppVariable
                                                          .storiesVideosLinks
                                                          .length -
                                                      9
                                                  : cubit.categorySelected ==
                                                              4 &&
                                                          cubit.numberSelected ==
                                                              1
                                                      ? AppVariable
                                                              .scienceVideosLinks
                                                              .length -
                                                          9
                                                      : AppVariable
                                                          .phonicsVideosNames
                                                          .length,
              (index) => buildGridBooks(
                cubit.categorySelected == 0 && cubit.numberSelected == 0
                    ? AppVariable.phonicsVideosNames[index]
                    : cubit.categorySelected == 1 && cubit.numberSelected == 0
                        ? AppVariable.mathsVideosNames[index]
                        : cubit.categorySelected == 2 &&
                                cubit.numberSelected == 0
                            ? AppVariable.programmingVideosNames[index]
                            : cubit.categorySelected == 3 &&
                                    cubit.numberSelected == 0
                                ? AppVariable.storiesVideosNames[index]
                                : cubit.categorySelected == 4 &&
                                        cubit.numberSelected == 0
                                    ? AppVariable.scienceVideosNames[index]
                                    : cubit.categorySelected == 0 &&
                                            cubit.numberSelected == 1
                                        ? AppVariable
                                            .phonicsVideosNames[index + 9]
                                        : cubit.categorySelected == 1 &&
                                                cubit.numberSelected == 1
                                            ? AppVariable
                                                .mathsVideosNames[index + 9]
                                            : cubit.categorySelected == 2 &&
                                                    cubit.numberSelected == 1
                                                ? AppVariable
                                                        .programmingVideosNames[
                                                    index + 9]
                                                : cubit.categorySelected == 3 &&
                                                        cubit.numberSelected ==
                                                            1
                                                    ? AppVariable
                                                            .storiesVideosNames[
                                                        index + 9]
                                                    : cubit.categorySelected ==
                                                                4 &&
                                                            cubit.numberSelected ==
                                                                1
                                                        ? AppVariable
                                                                .scienceVideosNames[
                                                            index + 9]
                                                        : AppVariable
                                                            .phonicsVideosNames[index + 9],
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
