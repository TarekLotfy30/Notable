import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/functions.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/utils/images/app_images.dart';
import '../../../../core/utils/typography/app_text_styles.dart';
import '../../cubit/login_cubit.dart';
import '../components/auth_button.dart';
import '../components/build_header_for_auth.dart';
import '../components/login_form.dart';

part '../components/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LoginViewBody();
  }
}
