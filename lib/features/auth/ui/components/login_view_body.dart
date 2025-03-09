part of '../screens/login_view.dart';

class _LoginViewBody extends StatelessWidget {
  const _LoginViewBody();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          const BuildHeaderForAuth(
            image: AppImages.login,
            title: 'Login',
          ),
          verticalSpacing(12),
          LoginForm(cubit: cubit),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          verticalSpacing(15),
          AuthButton(
            onPressed: () async {
              // Validate and submit login form
              // if validation passes then call login()
              if (cubit.loginFormKey.currentState!.validate()) {
                cubit.login();
              }
            },
            title: 'Log In',
          ),
        ],
      ),
    );
  }
}
