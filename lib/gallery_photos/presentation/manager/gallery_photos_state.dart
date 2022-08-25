part of 'gallery_photos_bloc.dart';

@immutable
abstract class GalleryPhotosState {}

class GalleryPhotosInitial extends GalleryPhotosState {}

class GalleryPhotosLoadingState extends GalleryPhotosState {}

class GalleryPhotosNoInternetState extends GalleryPhotosState {}

class GalleryPhotosNoDataState extends GalleryPhotosState {
  final String message;

  GalleryPhotosNoDataState({required this.message});
}

class GalleryPhotosDataSuccessState extends GalleryPhotosState {
  final List<PhotosModel> list;

  GalleryPhotosDataSuccessState({required this.list});
}
