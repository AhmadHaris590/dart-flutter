import 'package:flutter/material.dart';

// StatefulWidget because loading, error text, and password visibility change.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;
  String? errorMessage;

  @override
  void dispose() {
    // Controllers should be disposed when the screen is destroyed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateForm() {
    if (emailController.text.trim().isEmpty) {
      return 'Email is required';
    }
    if (passwordController.text.isEmpty) {
      return 'Password is required';
    }
    if (passwordController.text.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  Future<void> submitLogin() async {
    final String? validationError = validateForm();

    if (validationError != null) {
      setState(() {
        errorMessage = validationError;
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    // Fake async login.
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    // Replaces login screen with dashboard and sends email as argument.
    Navigator.pushReplacementNamed(
      context,
      '/dashboard',
      arguments: emailController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Portal Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.school, size: 72, color: Colors.indigo),
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
            ),
            if (errorMessage != null) ...[
              const SizedBox(height: 12),
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : submitLogin,
              child: isLoading
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
