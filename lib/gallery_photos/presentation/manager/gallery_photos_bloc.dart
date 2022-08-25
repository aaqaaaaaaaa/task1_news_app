import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:task1_news_app/gallery_photos/data/data_sources/gallery_remote.dart';
import 'package:task1_news_app/gallery_photos/data/models/photos_model.dart';

part 'gallery_photos_event.dart';
part 'gallery_photos_state.dart';

class GalleryPhotosBloc extends Bloc<GalleryPhotosEvent, GalleryPhotosState> {
  List<PhotosModel> modelList = [];
  GalleryPhotosBloc() : super(GalleryPhotosInitial()) {
    on<GetGalleryPhotosEvent>(getPhotos, transformer: sequential());
  }

  FutureOr<void> getPhotos(
      GetGalleryPhotosEvent event, Emitter<GalleryPhotosState> emit) async {
    modelList.clear();
    emit(GalleryPhotosLoadingState());
    final result = await PhotosRemoteDatasource().getGalleryData(event.id);
    if (result.isNotEmpty) {
      emit(GalleryPhotosDataSuccessState(list: result));
    } else {
      emit(GalleryPhotosNoDataState(message: 'Malumotlarda hatolik'));
    }
  }
}
