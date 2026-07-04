import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../widgets/privacy_note_card.dart';
import '../widgets/profile_strength_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _idController;
  String? _department;
  String _gender = 'Female';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _nameController = TextEditingController(text: MockData.profileName);
    _idController = TextEditingController(text: MockData.studentId);
    _department = MockData.departments.first;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'STUDENT ACCOUNT',
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: AppColors.accentBlue,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Alex Harrison',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 4),
              const Text(
                'Computer Science & Engineering · Class of 2025',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.tabHighlight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified_user_rounded, size: 16, color: AppColors.primary),
                    SizedBox(width: 6),
                    Text(
                      'Verified Student',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        TabBar(
          controller: _tabController,
          labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
          tabs: const [
            Tab(text: 'Personal Info'),
            Tab(text: 'My Listings'),
            Tab(text: 'Settings'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _PersonalInfoTab(
                formKey: _formKey,
                nameController: _nameController,
                idController: _idController,
                department: _department,
                onDepartmentChanged: (v) => setState(() => _department = v),
                gender: _gender,
                onGenderChanged: (v) => setState(() => _gender = v),
              ),
              const _PlaceholderTab(message: 'Your marketplace listings will appear here.'),
              const _PlaceholderTab(message: 'Notification and app preferences.'),
            ],
          ),
        ),
      ],
    );
  }
}

class _PersonalInfoTab extends StatelessWidget {
  const _PersonalInfoTab({
    required this.formKey,
    required this.nameController,
    required this.idController,
    required this.department,
    required this.onDepartmentChanged,
    required this.gender,
    required this.onGenderChanged,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController idController;
  final String? department;
  final ValueChanged<String?> onDepartmentChanged;
  final String gender;
  final ValueChanged<String> onGenderChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 1,
            shadowColor: Colors.black12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.badge_outlined, color: AppColors.primary),
                        SizedBox(width: 8),
                        Text(
                          'Profile Identity',
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: AppColors.primary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Full Name',
                      style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textSecondary, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return 'Required';
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Student ID',
                      style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textSecondary, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: idController,
                      decoration: const InputDecoration(),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return 'Required';
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Department Selection',
                      style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textSecondary, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: department,
                      decoration: const InputDecoration(),
                      items: MockData.departments
                          .map((d) => DropdownMenuItem<String>(value: d, child: Text(d)))
                          .toList(),
                      onChanged: onDepartmentChanged,
                      validator: (v) => v == null ? 'Select a department' : null,
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Gender Identification',
                      style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.textPrimary, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                title: const Text('Male'),
                                value: 'Male',
                                groupValue: gender,
                                onChanged: (v) {
                                  if (v != null) onGenderChanged(v);
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                title: const Text('Female'),
                                value: 'Female',
                                groupValue: gender,
                                onChanged: (v) {
                                  if (v != null) onGenderChanged(v);
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                title: const Text('Non-binary'),
                                value: 'Non-binary',
                                groupValue: gender,
                                onChanged: (v) {
                                  if (v != null) onGenderChanged(v);
                                },
                              ),
                            ),
                            const Expanded(child: SizedBox.shrink()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    formKey.currentState?.validate();
                  },
                  child: const Text('Save Changes'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const ProfileStrengthCard(percent: 0.85),
          const SizedBox(height: 14),
          const PrivacyNoteCard(),
        ],
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
      child: Text(message, style: const TextStyle(color: AppColors.textSecondary, height: 1.4)),
    );
  }
}