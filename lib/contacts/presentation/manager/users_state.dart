part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersNoInternetState extends UsersState {}

class UsersNoDataState extends UsersState {
  final String message;

  UsersNoDataState({required this.message});
}

class UsersDataSuccessState extends UsersState {
  final List<UsersModel> list;

  UsersDataSuccessState({required this.list});
}

