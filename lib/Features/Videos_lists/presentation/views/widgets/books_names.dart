import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../controller/videos_cubit/video_cubit.dart';
import '../videos_view.dart';

class BooksName extends StatelessWidget {
  const BooksName({Key? key, required this.cubit}) : super(key: key);

  final VideoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 90.w,
      height: 70.h,
      child: Center(
        child: TextButton(
          child: Text(cubit.bookName),
          onPressed: () {
            print(cubit.videoSelected);
            String link = cubit.itemsData![cubit.videoSelected].videoUrl;
            String? videoId;
            videoId = YoutubePlayer.convertUrlToId(link);
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
