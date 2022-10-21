import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<LoadContact>(  
      ((event, emit) async {
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(ContactLoaded(contact: const <Contact>[]));
      }),
    );
    on<AddContact>((event, emit) {
      if (state is ContactLoaded) {
        final state = this.state as ContactLoaded;
        emit(ContactLoaded(
            contact: List.from(state.contact)..add(event.contact)));
        
      }
    });
    on<DeleteContact>((event, emit) {
      if (state is ContactLoaded) {
        final state = this.state as ContactLoaded;
        emit(ContactLoaded(
            contact: List.from(state.contact)..remove(event.contact)));
      }
    });
  }
}
