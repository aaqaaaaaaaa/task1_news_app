
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_news_app/gallery_photos/presentation/manager/gallery_photos_bloc.dart';

class GalleryPhotosPage extends StatefulWidget {
  const GalleryPhotosPage(
      {Key? key, required this.albumId, required this.title})
      : super(key: key);
  final int albumId;
  final String title;

  @override
  State<GalleryPhotosPage> createState() => _GalleryPhotosPageState();
}

class _GalleryPhotosPageState extends State<GalleryPhotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.purple[900],
        child: BlocProvider(
          create: (context) => GalleryPhotosBloc(),
          child: BlocBuilder<GalleryPhotosBloc, GalleryPhotosState>(
            builder: (context, state) {
              if (state is GalleryPhotosInitial) {
                context
                    .read<GalleryPhotosBloc>()
                    .add(GetGalleryPhotosEvent(widget.albumId));
              } else if (state is GalleryPhotosLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GalleryPhotosNoDataState) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                );
              } else if (state is GalleryPhotosDataSuccessState) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child:
                          Image.network(state.list[index].thumbnailUrl ?? ''),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
