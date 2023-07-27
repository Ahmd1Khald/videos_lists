import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/assets/assets_images.dart';
import '../../../../../Core/utils/constance/styles.dart';
import '../../controller/videos_cubit/video_cubit.dart';

class BooksCategories extends StatefulWidget {
  const BooksCategories({Key? key, required this.cubit}) : super(key: key);

  final VideoCubit cubit;

  @override
  State<BooksCategories> createState() => _BooksCategoriesState();
}

class _BooksCategoriesState extends State<BooksCategories> {
  int _isSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AssetsImages.libraryImage,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.23),
          Expanded(
            child: SizedBox(
              height: 90.h,
              width: 70.w,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 62.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: const Color(0xff321C75).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12.2),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                    Container(
                      width: 60.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: const Color(0xff321C75),
                          gradient: _isSelected == index
                              ? customGradiantSelected()
                              : customGradiantUnSelected(),
                          borderRadius: BorderRadius.circular(12.2),
                          border: Border.all(color: Colors.black, width: 2)),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _isSelected = index;
                          });
                          int id = index + 1;
                          print(id);
                          widget.cubit.fetchItemsList(id: id);
                        },
                        child: Text(
                          widget.cubit.topicsData?[index].title ?? '',
                          style: AppStyles.categoriesStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.h,
                ),
                itemCount: widget.cubit.topicsData?.length ?? 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

LinearGradient customGradiantUnSelected() => LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      tileMode: TileMode.clamp,
      colors: [
        const Color(0xff321C75),
        const Color(0xffFFBF4C).withOpacity(0.4),
        const Color(0xff321C75),
      ],
    );

LinearGradient customGradiantSelected() => LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      tileMode: TileMode.clamp,
      colors: [
        const Color(0xff8A0AFF),
        const Color(0xffFFBF4C).withOpacity(0.4),
        const Color(0xff8A0AFF),
      ],
    );
