import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:videos_lists/Core/utils/constance/color.dart';
import 'package:videos_lists/Features/Videos_lists/controller/videos_cubit/video_cubit.dart';
import 'package:videos_lists/Features/Videos_lists/presentition/views/widgets/books_categories.dart';
import 'package:videos_lists/Features/Videos_lists/presentition/views/widgets/books_names.dart';
import 'package:videos_lists/Features/Videos_lists/presentition/views/widgets/custom_gridview.dart';

class VideosLists extends StatefulWidget {
  const VideosLists({Key? key}) : super(key: key);

  @override
  State<VideosLists> createState() => _VideosListsState();
}

class _VideosListsState extends State<VideosLists> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => VideoCubit(),
      child: BlocConsumer<VideoCubit, VideoState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.backgroundColor,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BooksName(
                  cubit: VideoCubit.get(context),
                ),
                SizedBox(
                  width: 25.w,
                ),
                CustomGridView(
                  cubit: VideoCubit.get(context),
                ),
                SizedBox(
                  width: 25.w,
                ),
                BooksCategories(
                  cubit: VideoCubit.get(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
