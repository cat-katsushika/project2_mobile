import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/providers/my_team_list_provider.dart';


class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return const BottomSheetForm();
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

class BottomSheetForm extends ConsumerStatefulWidget {
  const BottomSheetForm({super.key});

  @override
  ConsumerState<BottomSheetForm> createState() => _BottomSheetFormState();
}

class _BottomSheetFormState extends ConsumerState<BottomSheetForm> {
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
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  const Icon(Icons.people),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _teamNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Team Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'チーム名を入力してください';
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const Icon(Icons.notes),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'チームの説明を入力してください';
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 160.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: 77,
                    height: 40,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ref.read(myTeamListProvider.notifier).createTeam(name: _teamNameController.text, description: _descriptionController.text);
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
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ));
  }
}
