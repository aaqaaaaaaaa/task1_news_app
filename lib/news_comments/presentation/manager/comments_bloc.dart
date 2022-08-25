import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:task1_news_app/news_comments/data/models/comments_model.dart';

import '../../data/data_sources/comments_remote_datasource.dart';

part 'comments_event.dart';

part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  List<CommentsModel> modelList = [];

  CommentsBloc() : super(CommentsInitial()) {
    on<GetCommentsEvent>(getComments, transformer: sequential());
  }

  FutureOr<void> getComments(
      GetCommentsEvent event, Emitter<CommentsState> state) async {
    modelList.clear();
    emit(CommentsLoadingState());
    final result = await CommentsRemote().getCommentsData(event.id);
    if (result.isNotEmpty) {
      emit(CommentsDataSuccessState(list: result));
    } else {
      emit(CommentsNoDataState(message: 'Malumotlarda hatolik'));
    }
  }
}
