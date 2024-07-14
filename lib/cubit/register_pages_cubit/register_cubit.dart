import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);

  int currentIndex = 0;
  PageController pageController = PageController();

  void goToNextScreen() {
    if (currentIndex == 0) {
      currentIndex++;
      pageController.jumpToPage(currentIndex);
      emit(RegisterFirst());
    } else {
      currentIndex = 0;
      pageController
          .jumpToPage(currentIndex); // Reset index after the last screen
      emit(RegisterSecond());
    }
  }
}
