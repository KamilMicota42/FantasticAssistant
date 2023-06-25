import 'package:flutter_bloc/flutter_bloc.dart';

class AuthFlowNavigationCubit extends Cubit<int> {
  AuthFlowNavigationCubit() : super(0);

  void setNavigationCubit(int value) {
    emit(value);
  }
}
