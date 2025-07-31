import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:indrive_client/presentation/page/auth/utils/bloc_form_item.dart';

class ProfileUpdateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;

  ProfileUpdateState({
    this.name = const BlocFormItem(error: 'Ingrese el nombre'),
    this.lastName = const BlocFormItem(error: 'Ingrese el apellido'),
    this.phone = const BlocFormItem(error: 'Ingrese el telefono'),
    this.formKey,
  });

  ProfileUpdateState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? phone,
    GlobalKey<FormState>? formKey,
  }) {
    return ProfileUpdateState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object?> get props => [name, lastName, phone];
}
