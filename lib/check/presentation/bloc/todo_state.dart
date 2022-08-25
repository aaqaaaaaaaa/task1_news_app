part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class ToDoInitial extends TodoState {}

class ToDoLoadingState extends TodoState {}

class ToDoNoInternetState extends TodoState {}

class ToDoNoDataState extends TodoState {
  final String message;

  ToDoNoDataState({required this.message});
}

class ToDoDataSuccessState extends TodoState {
  final List<ToDoModel> list;

  ToDoDataSuccessState({required this.list});
}
