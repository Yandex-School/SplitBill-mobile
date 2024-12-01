import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/router/app_router.dart';
import 'package:split_bill/core/utils/text_utils.dart';
import 'package:split_bill/core/widgets/custom_button.dart';
import 'package:split_bill/features/login/presentation/provider/login_provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff051326),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff051326),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Create Account", style: TextUtils.headingStyle),
                  const SizedBox(height: 40),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      labelStyle: TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: Icon(Icons.person, color: TextUtils.grey),
                      filled: true,
                      fillColor: Color(0xff051326),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: loginProvider.setEmail,
                    decoration: InputDecoration(
                      labelText: "User Name",
                      labelStyle: const TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: const Icon(Icons.email, color: TextUtils.grey),
                      errorText: loginProvider.isValidEmail ? null : "Enter valid email",
                      filled: true,
                      fillColor: const Color(0xff051326),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: loginProvider.setPassword,
                    obscureText: loginProvider.showPassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: const TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: const Icon(Icons.lock, color: TextUtils.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginProvider.showPassword ? Icons.visibility_off : Icons.visibility,
                          color: TextUtils.grey,
                        ),
                        onPressed: loginProvider.toggleShowPassword,
                      ),
                      errorText: loginProvider.isValidPassword ? null : "Invalid password",
                      filled: true,
                      fillColor: const Color(0xff051326),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: loginProvider.setPassword,
                    obscureText: loginProvider.showPassword,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: const TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: const Icon(Icons.lock, color: TextUtils.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginProvider.showPassword ? Icons.visibility_off : Icons.visibility,
                          color: TextUtils.grey,
                        ),
                        onPressed: loginProvider.toggleShowPassword,
                      ),
                      errorText: loginProvider.isValidPassword ? null : "Invalid password",
                      filled: true,
                      fillColor: const Color(0xff051326),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    text: "SIGN UP",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Account created successfully!')),
                      );
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?", style: TextStyle(color: Colors.white, fontSize: 16)),
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: const Text(
                            " Sign in",
                            style: TextStyle(fontSize: 16, color: TextUtils.orange, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
