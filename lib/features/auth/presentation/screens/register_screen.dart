import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/default_elevated_button.dart';
import 'package:ecommerce/core/widgets/default_text_form_field.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  static const String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
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
                  bottom: 46.h,
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
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Name',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18.sp),
                          ),
                          SizedBox(height: 24.h),
                          DefaultTextFormField(
                            hintText: 'Enter your name',
                            controller: _nameController,
                            validator: (value) {
                              if (!Validator.hasMinLength(
                                value,
                                minLength: 3,
                              )) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Mobile number',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18.sp),
                          ),
                          SizedBox(height: 24.h),
                          DefaultTextFormField(
                            hintText: 'Enter your mobile number',
                            controller: _phoneController,
                            validator: (value) {
                              if (!Validator.isEGPhoneNumber(value)) {
                                return 'Please enter a valid mobile number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: 20.h),
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
                            maxLength: 30,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35.h),
                    BlocListener<AuthCubit, AuthState>(
                      bloc: _authCubit,
                      listener: (_, state) {
                        if (state is RegisterLoading) {
                          UIUtils.showLoading(context);
                        } else if (state is RegisterSuccess) {
                          UIUtils.hideLoading(context);
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        } else if (state is RegisterError) {
                          UIUtils.hideLoading(context);
                          UIUtils.showMessage(state.message);
                        }
                      },
                      child: DefaultElevatedButton(
                        onPressed: _register,
                        label: 'Sign up',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() {
    if (_formKey.currentState?.validate() == true) {
      _authCubit.register(
        RegisterRequest(
          name: _nameController.text,
          phone: _phoneController.text,
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }
}
