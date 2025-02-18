import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/local/shared_keys.dart';
import '../../../core/services/local/shared_preferences.dart';
import '../data/model/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  PageController boardController = PageController();
  bool isLast = false;
  int currentIndex = 0;
  void onPageChanged(int index) {
    currentIndex = index;
    if (index == onboardingList.length - 1) {
      isLast = true;
    } else {
      isLast = false;
    }
    emit(ChangePage());
  }

  Future<void> savedToSharedPref() async {
    SharedHelper.set(
      key: AppSharedKeys.skipOnBoarding.toString(),
      value: true,
    );
  }
}
