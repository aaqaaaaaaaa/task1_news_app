import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:task1_news_app/contacts/data/data_sources/users_remove_datasource.dart';
import 'package:task1_news_app/contacts/data/models/users_model.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  List<UsersModel> modelList = [];

  UsersBloc() : super(UsersInitial()) {
    on<GetUsersDataEvent>(getUsers, transformer: sequential());
  }

  FutureOr<void> getUsers(
      GetUsersDataEvent event, Emitter<UsersState> emit) async {
    modelList.clear();
    emit(UsersLoadingState());
    final result = await UsersRemoteDatasource().getUsersData();
    if (result.isNotEmpty) {
      emit(UsersDataSuccessState(list: result));
    } else {
      emit(UsersNoDataState(message: 'Malumotlarda hatolik'));
    }
  }
}
