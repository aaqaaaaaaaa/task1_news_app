import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:task1_news_app/news/data/data_sources/news_remote_datasource.dart';

import '../../data/models/news_model.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<NewsModel> modelList = [];

  NewsBloc() : super(NewsInitial()) {
    on<GetNewsDataEvent>(getNews, transformer: sequential());
  }

  FutureOr<void> getNews(
      GetNewsDataEvent event, Emitter<NewsState> emit) async {
    modelList.clear();
    emit(NewsLoadingState());
    final result = await NewsRemote().getNewsData();
    if (result.isNotEmpty) {
      emit(NewsDataSuccessState(list: result));
    } else {
      emit(NewsNoDataState(message: 'Malumotlarda hatolik'));
    }
  }
}
