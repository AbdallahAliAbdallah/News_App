part of 'news_app_layout_cubit.dart';

@immutable
abstract class NewsAppLayoutState {}

class NewsAppLayoutInitial extends NewsAppLayoutState {}
class NewsAppChangeBottom extends NewsAppLayoutState {}
class NewsAppGetBusinessLoading extends NewsAppLayoutState {}
class NewsAppGetBusinessSuccess extends NewsAppLayoutState {}
class NewsAppGetBusinessError extends NewsAppLayoutState {}
class NewsAppGetSportsLoading extends NewsAppLayoutState {}
class NewsAppGetSportsSuccess extends NewsAppLayoutState {}
class NewsAppGetSportsError extends NewsAppLayoutState {}
class NewsAppGetSciencesLoading extends NewsAppLayoutState {}
class NewsAppGetSciencesSuccess extends NewsAppLayoutState {}
class NewsAppGetSciencesError extends NewsAppLayoutState {}
class ChangeTheme extends NewsAppLayoutState {}
class SearchLoading extends NewsAppLayoutState {}
class SearchSuccess extends NewsAppLayoutState {}
class SearchError extends NewsAppLayoutState {}