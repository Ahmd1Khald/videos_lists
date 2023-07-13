import 'package:flutter/material.dart';

import '../../../Features/Videos_lists/presentition/controller/videos_cubit/video_cubit.dart';

Widget buildGridBooks(String item, VideoCubit cubit) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          color: Colors.amberAccent,
        ),
        onTap: () {
          cubit.changeBookName(name: item);
          print(cubit.bookName);
        },
      ),
    );
