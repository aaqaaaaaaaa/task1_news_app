part of 'contact_details_bloc.dart';

@immutable
abstract class ContactDetailsEvent {}

class GetContactDetailsEvent extends ContactDetailsEvent {
  final UsersModel model;

  GetContactDetailsEvent(this.model);
}
