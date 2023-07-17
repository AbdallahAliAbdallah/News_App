import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/network/remote/cache_helper.dart';

import '../../network/endpoints.dart';
import '../../network/remote/dio_helper.dart';
import '../business/business.dart';
import '../sciences/sciences.dart';
import '../settings/settings.dart';
import '../sports/sports.dart';

part 'news_app_layout_state.dart';

class NewsAppLayoutCubit extends Cubit<NewsAppLayoutState> {
  NewsAppLayoutCubit() : super(NewsAppLayoutInitial());

  static NewsAppLayoutCubit get(BuildContext context) =>
      BlocProvider.of(context);
  List<Widget> screens = [Business(), Sports(), Sciences()];
  List<BottomNavigationBarItem> bottoms = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),

  ];
  int currentindex = 0;

  void changeBottom(int i) {
    currentindex = i;
    if (i == 1) {
      getSports();
    } else if (i == 2) {
      getSciences();
    }
    emit(NewsAppChangeBottom());
  }

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

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsAppGetBusinessLoading());
    DioHelper.getData(path: endPoints, query: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'eb2e29496bf74c8ca82b5d3254f580bf'
    }).then((value) {
      business = value.data["articles"];
      emit(NewsAppGetBusinessSuccess());
    }).catchError((error) {
      emit(NewsAppGetBusinessError());
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsAppGetSportsLoading());
    if (sports.length == 0) {
      DioHelper.getData(path: endPoints, query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': 'eb2e29496bf74c8ca82b5d3254f580bf'
      }).then((value) {
        sports = value.data["articles"];
        emit(NewsAppGetSportsSuccess());
      }).catchError((error) {
        emit(NewsAppGetSportsError());
      });
    } else {
      emit(NewsAppGetSportsSuccess());
    }
  }

  List<dynamic> sciences = [];

  void getSciences() {
    emit(NewsAppGetSciencesLoading());
    if (sciences.length == 0) {
      DioHelper.getData(path: endPoints, query: {
        'country': 'us',
        'category': 'science',
        'apiKey': 'eb2e29496bf74c8ca82b5d3254f580bf'
      }).then((value) {
        sciences = value.data["articles"];
        emit(NewsAppGetSciencesSuccess());
      }).catchError((error) {
        emit(NewsAppGetSciencesError());
      });
    } else {
      emit(NewsAppGetSciencesSuccess());
    }
  }
  List<dynamic> Search = [];

  void getsearch(String value) {
    emit(SearchLoading());
    Search = [];

    DioHelper.getData(path: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'eb2e29496bf74c8ca82b5d3254f580bf'
    }).then((value) {
      Search = value.data['articles'];
      print(Search[0]['title']);
      emit(SearchSuccess());
    }).catchError((error) {
      print("error is $error");
      emit(SearchError());
    });
  }

}
