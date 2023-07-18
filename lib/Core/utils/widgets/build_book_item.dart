import 'package:flutter/material.dart';

import '../../../Features/Videos_lists/presentation/controller/videos_cubit/video_cubit.dart';

Widget buildGridBooks(String name, VideoCubit cubit, int index) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Image.asset('assets/images/books.png'),
        onTap: () {
          cubit.changeBookName(name: name);
          cubit.changeVideoSelected(index: index);
          print(name);
        },
      ),
    );
