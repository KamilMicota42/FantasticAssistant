import 'package:flutter_bloc/flutter_bloc.dart';

class CircularLoadingCubit extends Cubit<bool> {
  CircularLoadingCubit() : super(false);

  void turnOnCircularLoading() {
    emit(true);
  }

  void turnOffCircularLoading() {
    emit(false);
  }
}
