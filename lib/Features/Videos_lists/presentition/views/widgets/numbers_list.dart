import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:videos_lists/Features/Videos_lists/controller/videos_cubit/video_cubit.dart';

import '../../../../../Core/utils/constance/styles.dart';
import '../../../../../Core/utils/constance/variables.dart';

class NumberList extends StatelessWidget {
  const NumberList({Key? key, required this.cubit}) : super(key: key);

  final VideoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 55.w,
        height: 20.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => TextButton(
            onPressed: () {
              cubit.changeNumberSelected(index: index);
            },
            child: Text(
              AppVariable.categoriesCount[index],
              style: AppStyles.categoriesStyle,
            ),
          ),
          itemCount: 2,
        ),
      ),
    );
  }
}
