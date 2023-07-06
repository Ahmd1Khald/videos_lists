import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:videos_lists/Core/utils/constance/color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosView extends StatelessWidget {
  const VideosView({Key? key, required this.video}) : super(key: key);

  final String video;
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: video,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: SizedBox(
          width: 200.w,
          height: 350.h,
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            width: 400.w,
            progressIndicatorColor: Colors.white,
            onReady: () {
              _controller.addListener(
                () => video,
              );
            },
          ),
        ),
      ),
    );
  }
}
