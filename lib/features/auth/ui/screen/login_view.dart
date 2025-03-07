import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/utils/images/app_images.dart';
import '../../../../core/utils/typography/app_text_styles.dart';
import '../../../../core/utils/typography/font_weight_helper.dart';
import '../../cubit/login_cubit.dart';



part '../components/login_view_body.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LoginViewBody();
  }
}
