import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/constance/styles.dart';
import '../../../../../Core/utils/constance/variables.dart';
import '../../../../../Core/utils/widgets/custom_gradiant.dart';
import '../../controller/videos_cubit/video_cubit.dart';

class NumberList extends StatefulWidget {
  const NumberList({Key? key, required this.cubit}) : super(key: key);

  final VideoCubit cubit;

  @override
  State<NumberList> createState() => _NumberListState();
}

class _NumberListState extends State<NumberList> {
  int _isSelected = -1;
  int num = 0;
  @override
  Widget build(BuildContext context) {
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
                width: 26.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: const Color(0xff321C75).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30.2),
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              Container(
                  width: 24.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: const Color(0xff321C75),
                      gradient: _isSelected == index
                          ? customGradiantSelected()
                          : customGradiantUnSelected(),
                      borderRadius: BorderRadius.circular(30.2),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _isSelected = index;
                        });
                        num = index;
                        widget.cubit.changeNumberSelected(index: index);
                      },
                      child: Text(
                        AppVariable.categoriesCount[index],
                        style: AppStyles.categoriesStyle,
                      ),
                    ),
                  )),
            ],
          ),
          itemCount: widget.cubit.topicsData?[num].itemCount ?? 0,
        ),
      ),
    );
  }
}
