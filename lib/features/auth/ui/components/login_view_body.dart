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
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is LoginSuccess) {
                context.removeAllAndNavigateToNamedRoute(
                  AppRoutes.sharedHome,
                  predicate: (route) => false,
                );
                showSuccessSnackBar(
                  context,
                  'Login Success',
                );
              } else if (state is LoginFailure) {
                showErrorSnackBar(
                  context,
                  state.message,
                );
              }
            },
            child: AuthButton(
              onPressed: () async {
                if (cubit.loginFormKey.currentState!.validate()) {
                  cubit.login();
                }
              },
              title: 'Log In',
            ),
          ),
        ],
      ),
    );
  }
}
