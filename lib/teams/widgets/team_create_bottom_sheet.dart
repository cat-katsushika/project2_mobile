import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project2_mobile/teams/view_models/my_team_list_provider.dart';


class TeamCreateBottomSheet extends ConsumerStatefulWidget {
  const TeamCreateBottomSheet({super.key});

  @override
  ConsumerState<TeamCreateBottomSheet> createState() => _TeamCreateBottomSheetState();
}

class _TeamCreateBottomSheetState extends ConsumerState<TeamCreateBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 40.0,
        right: 20.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              '新規チーム作成',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30.0),
            _buildTextFieldRow(
              context,
              icon: Icons.people,
              controller: _teamNameController,
              labelText: 'Team Name',
              validatorMessage: 'チーム名を入力してください',
            ),
            const SizedBox(height: 20.0),
            _buildTextFieldRow(
              context,
              icon: Icons.notes,
              controller: _descriptionController,
              labelText: 'Description',
              validatorMessage: 'チームの説明を入力してください',
            ),
            const SizedBox(height: 20.0),
            _buildSubmitButton(context),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldRow(
    BuildContext context, {
    required IconData icon,
    required TextEditingController controller,
    required String labelText,
    required String validatorMessage,
  }) {
    return Row(
      children: <Widget>[
        Icon(icon),
        const SizedBox(width: 20.0),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: labelText,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return validatorMessage;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 77,
          height: 40,
          child: FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ref.read(myTeamListProvider.notifier).createTeam(
                      name: _teamNameController.text,
                      description: _descriptionController.text,
                    );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: Text(
              '作成',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}