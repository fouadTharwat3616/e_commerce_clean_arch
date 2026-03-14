import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/default_elevated_button.dart';
import 'package:ecommerce/core/widgets/default_text_form_field.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:ecommerce/features/auth/presentation/screens/register_screen.dart';
import 'package:ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authCubit = serviceLocator.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 91.h,
                  bottom: 87.h,
                  left: 97.w,
                  right: 97.w,
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome Back To Route',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 24.sp),
                    ),
                    Text(
                      'Please sign in with your email',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 16.sp),
                    ),
                    SizedBox(height: 40.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18.sp),
                          ),
                          SizedBox(height: 24.h),
                          DefaultTextFormField(
                            hintText: 'Enter your email address',
                            controller: _emailController,
                            validator: (value) {
                              if (!Validator.isEmail(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Password',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18.sp),
                          ),
                          SizedBox(height: 24.h),
                          DefaultTextFormField(
                            hintText: 'Enter your password',
                            controller: _passwordController,
                            isPassword: true,
                            validator: (value) {
                              if (!Validator.isPassword(value)) {
                                return 'Password can’t be less than 6 characters';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: ColorsManager.whiteColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    BlocListener<AuthCubit, AuthState>(
                      bloc: _authCubit,
                      listener: (_, state) {
                        if (state is LoginLoading) {
                          UIUtils.showLoading(context);
                        } else if (state is LoginSuccess) {
                          UIUtils.hideLoading(context);
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        } else if (state is LoginError) {
                          UIUtils.hideLoading(context);
                          UIUtils.showMessage(state.message);
                        }
                      },
                      child: DefaultElevatedButton(
                        onPressed: _login,
                        label: 'Login',
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(width: 4.w),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RegisterScreen.routeName);
                          },
                          child: Text(
                            'Create Account',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState?.validate() == true) {
      _authCubit.login(
        LoginRequest(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }
}
