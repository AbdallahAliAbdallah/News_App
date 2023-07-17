import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../network/remote/cache_helper.dart';
import '../shared/components/components.dart';

part 'news_app_theme_state.dart';

class NewsAppThemeCubit extends Cubit<NewsAppThemeState> {
  NewsAppThemeCubit() : super(NewsAppThemeInitial());
  changeAppTheme(ThemeApp theme){
    switch(theme){
      case ThemeApp.Intial:
        if(CacheHelper.getData(key:'theme') != null){
          if(CacheHelper.getData(key:'theme') == 'Ligth'){
            emit(NewsAppLigthTheme());
          }else if(CacheHelper.getData(key:'theme') == 'Dark'){  emit(NewsAppDarkTheme());}
        }
        break;
      case ThemeApp.Ligth :
        CacheHelper.saveData(key:'theme', value:'Ligth').then((value){

          emit(NewsAppLigthTheme());});
        break;
      case ThemeApp.Dark :
        CacheHelper.saveData(key:'theme', value:'Dark').then((value){

          emit(NewsAppDarkTheme());});
        break;
      default:
    }
  }
}
