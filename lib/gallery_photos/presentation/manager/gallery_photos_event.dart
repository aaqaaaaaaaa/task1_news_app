part of 'gallery_photos_bloc.dart';

@immutable
abstract class GalleryPhotosEvent {}

class GetGalleryPhotosEvent extends GalleryPhotosEvent {
  final int id;

  GetGalleryPhotosEvent(this.id);
}
