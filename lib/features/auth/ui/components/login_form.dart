part of '../screen/login_view.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    required this.cubit,
  });

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            controller: cubit.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: cubit.validateEmail,
            autovalidateMode: AutovalidateMode.onUnfocus,
            maxLines: 1,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Example: johndoe@gmail.com',
            ).applyDefaults(Theme.of(context).inputDecorationTheme),
            style: AppTextStyles.textStyle16,
          ),
          verticalSpacing(16),
          BlocBuilder<LoginCubit, LoginState>(
            // Only rebuild when it's a ChangeIsObscure state
            buildWhen: (_, current) => current is ChangeIsObscure,
            builder: (context, state) {
              return TextFormField(
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                controller: cubit.passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: cubit.validatePassword,
                autovalidateMode: AutovalidateMode.onUnfocus,
                obscureText: cubit.isObscure,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: '********',
                  suffixIcon: IconButton(
                    onPressed: cubit.changeIsObscure,
                    icon: Visibility(
                      visible: cubit.isObscure,
                      replacement: const Icon(
                        Icons.visibility_off,
                        color: AppColors.darkGrayColor,
                      ),
                      child: const Icon(
                        Icons.visibility,
                        color: AppColors.darkGrayColor,
                      ),
                    ),
                  ),
                ).applyDefaults(Theme.of(context).inputDecorationTheme),
                style: AppTextStyles.textStyle16,
              );
            },
          ),
        ],
      ),
    );
  }
}
