import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:videos_lists/Core/utils/constance/color.dart';
import 'package:videos_lists/Features/Videos_lists/presentation/views/widgets/back_ground_image.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosView extends StatelessWidget {
  const VideosView({Key? key, required this.video}) : super(key: key);

  final String video;
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: video,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: true,
        //captionLanguage: 'en',
        disableDragSeek: true,
        mute: false,
      ),
    );
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        alignment: Alignment.centerRight,
        children: [
          const BackGroundImage(),
          Center(
            child: SizedBox(
              width: 220.w,
              height: 350.h,
              child: YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                width: 400.w,
                progressIndicatorColor: Colors.white,
                onReady: () {
                  // _controller.addListener(
                  //   () => video,
                  // );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
