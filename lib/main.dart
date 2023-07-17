import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:videos_lists/Core/helpers/dio_helper.dart';
import 'package:videos_lists/Core/utils/constance/variables.dart';
import 'package:videos_lists/test.dart';

import 'Features/Videos_lists/domain/entites/topics_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TopicsEntityAdapter());
  await Hive.openBox(AppVariable.kTopicsBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Videos Lists',
          theme: ThemeData(
            primaryColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Test(),
        );
      },
    );
  }
}
