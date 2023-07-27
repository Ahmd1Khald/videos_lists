import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:videos_lists/Core/utils/assets/assets_images.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../controller/videos_cubit/video_cubit.dart';
import '../videos_view.dart';

class BooksName extends StatelessWidget {
  const BooksName({Key? key, required this.cubit}) : super(key: key);

  final VideoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 43.0),
      child: Column(
        children: [
          Image(
            image: const AssetImage(
              AssetsImages.logoImage,
            ),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.24,
          ),
          SizedBox(
            height: 8.h,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.51,
                child: SvgPicture.asset(
                  AssetsImages.borderImage,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 0.h,
                child: InkWell(
                  onTap: () {
                    print(cubit.videoSelected);
                    String link =
                        cubit.itemsData![cubit.videoSelected].videoUrl;
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
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 30.h,
                      width: 26.w,
                      decoration: BoxDecoration(
                        color: const Color(0xff321C75),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Open',
                          style: TextStyle(color: Color(0xffFDA429)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
