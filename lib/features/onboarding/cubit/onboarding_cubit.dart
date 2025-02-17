import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  PageController boardController = PageController();

  int currentIndex = 0;
  void onPageChanged(int value) {
    currentIndex = value;
    emit(OnboardingChangePage());
  }

  bool isLast = false;

// TODO(home_user): save to shared pref
  // void savedToSharedPref() {
  //   LocalData.set(
  //     key: AppSharedKeys.skipOnBoarding,
  //     value: true,
  //   );
  // }
}
