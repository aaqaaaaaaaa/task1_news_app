import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_news_app/gallery_photos/presentation/pages/gallery_photos.dart';

import '../manager/gallery_bloc.dart';
import '../widgets/gallery_shimmer.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[900],
      child: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          if (state is GalleryInitial) {
            context.read<GalleryBloc>().add(GetGalleryDataEvent());
          }
          if (state is GalleryLoadingState) {
            return const GalleryItemsShimmerWidget();
          } else if (state is GalleryNoDataState) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            );
          } else if (state is GalleryDataSuccessState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GalleryPhotosPage(
                              title: state.list[index].title ?? '',
                              albumId: state.list[index].id ?? 1),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(
                          '${state.list[index].title}',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
