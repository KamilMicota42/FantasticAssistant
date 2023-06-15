import 'package:flutter_bloc/flutter_bloc.dart';

class SignInEmailController extends Cubit<String> {
  SignInEmailController() : super('');

  void setNewValue(String value) {
    emit(value);
  }
}

class SignInPasswordController extends Cubit<String> {
  SignInPasswordController() : super('');

  void setNewValue(String value) {
    emit(value);
  }
}

class SignInRepeatPasswordController extends Cubit<String> {
  SignInRepeatPasswordController() : super('');

  void setNewValue(String value) {
    emit(value);
  }
}
