import 'package:indrive_client/domain/models/user.dart';
import 'package:indrive_client/presentation/page/auth/utils/bloc_form_item.dart';

abstract class ProfileUpdateEvent {}

class ProfileUpdateInitEvent extends ProfileUpdateEvent {
  final User? user;

  ProfileUpdateInitEvent({required this.user});
}

class NameChangedEvent extends ProfileUpdateEvent {
  final BlocFormItem name;

  NameChangedEvent({required this.name});
}

class LastNameChangedEvent extends ProfileUpdateEvent {
  final BlocFormItem lastName;

  LastNameChangedEvent({required this.lastName});
}

class PhoneChangedEvent extends ProfileUpdateEvent {
  final BlocFormItem phone;

  PhoneChangedEvent({required this.phone});
}

class FormSubmitEvent extends ProfileUpdateEvent {}
