import 'package:ecommerce_application/auth/login_page.dart';
import 'package:ecommerce_application/pages/home.dart';
import 'package:ecommerce_application/services/blocs/auth_bloc/auth_bloc.dart';
import 'package:ecommerce_application/services/functions/app_functions.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:ecommerce_application/widgets/global/b_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: BAppColors.getSecondaryButtonColor(context),
          scrolledUnderElevation: 5,
          shadowColor: BAppColors.grey50Color,
          title: SvgPicture.asset(
            Theme.of(context).brightness == Brightness.dark
                ? Images.quickmartDarkIcon
                : Images.quickmartIcon,
          ),
          surfaceTintColor: Colors.transparent,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
                (route) => false,
              );
            }
            if (state is AuthErrorState) {
              showCustomSnackbar(
                context,
                state.error.split("[").last.split("]").last,
                BAppColors.cyanColor,
              );
            }
          },
          builder: (context, state) {
            bool enabled = true;
            if (state is AuthLoadingState) {
              enabled = false;
            }

            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  "Signup",
                  style: BTextStyle.heading2Bold(context),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: BTextStyle.body2Regular(context)
                            .copyWith(color: BAppColors.grey150Color),
                      ),
                      TextSpan(
                        text: "Login",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                        style: BTextStyle.body2Regular(context)
                            .copyWith(color: BAppColors.cyanColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Full Name",
                  style: BTextStyle.body2Medium(context),
                ),
                const SizedBox(height: 10),
                BTextfield(
                  enabled: enabled,
                  controller: nameController,
                  hintText: "Enter your full name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  "Email",
                  style: BTextStyle.body2Medium(context),
                ),
                const SizedBox(height: 10),
                BTextfield(
                  enabled: enabled,
                  controller: emailController,
                  hintText: "Enter your email",
                ),
                const SizedBox(height: 20),
                Text(
                  "Password",
                  style: BTextStyle.body2Medium(context),
                ),
                const SizedBox(height: 10),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    bool obscureText = true;
                    if (state is EyeToggleState) {
                      obscureText = state.obscureText;
                    }
                    return BTextfield(
                      enabled: enabled,
                      controller: passwordController,
                      obscureText: obscureText,
                      hintText: "Enter your password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          context
                              .read<AuthBloc>()
                              .add(ShowPasswordTappedEvent());
                        },
                        child: SvgPicture.asset(
                          Images.eyeIcon,
                          height: 24,
                          width: 24,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                BButton(
                  text: !enabled ? "..." : "Create Account",
                  icon: false,
                  onPressed: () {
                    if (enabled) {
                      context.read<AuthBloc>().add(
                            LoginEvent(
                              emailController.text,
                              passwordController.text,
                              nameController.text,
                            ),
                          );
                    }
                  },
                ),
                const SizedBox(height: 20),
                BButton(
                  color: BAppColors.getSecondaryButtonColor(context),
                  iconColor: BAppColors.cyanColor,
                  textColor: BAppColors.getTextColor(context),
                  text: "Signup with Google",
                  icon: true,
                  elevation: 0,
                  iconName: Images.googleIcon,
                  border: true,
                  onPressed: () {
                    if (enabled) {
                      context.read<AuthBloc>().add(GoogleEvent());
                    }
                  },
                ),
              ],
            );
          },
        ));
  }
}
