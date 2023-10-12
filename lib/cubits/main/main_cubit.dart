import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeToDark() {
    isDark = true;
    emit(DarkThemeState());
  }

  void changeToLight() {
    isDark = false;
    emit(LightThemeState());
  }

  int counter = 0;

  void increment() {
    counter++;
    emit(IncrementState());
  }

  void decrement() {
    counter--;
    emit(DecrementState());
  }
}
