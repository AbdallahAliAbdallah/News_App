import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/remote/bloc_observe.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/styles/theme/theme.dart';

import 'cubit/news_app_theme_cubit.dart';
import 'modules/layout/news_app.dart';
import 'modules/layout/news_app_layout_cubit.dart';
import 'network/remote/cache_helper.dart';
import 'network/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  print(isDark);
  DioHelper.init();
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  bool? isDark;

  MyApp({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppLayoutCubit()
        ..changeTheme(fromShared: isDark)
        ..getBusiness(),
      child: BlocBuilder<NewsAppLayoutCubit, NewsAppLayoutState>(
          builder: (BuildContext context, state) {
        return MaterialApp(
          theme: lighttheme,
          darkTheme: darktheme,
          themeMode: NewsAppLayoutCubit.get(context).isdark
              ? ThemeMode.light
              : ThemeMode.dark,

          locale: Locale('ar'),
          debugShowCheckedModeBanner: false,
          home: NewsApp(),
        );
      }),
    );
  }
}
/*
NewsAppLayoutCubit.get(context).isdark
              ? ThemeMode.light
              : ThemeMode.dark,
 bool isdark = false;

  void changeTheme({bool? fromShared}) {
    if (fromShared != null) {
      isdark = fromShared;
      emit(ChangeTheme());
    } else {
      isdark = !isdark;

      CacheHelper.saveData(key: 'isDark', value: isdark).then((value) {
       emit(ChangeTheme());
      });
    }
  }
 */