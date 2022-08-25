part of 'gallery_bloc.dart';

@immutable
abstract class GalleryState {}
class GalleryInitial extends GalleryState {}

class GalleryLoadingState extends GalleryState {}

class GalleryNoInternetState extends GalleryState {}

class GalleryNoDataState extends GalleryState {
  final String message;

  GalleryNoDataState({required this.message});
}

class GalleryDataSuccessState extends GalleryState {
  final List<GalleryModel> list;

  GalleryDataSuccessState({required this.list});
}
