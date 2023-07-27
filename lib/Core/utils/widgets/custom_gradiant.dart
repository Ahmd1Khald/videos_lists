import 'package:flutter/cupertino.dart';

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
