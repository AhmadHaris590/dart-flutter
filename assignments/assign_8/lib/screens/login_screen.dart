import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/ubit_logo.dart';
import 'main_shell.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your university email';
    }
    final email = value.trim();
    final regex = RegExp(r'^[\w.\-+]+@([\w-]+\.)+[\w-]{2,}$');
    if (!regex.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  void _onLogin() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const MainShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 24, offset: Offset(0, 8)),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Align(alignment: Alignment.centerLeft, child: UbitLogo()),
                          const SizedBox(height: 24),
                          const Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Please enter your details to sign in.',
                            style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'University Email',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: _validateEmail,
                            decoration: const InputDecoration(
                              hintText: 'name@university.edu',
                              hintStyle: TextStyle(color: AppColors.textMuted),
                              prefixIcon: Icon(Icons.mail_outline_rounded, color: AppColors.textSecondary),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textSecondary,
                                  fontSize: 13,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {},
                                child: const Text('Forgot Password?'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _PasswordFormField(
                            controller: _passwordController,
                            validator: _validatePassword,
                          ),
                          const SizedBox(height: 8),
                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'Remember Me',
                              style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                            ),
                            value: _rememberMe,
                            onChanged: (v) => setState(() => _rememberMe = v ?? false),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: _onLogin,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Login', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward_rounded, size: 20),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            children: [
                              const Text('Don\'t have an account?', style: TextStyle(color: AppColors.textSecondary)),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Create an account', style: TextStyle(fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Column(
                    children: [
                      Text(
                        '© 2024 UBIT Hub',
                        style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                      ),
                      const SizedBox(height: 6),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 4,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Text('Privacy Policy', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                          ),
                          Text('·', style: TextStyle(color: Colors.grey.shade400)),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Text('Terms of Service', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.tabHighlight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(color: Color(0xFF22C55E), shape: BoxShape.circle),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'SYSTEM STATUS: ONLINE',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary.withOpacity(0.85),
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class _PasswordFormField extends StatefulWidget {
  const _PasswordFormField({
    required this.controller,
    required this.validator,
  });

  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  @override
  State<_PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<_PasswordFormField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppColors.textSecondary),
        suffixIcon: IconButton(
          tooltip: _obscure ? 'Show password' : 'Hide password',
          onPressed: () => setState(() => _obscure = !_obscure),
          icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: AppColors.textSecondary),
        ),
      ),
    );
  }
}