import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/services/local/local_helper.dart';
import '../../../core/services/local/shared_keys.dart';
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
    getIt<LocalHelper>().set(
      key: AppSharedKeys.skipOnBoarding.toString(),
      value: true,
    );
  }
}
