import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_news_app/news/presentation/manager/news_bloc.dart';
import 'package:task1_news_app/news/presentation/widgets/news_shimmer.dart';

import '../../data/models/news_model.dart';
import '../widgets/news_items_widget.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsModel> newsList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[900],
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            debugPrint('$newsList');
            if (newsList.isEmpty) {
              context.read<NewsBloc>().add(GetNewsDataEvent());
            }
          }
          if (state is NewsLoadingState) {
            return const NewsItemsShimmerWidget();
          } else if (state is NewsNoDataState) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            );
          } else if (state is NewsDataSuccessState) {
            newsList = state.list;
            debugPrint('$newsList');
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return NewsItemsWidget(
                  body: state.list[index].body,
                  title: state.list[index].title,
                  id: state.list[index].id,
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
