part of 'contact_details_bloc.dart';

@immutable
abstract class ContactDetailsState {}

class ContactDetailsInitial extends ContactDetailsState {}

class ContactDetailsLoadingState extends ContactDetailsState {}

class ContactDetailsNoInternetState extends ContactDetailsState {}

class ContactDetailsNoDataState extends ContactDetailsState {
  final String message;

  ContactDetailsNoDataState({required this.message});
}

class ContactDetailsDataSuccessState extends ContactDetailsState {
  final UsersModel model;

  ContactDetailsDataSuccessState({required this.model});
}
