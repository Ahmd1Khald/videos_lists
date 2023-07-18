import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/constance/styles.dart';
import '../../../../../Core/utils/constance/variables.dart';
import '../../controller/videos_cubit/video_cubit.dart';

class NumberList extends StatelessWidget {
  const NumberList({Key? key, required this.cubit}) : super(key: key);

  final VideoCubit cubit;

  @override
  Widget build(BuildContext context) {
    int num = 0;
    return Expanded(
      child: SizedBox(
        width: 55.w,
        height: 20.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => TextButton(
            onPressed: () {
              num = index;
              cubit.changeNumberSelected(index: index);
            },
            child: Text(
              AppVariable.categoriesCount[index],
              style: AppStyles.categoriesStyle,
            ),
          ),
          itemCount: cubit.topicsData?[num].itemCount ?? 0,
        ),
      ),
    );
  }
}
