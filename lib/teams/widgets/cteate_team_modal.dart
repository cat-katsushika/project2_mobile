import 'package:flutter/material.dart';

class CreateTeamModal extends StatefulWidget {
  const CreateTeamModal({super.key});

  @override
  State<CreateTeamModal> createState() => _CreateTeamModalState();
}

class _CreateTeamModalState extends State<CreateTeamModal> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomSpace),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min, // コンテンツの高さに応じて縮小
            children: <Widget>[
              const Text('新しいチームを作成する'),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'チームの名前',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'チーム名を入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'チーム説明',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'チームの説明を入力してください';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // チーム作成処理
                      
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('作成'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showCreateTeamModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true, // ドラッグハンドルを表示
    isScrollControlled: true, // これによりモーダルシートが全画面に広がる
    builder: (BuildContext context) {
      return const CreateTeamModal(); // 上記で作成したウィジェットを表示
    },
  );
}
