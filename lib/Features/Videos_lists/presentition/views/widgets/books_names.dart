import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../controller/videos_cubit/video_cubit.dart';
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
            String? videoId;
            videoId = YoutubePlayer.convertUrlToId(
                "https://www.youtube.com/watch?v=kDMEx29RlE8");
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
