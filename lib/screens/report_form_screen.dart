
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

enum ReportUiState { idle, loading, success, empty, error }

class ReportFormScreen extends StatefulWidget {
  const ReportFormScreen({super.key});

  @override
  State<ReportFormScreen> createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  ReportUiState _uiState = ReportUiState.idle;
  bool _simulateFailure = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> submitReport() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _uiState = ReportUiState.loading;
    });

    try {
      // Simulate an asynchronous request.
      await Future<void>.delayed(
        const Duration(seconds: 3),
      );

      if (_simulateFailure) {
        throw Exception('Simulated failure');
      }

      if (!mounted) return;

      setState(() {
        _uiState = ReportUiState.success;
      });
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _uiState = ReportUiState.error;
      });
    }
  }

  void resetForm() {
    _titleController.clear();
    _descriptionController.clear();

    setState(() {
      _uiState = ReportUiState.idle;
      _simulateFailure = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit a Report'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.restaurant_menu,
                  size: 48,
                  color: Color(0xFF245C43),
                ),
                const SizedBox(height: 16),
                const Text(
                  'LutoReco Feedback Report',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF245C43),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Report a problem or share feedback '
                  'about your LutoReco experience.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),

                if (_uiState == ReportUiState.idle ||
                    _uiState == ReportUiState.loading) ...[
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextField(
                          label: 'Report Title',
                          controller: _titleController,
                          hintText: 'Enter the report title',
                          prefixIcon: Icons.title,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty) {
                              return 'Please enter a report title.';
                            }
                            if (value.trim().length < 3) {
                              return 'Title must be at least 3 characters.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          label: 'Description',
                          controller: _descriptionController,
                          hintText: 'Describe the issue or feedback',
                          prefixIcon: Icons.description_outlined,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty) {
                              return 'Please enter a description.';
                            }
                            if (value.trim().length < 10) {
                              return 'Description must be at least 10 characters.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        AppButton(
                          label: 'Submit Report',
                          icon: Icons.send,
                          isLoading:
                              _uiState == ReportUiState.loading,
                          onPressed: _uiState ==
                                  ReportUiState.loading
                              ? null
                              : submitReport,
                        ),
                      ],
                    ),
                  ),
                ],

                if (_uiState == ReportUiState.loading) ...[
                  const SizedBox(height: 20),
                  const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(
                          color: Color(0xFF245C43),
                        ),
                        SizedBox(height: 12),
                        Text('Submitting report... Please wait.'),
                      ],
                    ),
                  ),
                ],

                if (_uiState == ReportUiState.success)
                  _buildMessage(
                    icon: Icons.check_circle_outline,
                    title: 'Report Submitted Successfully!',
                    message:
                        'Your report was processed by the demo. '
                        'No database record was saved.',
                    color: Colors.green,
                    actionLabel: 'Submit Another Report',
                    onAction: resetForm,
                  ),

                if (_uiState == ReportUiState.empty)
                  _buildMessage(
                    icon: Icons.inbox_outlined,
                    title: 'No Reports Available',
                    message:
                        'There are currently no reports to display.',
                    color: Colors.blueGrey,
                    actionLabel: 'Back to Form',
                    onAction: resetForm,
                  ),

                if (_uiState == ReportUiState.error)
                  _buildMessage(
                    icon: Icons.error_outline,
                    title: 'Submission Failed',
                    message:
                        'A simulated error occurred. '
                        'Please retry or correct your information.',
                    color: Colors.red,
                    actionLabel: 'Retry',
                    onAction: submitReport,
                  ),

                if (_uiState == ReportUiState.idle) ...[
                  const SizedBox(height: 20),
                  const Divider(),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Simulate submission failure'),
                    subtitle: const Text(
                      'Enable this to demonstrate the Error state.',
                    ),
                    value: _simulateFailure,
                    onChanged: (value) {
                      setState(() {
                        _simulateFailure = value;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _uiState = ReportUiState.empty;
                      });
                    },
                    icon: const Icon(Icons.inbox_outlined),
                    label: const Text('Preview Empty State'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessage({
    required IconData icon,
    required String title,
    required String message,
    required Color color,
    required String actionLabel,
    required VoidCallback onAction,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 54, color: color),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AppButton(
            label: actionLabel,
            icon: Icons.refresh,
            onPressed: onAction,
          ),
        ],
      ),
    );
  }
}