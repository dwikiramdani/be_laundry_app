import 'package:be_laundry/util/color.dart';
import 'package:be_laundry/util/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final lColor = LColor();
  final lStyle = LTextStyle();
  bool isPasswordObscure = true;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lColor.vividCerulean,
      body: Stack(
        children: [
          Image.asset("assets/images/login_bg.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 85),
              buildLoginTitle(),
              const SizedBox(height: 42),
              Expanded(
                child: buildLoginSection(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLoginTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Be Laundy",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: lColor.white,
            ),
          ),
          const SizedBox(height: 36),
          Text(
            "Sign in to Your Account",
            style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w600,
                color: lColor.white,
                height: 1),
          ),
          const SizedBox(height: 16),
          Text(
            "To enter our app, you must sign in first",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: lColor.white,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      decoration: BoxDecoration(
        color: lColor.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Email",
              style: lStyle.regular.apply(color: lColor.vividCerulean)),
          const SizedBox(height: 4),
          buildTextField(
            controller: emailController,
            focusNode: emailFocusNode,
            labelText: "Email",
            hintText: "Enter Email",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else if (!value.contains("@")) {
                return 'Please enter corrent email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Text("Email",
              style: lStyle.regular.apply(color: lColor.vividCerulean)),
          const SizedBox(height: 4),
          buildTextField(
            controller: passwordController,
            focusNode: passwordFocusNode,
            labelText: "Password",
            hintText: "Enter Password",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              } else if (value.length < 8) {
                return 'Password must contain at least 8 character';
              }
              return null;
            },
            isObscuredText: isPasswordObscure,
          ),
          const SizedBox(height: 32),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              backgroundColor: lColor.vividCerulean,
              minimumSize: const Size(1000, 43),
            ),
            child: Text(
              "Sign in",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: lColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required String labelText,
    required String hintText,
    required TextEditingController controller,
    required FocusNode focusNode,
    String? Function(String?)? validator,
    TextInputType textInputType = TextInputType.emailAddress,
    bool? isObscuredText = false,
    bool? isEnable = true,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        enabled: isEnable,
        controller: controller,
        focusNode: focusNode,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        obscureText: isObscuredText!,
        validator: validator,
        style: lStyle.regular,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          hintText: hintText,
          hintStyle: lStyle.regular,
          labelText: labelText,
          labelStyle: lStyle.regular,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: lColor.gray, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: lColor.gray, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
