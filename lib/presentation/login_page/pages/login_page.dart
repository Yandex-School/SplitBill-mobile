import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/presentation/login_page/core/utils/text_utils.dart';
import 'package:split_bill/presentation/login_page/domain/providers/login_provider.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xff051326),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Color(0xff051326),
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
                  const Text("Login", style: TextUtils.headingStyle),
                  const SizedBox(height: 10),
                  const Text("Please sign in to continue", style: TextUtils.subtitleStyle),
                  const SizedBox(height: 40),
                  TextField(
                    onChanged: loginProvider.setEmail,
                    decoration: InputDecoration(
                      labelText: "User Name",
                      labelStyle: const TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: const Icon(Icons.email, color: TextUtils.grey),
                      errorText: loginProvider.isValidEmail ? null : "Enter valid email",
                      filled: true,
                      fillColor: Color(0xff051326),
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
                      fillColor:Color(0xff051326),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    text: "LOGIN",
                    onPressed: () {
                      if (loginProvider.validateCredentials()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login successful!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid credentials!')),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?", style: TextStyle(color: Colors.white, fontSize: 16)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text(
                            " Sign up",
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
