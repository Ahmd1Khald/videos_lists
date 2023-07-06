import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constance/styles.dart';
import '../constance/variables.dart';

Widget numList() => Expanded(
      child: SizedBox(
        width: 130.w,
        height: 30.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => TextButton(
            onPressed: () {},
            child: Text(
              AppVariable.categoriesCount[index],
              style: AppStyles.categoriesStyle,
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(width: 1.w),
          itemCount: AppVariable.categoriesCount.length,
        ),
      ),
    );
