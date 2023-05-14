import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_cumt_news_app/provider/newsmark_provider.dart';
import 'package:my_cumt_news_app/provider/notification_provider.dart';
import 'package:my_cumt_news_app/provider/theme_provider.dart';
import 'package:my_cumt_news_app/screens/onboding/onboding_screen.dart';
import 'package:my_cumt_news_app/utils/login_util/prefs.dart';
import 'package:provider/provider.dart';



void main() async {
  //使用平台通道，显式调用一下 WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  // 获取初始化数据
  await GetStorage.init();
  await Prefs.init();
  runApp( const MyApp());
}


final box = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // changeNotifierProvider用于管理状态和监听对象的变化，变化就会通知下级widget更新
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => newsmarkProvider())
      ],
      child: Consumer(
          builder: (BuildContext context, value, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'rive_page',
              theme: ThemeData(
                scaffoldBackgroundColor: const Color(0xFFEEF1F8),
                primarySwatch: Colors.blue,
                fontFamily: "Intel",
                //输入框主题
                inputDecorationTheme: const InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: TextStyle(height: 0),
                  border: defaultInputBorder,
                  enabledBorder: defaultInputBorder,
                  focusedBorder: defaultInputBorder,
                  errorBorder: defaultInputBorder,
                ),
              ),
              home: const OnbodingScreen(),
            );
          }
      ),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
