import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/constance/styles.dart';
import '../../../../../Core/utils/constance/variables.dart';
import '../../../../../Core/utils/widgets/custom_gradiant.dart';
import '../../controller/videos_cubit/video_cubit.dart';

class NumberList extends StatelessWidget {
  const NumberList({Key? key, required this.cubit}) : super(key: key);

  final VideoCubit cubit;

  @override
  Widget build(BuildContext context) {
    int _isSelected = -1;
    int num = 0;
    return Expanded(
      child: SizedBox(
        width: 55.w,
        height: 20.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 19.w,
                height: 37.h,
                decoration: BoxDecoration(
                  color: const Color(0xff321C75).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.2),
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              Container(
                  width: 18.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                      color: const Color(0xff321C75),
                      gradient: _isSelected == index
                          ? customGradiantSelected()
                          : customGradiantUnSelected(),
                      borderRadius: BorderRadius.circular(12.2),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: TextButton(
                    onPressed: () {
                      _isSelected = index;
                      num = index;
                      cubit.changeNumberSelected(index: index);
                    },
                    child: Text(
                      AppVariable.categoriesCount[index],
                      style: AppStyles.categoriesStyle,
                    ),
                  )),
            ],
          ),
          itemCount: cubit.topicsData?[num].itemCount ?? 0,
        ),
      ),
    );
  }
}
