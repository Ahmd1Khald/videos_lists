import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/constance/variables.dart';
import '../../../../../Core/utils/widgets/build_book_item.dart';
import '../../../../../Core/utils/widgets/numbers_list.dart';
import '../../../controller/videos_cubit/video_cubit.dart';

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
                  ? AppVariable.booksItems0.length
                  : cubit.categorySelected == 1
                      ? AppVariable.booksItems1.length
                      : cubit.categorySelected == 2
                          ? AppVariable.booksItems2.length
                          : AppVariable.booksItems0.length,
              (index) => buildGridBooks(
                cubit.categorySelected == 0
                    ? AppVariable.booksItems0[index]
                    : cubit.categorySelected == 1
                        ? AppVariable.booksItems1[index]
                        : cubit.categorySelected == 2
                            ? AppVariable.booksItems2[index]
                            : AppVariable.booksItems0[index],
                cubit,
              ),
            ),
          ),
        ),
        numList(),
      ],
    );
  }
}
