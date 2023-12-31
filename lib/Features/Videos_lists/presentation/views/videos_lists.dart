import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videos_lists/Core/utils/constance/color.dart';
import 'package:videos_lists/Features/Videos_lists/presentation/views/widgets/back_ground_image.dart';
import 'package:videos_lists/Features/Videos_lists/presentation/views/widgets/books_categories.dart';
import 'package:videos_lists/Features/Videos_lists/presentation/views/widgets/books_names.dart';
import 'package:videos_lists/Features/Videos_lists/presentation/views/widgets/custom_gridview.dart';

import '../../../../Core/services/ServiceLocator.dart';
import '../../../../Core/utils/functions/functions.dart';
import '../../data/repository/videos_repository.dart';
import '../../domain/usecase/get_list_items_usecase.dart';
import '../../domain/usecase/get_list_topics_usecase.dart';
import '../controller/videos_cubit/video_cubit.dart';

class VideosListsScreen extends StatelessWidget {
  const VideosListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => VideoCubit(
        GetListTopicsUseCase(getIt.get<VideosRepository>()),
        GetListItemsUseCase(getIt.get<VideosRepository>()),
      )..fetchTopicsList(),
      child: BlocConsumer<VideoCubit, VideoState>(
        listener: (context, state) {
          if (state is VideoSuccessFetchTopicsList) {
            print(state.topics);
          }
          if (state is VideoSuccessFetchItemsList) {
            print(state.items);
            Navigator.pop(context);
          }
          if (state is VideoLoadingFetchItemsList) {
            loadingPage(context: context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.backgroundColor,
            body: Stack(
              alignment: Alignment.centerRight,
              children: [
                const BackGroundImage(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: BooksName(
                        cubit: VideoCubit.get(context),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomGridView(
                        cubit: VideoCubit.get(context),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: BooksCategories(
                        cubit: VideoCubit.get(context),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
