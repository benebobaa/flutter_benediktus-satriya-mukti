part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {
  const ContactEvent();

  List<Object?> get props => [];
}

class LoadContact extends ContactEvent {}

class AddContact extends ContactEvent {
  final Contact contact;

  const AddContact(this.contact);

  @override
  List<Object> get props => [contact];
}

class DeleteContact extends ContactEvent {
  final Contact contact;

  const DeleteContact(this.contact);

  @override
  List<Object> get props => [contact];
}
