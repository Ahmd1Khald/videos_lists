import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:videos_lists/Core/utils/assets/assets_images.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../controller/videos_cubit/video_cubit.dart';
import '../videos_view.dart';
import 'bee_image.dart';

class BooksName extends StatelessWidget {
  const BooksName({Key? key, required this.cubit}) : super(key: key);

  final VideoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 43.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BeeImage(),
          SizedBox(
            height: 8.h,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.51,
                    AssetsImages.borderImage,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        cubit.bookName,
                        maxLines: 2,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
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
                      ),
                    ),
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
            ],
          ),
        ],
      ),
    );
  }
}
