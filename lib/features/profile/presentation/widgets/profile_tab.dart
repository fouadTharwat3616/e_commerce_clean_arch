import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/core/widgets/default_text_form_field.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:ecommerce/features/profile/presentation/cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _profileCubit=serviceLocator.get<ProfileCubit>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _profileCubit..loadUser(),
      child: BlocBuilder<ProfileCubit,ProfileStates>(
        builder: (context, state) {
          if(state is ProfileLoading)
            {
              return const LoadingIndicator();
            }
          else if (state is ProfileSuccess)
            {
              final user =state.user;
              return SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.w),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.h),
                              Image.asset(
                                'assets/images/logo.png',
                                color: Theme.of(context).primaryColor,
                                height: 22.h,
                                width: 66.w,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Welcome,${user.name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                          fontSize: 24.sp,
                                          color: ColorsManager.darkPrimaryColor),
                                    ),
                                    Text(
                                      _profileCubit.user.email,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                          fontSize: 16.sp,
                                          color: ColorsManager.darkPrimaryColor),
                                    ),
                                    SizedBox(height: 40.h),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Your Full Name',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                              fontSize: 18.sp,
                                              color: ColorsManager.darkPrimaryColor),
                                        ),
                                        SizedBox(height: 24.h),
                                        DefaultTextFormField(
                                          hintText: user.name,
                                          controller: _nameController,
                                        ),
                                        SizedBox(height: 20.h),
                                        Text(
                                          'Email',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                              fontSize: 18.sp,
                                              color: ColorsManager.darkPrimaryColor),
                                        ),
                                        SizedBox(height: 24.h),
                                        DefaultTextFormField(
                                          hintText: user.email,
                                          controller: _emailController,
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
                                          hintText: '*********',
                                          controller: _passwordController,
                                          isPassword: true,
                                        ),
                                        SizedBox(height: 20.h),
                                        Text(
                                          'Your Phone Number',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                              fontSize: 18.sp,
                                              color: ColorsManager.darkPrimaryColor),
                                        ),
                                        SizedBox(height: 24.h),
                                        DefaultTextFormField(
                                          hintText: '01013043616',
                                          controller: _phoneController,
                                        ),
                                        SizedBox(height: 20.h),
                                        Text(
                                          'Your Address',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                              fontSize: 18.sp,
                                              color: ColorsManager.darkPrimaryColor),
                                        ),
                                        SizedBox(height: 24.h),
                                        DefaultTextFormField(
                                          hintText: 'egypt,sohag',
                                          controller: _addressController,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        )
                    ),
                  )
              );
            }
          else {
            return const Center(child: Text('Erroe'));
          }
        },
      ),
    );
  }
}
