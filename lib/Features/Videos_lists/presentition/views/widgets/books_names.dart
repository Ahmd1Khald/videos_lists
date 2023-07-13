import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../Core/utils/constance/variables.dart';
import '../../../../../Core/utils/functions/functions.dart';
import '../../controller/videos_cubit/video_cubit.dart';
import '../videos_view.dart';

class BooksName extends StatelessWidget {
  const BooksName({Key? key, required this.cubit}) : super(key: key);

  final VideoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 70.w,
      height: 40.h,
      child: Center(
        child: TextButton(
          child: Text(cubit.bookName),
          onPressed: () {
            int index;
            print(cubit.categorySelected);
            index = AppFunctions.getVideoLink(
              bookName: cubit.bookName,
              selectedCat: cubit.categorySelected,
            );
            print('video index => $index');
            String? videoId;
            if (cubit.categorySelected == 0) {
              videoId = YoutubePlayer.convertUrlToId(
                  AppVariable.phonicsVideosLinks[index]);
            }
            if (cubit.categorySelected == 1) {
              videoId = YoutubePlayer.convertUrlToId(
                  AppVariable.mathsVideosLinks[index]);
            }
            if (cubit.categorySelected == 2) {
              videoId = YoutubePlayer.convertUrlToId(
                  AppVariable.programmingVideosLinks[index]);
            }
            if (cubit.categorySelected == 3) {
              videoId = YoutubePlayer.convertUrlToId(
                  AppVariable.storiesVideosLinks[index]);
            }
            if (cubit.categorySelected == 4) {
              videoId = YoutubePlayer.convertUrlToId(
                  AppVariable.scienceVideosLinks[index]);
            }
            print(videoId);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VideosView(
                        video: videoId!,
                      )),
            );
          },
        ),
      ),
    );
  }
}
