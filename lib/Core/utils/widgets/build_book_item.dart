import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:videos_lists/Core/utils/Assets/assets_images.dart';

import '../../../Features/Videos_lists/presentation/controller/videos_cubit/video_cubit.dart';

Widget buildGridBooks(String name, VideoCubit cubit, int index) => Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 5),
      child: InkWell(
        child: SizedBox(
          height: 18.h,
          width: 10.w,
          child: Image.asset(
            index == 0
                ? AssetsImages.bookImage1
                : index == 1
                    ? AssetsImages.bookImage2
                    : index == 2
                        ? AssetsImages.bookImage3
                        : index == 3
                            ? AssetsImages.bookImage4
                            : index == 4
                                ? AssetsImages.bookImage5
                                : index == 5
                                    ? AssetsImages.bookImage6
                                    : AssetsImages.bookImage7,
            fit: BoxFit.fitHeight,
          ),
        ),
        onTap: () {
          cubit.changeBookName(name: name);
          cubit.changeVideoSelected(index: index);
          print(name);
        },
      ),
    );
