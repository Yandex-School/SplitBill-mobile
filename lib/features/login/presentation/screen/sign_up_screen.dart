import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/utils/text_utils.dart';
import 'package:split_bill/core/widgets/custom_button.dart';
import 'package:split_bill/features/login/presentation/provider/login_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordMatch = true;

  @override
  void initState() {
    super.initState();
    fullNameController.text = 'Test User';
    emailController.text = 'user@example.com';
    passwordController.text = 'Password1!';
    confirmPasswordController.text = 'Password1!';
  }

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
                  // Заголовок
                  Text(
                      "Создать учетную запись",
                       style: TextUtils.headingStyle.copyWith(
                       fontSize: 27, 
                   ),
                    textAlign: TextAlign.center, 
                  ),
                  const SizedBox(height: 40),

                  TextField(
                    controller: fullNameController,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      labelText: "Полное имя",
                      labelStyle: TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: Icon(Icons.person, color: TextUtils.grey),
                      filled: true,
                      fillColor: Color(0xff051326),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

            
                  TextField(
                    controller: emailController,
                    onChanged: loginProvider.setEmail,
                    decoration: InputDecoration(
                      labelText: "Адрес электронной почты",
                      labelStyle: const TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: const Icon(Icons.email, color: TextUtils.grey),
                      errorText: loginProvider.isValidEmail
                          ? null
                          : "Введите действительный адрес электронной почты",
                      filled: true,
                      fillColor: const Color(0xff051326),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    controller: passwordController,
                    onChanged: (value) {
                      loginProvider.setPassword(value);
                      _validatePasswords(value, confirmPasswordController.text);
                    },
                    obscureText: loginProvider.showPassword,
                    decoration: InputDecoration(
                      labelText: "Пароль",
                      labelStyle: const TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: const Icon(Icons.lock, color: TextUtils.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginProvider.showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: TextUtils.grey,
                        ),
                        onPressed: loginProvider.toggleShowPassword,
                      ),
                      errorText: loginProvider.isValidPassword ? null : "Неверный пароль",
                      filled: true,
                      fillColor: const Color(0xff051326),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: confirmPasswordController,
                    onChanged: (value) {
                      _validatePasswords(passwordController.text, value);
                    },
                    obscureText: loginProvider.showPassword,
                    decoration: InputDecoration(
                      labelText: "Подтвердите пароль",
                      labelStyle: const TextStyle(color: TextUtils.grey, fontSize: 14),
                      prefixIcon: const Icon(Icons.lock, color: TextUtils.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginProvider.showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: TextUtils.grey,
                        ),
                        onPressed: loginProvider.toggleShowPassword,
                      ),
                      errorText: isPasswordMatch ? null : "Пароли не совпадают",
                      filled: true,
                      fillColor: const Color(0xff051326),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity, 
                    child: CustomButton(
                      text: "Зарегистрироваться",
                      onPressed: () {
                        if (loginProvider.isValidEmail &&
                            loginProvider.isValidPassword &&
                            isPasswordMatch &&
                            fullNameController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Учетная запись успешно создана!')),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Неверные входные данные!')),
                          );
                        }
                      },
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

  void _validatePasswords(String password, String confirmPassword) {
    setState(() {
      isPasswordMatch = password == confirmPassword;
    });
  }
}
