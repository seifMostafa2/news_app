import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_news_app/layout/news_app/app_cubit.dart';
import 'package:full_news_app/layout/news_app/app_states.dart';
import 'package:full_news_app/network/local/shared_helper.dart';
import 'package:full_news_app/network/remote/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/news_app/news_screen.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
 await  CacheHelper.init();

bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(  MyApp(isDark!));


}

class MyApp extends StatelessWidget {

final bool isDark ;

   const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..changeThemeApp(
          fromShared: isDark
        ),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: NewsLayout(),
                  theme: ThemeData(
                      scaffoldBackgroundColor: Colors.white,
                      primarySwatch: Colors.orange,
                      appBarTheme: const AppBarTheme(
                          iconTheme: IconThemeData(color: Colors.black),
                          backgroundColor: Colors.orange,
                          elevation: 0.0,
                          systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: Colors.white,
                          ),
                          titleTextStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      bottomNavigationBarTheme:
                          const BottomNavigationBarThemeData(
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: Colors.orange,
                        unselectedItemColor: Colors.grey,
                        elevation: 20.0,
                        backgroundColor: Colors.white,
                      ),
                      textTheme:  const TextTheme(
                          bodyLarge: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black))),
                  darkTheme: ThemeData(
                      scaffoldBackgroundColor: HexColor('333739'),
                      primarySwatch: Colors.orange,
                      appBarTheme: AppBarTheme(
                        iconTheme: const IconThemeData(color: Colors.white),
                        backgroundColor: HexColor('333739'),
                        elevation: 0.0,
                        systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: HexColor('333739'),
                            statusBarBrightness: Brightness.light),
                        titleTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: Colors.orange,
                        unselectedItemColor: Colors.grey,
                        elevation: 20.0,
                        backgroundColor: HexColor('333739'),
                      ),
                      textTheme:  const TextTheme(
                          bodyLarge: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white))),
                  themeMode: AppCubit.get(context).isDark
                      ? ThemeMode.dark
                      : ThemeMode.light,
              );


              /*AppCubit.get(context).isDark
                      ? ThemeMode.dark
                      : ThemeMode.light);*/
            }));
  }
}
