import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  int currentPage = 0;

  void selectPage(int index) {
    currentPage = index;
    emit(index);
  }
}
