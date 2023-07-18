import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/constance/styles.dart';
import '../../controller/videos_cubit/video_cubit.dart';

class BooksCategories extends StatelessWidget {
  const BooksCategories({Key? key, required this.cubit}) : super(key: key);

  final VideoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Text(
            'library'.toUpperCase(),
            style: AppStyles.titleStyle,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 90.h,
            width: 60.w,
            child: ListView.builder(
              itemBuilder: (context, index) => TextButton(
                onPressed: () {
                  int id = index + 1;
                  print(id);
                  cubit.fetchItemsList(id: id);
                },
                child: Text(
                  cubit.topicsData?[index].title ?? '',
                  style: AppStyles.categoriesStyle,
                ),
              ),
              itemCount: cubit.topicsData?.length ?? 0,
            ),
          ),
        ),
      ],
    );
  }
}
