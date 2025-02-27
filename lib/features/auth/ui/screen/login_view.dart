import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/functions.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/utils/images/app_images.dart';
import '../../../../core/utils/typography/app_text_styles.dart';
import '../../../../core/utils/typography/font_weight_helper.dart';
import '../../cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // BuildHeader(),
            Image.asset(
              AppImages.login,
              fit: BoxFit.contain,
              height: 250.h,
            ),
            verticalSpacing(20),
            Text(
              'Login',
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle32.copyWith(
                fontWeight: FontWeightHelper.extraBold,
              ),
            ),
            verticalSpacing(12),
            //buildLoginForm
            Form(
              key: context.read<LoginCubit>().loginFormKey,
              child: Column(
                children: [
                  // AppTextFormField with email controller
                  TextFormField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    controller: context.read<LoginCubit>().emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email field is required.';
                      }
                      if (!AppRegex.isEmailValid(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textCapitalization: TextCapitalization.none,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Example: johndoe@gmail.com',
                    ).applyDefaults(Theme.of(context).inputDecorationTheme),
                    style: AppTextStyles.textStyle16,
                  ),
                  verticalSpacing(16),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return TextFormField(
                        onTapOutside: (event) => FocusScope.of(context).unfocus(),
                        controller: context.read<LoginCubit>().passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password field is required.';
                          }
                          if (!AppRegex.isPasswordValid(value)) {
                            return 'The password is not valid';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLines: 1,
                        obscureText: context.read<LoginCubit>().isObscure,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: '********',
                          suffixIcon: IconButton(
                            onPressed: () {
                              context.read<LoginCubit>().changeIsObscure();
                            },
                            icon: Visibility(
                              visible: context.read<LoginCubit>().isObscure,
                              replacement: const Icon(
                                Icons.visibility_off,
                                color: AppColors.primaryColor,
                              ),
                              child: const Icon(
                                Icons.visibility,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ).applyDefaults(Theme.of(context).inputDecorationTheme),
                        style: AppTextStyles.textStyle16,
                      );
                    },
                  ),
                  verticalSpacing(30),
                  ElevatedButton(
                    onPressed: () async {
                      // Validate and submit login form
                      // if validation passes then call login()
                      if (context.read<LoginCubit>().loginFormKey.currentState!.validate()) {
                        context.read<LoginCubit>().login();
                      }
                    },
                    style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                          minimumSize: WidgetStateProperty.all(
                            Size(
                              192.w,
                              56.h,
                            ),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                    child: const Text(
                      'Log  In',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
