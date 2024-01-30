import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:trade/components/custom_button.dart';
import 'package:trade/components/custom_text_field.dart';
import 'package:trade/config/app_text_style.dart';
import 'package:trade/controllers/auth_controller.dart';
import 'package:trade/controllers/misc/misc_provider.dart';
import 'package:trade/routes.dart';
import 'package:trade/utils/context_less_navigation.dart';
import 'package:trade/utils/global_functions.dart';

class LoginLayout extends ConsumerStatefulWidget {
  const LoginLayout({super.key});

  @override
  ConsumerState<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends ConsumerState<LoginLayout> {
  final List<FocusNode> fNodes = [FocusNode(), FocusNode()];

  final TextEditingController contactController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    contactController.text = '2088888';
    passwordController.text = 'ral11lod';
    super.initState();
  }

  @override
  void dispose() {
    contactController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FormBuilder(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 80.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login With Phone Number And Password',
                  style: AppTextStyle(context).title,
                ),
                Gap(20.h),
                CustomTextFormField(
                  name: 'phoneNumber',
                  focusNode: fNodes[0],
                  hintText: 'Enter Phone Number',
                  textInputType: TextInputType.text,
                  controller: contactController,
                  textInputAction: TextInputAction.next,
                  validator: (value) => GlobalFunction.defaultValidator(
                    value: value!,
                    hintText: 'Phone Number',
                    context: context,
                  ),
                ),
                Gap(30.h),
                CustomTextFormField(
                  name: 'password',
                  focusNode: fNodes[1],
                  hintText: 'Enter password',
                  textInputType: TextInputType.text,
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: ref.watch(obscureText1),
                  widget: IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      ref.read(obscureText1.notifier).state =
                          !ref.read(obscureText1.notifier).state;
                    },
                    icon: Icon(
                      !ref.read(obscureText1.notifier).state
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  validator: (value) => GlobalFunction.defaultValidator(
                    value: value!,
                    hintText: 'Password',
                    context: context,
                  ),
                ),
                Gap(50.h),
                ref.watch(authControllerProvider)
                    ? const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator())
                    : CustomButton(
                        buttonText: 'Login',
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            ref
                                .read(authControllerProvider.notifier)
                                .login(
                                  contact: contactController.text,
                                  password: passwordController.text,
                                )
                                .then((isSuccess) {
                              if (isSuccess) {
                                context.nav.pushNamed(Routes.dashboard);
                              } else {
                                GlobalFunction.showCustomSnackbar(
                                  message: 'Something went wrong!',
                                  isSuccess: false,
                                );
                              }
                            });
                          }
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
