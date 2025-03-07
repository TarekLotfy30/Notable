import 'package:flutter/material.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/utils/images/app_images.dart';
import '../components/auth_button.dart';
import '../components/build_header_for_auth.dart';
import '../components/login_form.dart';

part '../components/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _RegisterViewBody();
  }
}
