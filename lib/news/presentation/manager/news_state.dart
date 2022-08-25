part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsNoInternetState extends NewsState {}

class NewsNoDataState extends NewsState {
  final String message;

  NewsNoDataState({required this.message});
}

class NewsDataSuccessState extends NewsState {
  final List<NewsModel> list;

  NewsDataSuccessState({required this.list});
}
