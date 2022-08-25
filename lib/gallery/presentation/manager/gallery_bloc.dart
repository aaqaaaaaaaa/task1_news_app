import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:task1_news_app/gallery/data/data_sources/gallery_remote_datasource.dart';
import 'package:task1_news_app/gallery/data/models/gallery_model.dart';

part 'gallery_event.dart';

part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  List<GalleryModel> modelList = [];

  GalleryBloc() : super(GalleryInitial()) {
    on<GetGalleryDataEvent>(getNews, transformer: sequential());
  }

  FutureOr<void> getNews(
      GetGalleryDataEvent event, Emitter<GalleryState> emit) async {
    modelList.clear();
    emit(GalleryLoadingState());
    final result = await GalleryRemoteDatasource().getGalleryData();
    if (result.isNotEmpty) {
      emit(GalleryDataSuccessState(list: result));
    } else {
      emit(GalleryNoDataState(message: 'Malumotlarda hatolik'));
    }
  }
}
