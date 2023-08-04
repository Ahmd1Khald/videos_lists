import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:videos_lists/Core/helpers/dio_helper.dart';
import 'package:videos_lists/Core/utils/constance/variables.dart';
import 'package:videos_lists/Features/Videos_lists/domain/entites/items/items_entity.dart';

import 'Core/services/BlocObserver.dart';
import 'Core/services/ServiceLocator.dart';
import 'Features/Videos_lists/domain/entites/topics/topics_entity.dart';
import 'Features/Videos_lists/domain/entites/topics/topics_entity.g.dart';
import 'Features/Videos_lists/presentation/views/videos_lists.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TopicsEntityAdapter());
  Hive.registerAdapter(ItemsEntityAdapter());
  await Hive.openBox<TopicsEntity>(kTopicsBox);
  //await Hive.openBox<ItemsEntity>(kItemsBox);
  setUpServiceLocator();
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
          home: const VideosListsScreen(),
        );
      },
    );
  }
}
