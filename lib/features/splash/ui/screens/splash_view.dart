import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/routes/app_routes_name.dart';
import '../../../../core/routes/extensions.dart';
import '../../../../core/services/local/local_helper.dart';
import '../../../../core/services/local/shared_keys.dart';
import '../../../../core/utils/typography/app_text_styles.dart';

part '../components/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const _SplashViewBody(),
    );
  }
}
