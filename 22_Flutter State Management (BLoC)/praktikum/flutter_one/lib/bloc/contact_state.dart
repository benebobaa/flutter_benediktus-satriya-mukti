part of 'contact_bloc.dart';

@immutable
abstract class ContactState extends Equatable {

  const ContactState();

  @override
  List<Object?> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoaded extends ContactState {
  final List<Contact> contact;

  const ContactLoaded({required this.contact});

  @override
  List<Object> get props => [contact];
}
