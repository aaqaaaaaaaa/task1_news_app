import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:task1_news_app/contacts/data/models/users_model.dart';

part 'contact_details_event.dart';

part 'contact_details_state.dart';

class ContactDetailsBloc
    extends Bloc<ContactDetailsEvent, ContactDetailsState> {
  ContactDetailsBloc() : super(ContactDetailsInitial()) {
    on<GetContactDetailsEvent>(getContactDetails, transformer: sequential());
  }

  FutureOr<void> getContactDetails(
      GetContactDetailsEvent event, Emitter<ContactDetailsState> state) async {
    emit(ContactDetailsLoadingState());

    emit(ContactDetailsDataSuccessState(model: event.model));
  }
}
