import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:videos_lists/Core/utils/constance/color.dart';
import 'package:videos_lists/Features/Videos_lists/data/data_sourceses/videos_local_data_source.dart';
import 'package:videos_lists/Features/Videos_lists/data/data_sourceses/videos_remote_data_source.dart';
import 'package:videos_lists/Features/Videos_lists/presentation/views/widgets/books_categories.dart';
import 'package:videos_lists/Features/Videos_lists/presentation/views/widgets/books_names.dart';
import 'package:videos_lists/Features/Videos_lists/presentation/views/widgets/custom_gridview.dart';

import '../../data/repository/videos_repository.dart';
import '../../domain/usecase/get_list_topics_usecase.dart';
import '../controller/videos_cubit/video_cubit.dart';

class VideosLists extends StatelessWidget {
  const VideosLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          VideoCubit(GetListTopicsUseCase(VideosRepository(
        baseVideosRemoteDataSource: VideosRemoteDataSource(),
        baseVideosLocalDataSource: VideosLocalDataSource(),
      ))),
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
