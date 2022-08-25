import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1_news_app/check/data/data_sources/todos_remote_datasource.dart';
import 'package:task1_news_app/check/data/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<ToDoModel> modelList = [];
  TodoBloc() : super(ToDoInitial()) {
    on<GetToDoDataEvent>(getToDos, transformer: sequential());
  }
  FutureOr<void> getToDos(
      GetToDoDataEvent event, Emitter<TodoState> emit) async {
    modelList.clear();
    emit(ToDoLoadingState());
    final result = await TodosRemoteDatasource().getToDosData();
    if (result.isNotEmpty) {
      emit(ToDoDataSuccessState(list: result));
    } else {
      emit(ToDoNoDataState(message: 'Malumotlarda hatolik'));
    }
  }
}
