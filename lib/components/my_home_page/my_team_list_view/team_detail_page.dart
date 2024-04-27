import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project2_mobile/models/team.dart';
import 'package:project2_mobile/utils/fetch_team_detail.dart';


class TeamDetailPage extends StatelessWidget {
  final Team team;
  final Function changeIsDetail;

  const TeamDetailPage({Key? key, required this.team, required this.changeIsDetail})
        : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: TeamDetailView(team: team, changeIsDetail: changeIsDetail));
  }
}

class TeamDetailView extends StatelessWidget {
  final Team team;
  final Function changeIsDetail;
  final Future<TeamDetail> teamDetail;

  TeamDetailView({Key? key, required this.team, required this.changeIsDetail})
      : teamDetail = fetchTeamDetail(team.id),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TeamDetail>(
      future: teamDetail,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        changeIsDetail(team);
                      },
                    ),
                    Text(
                      snapshot.data!.team.name,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('継続回数'),
                Text('${snapshot.data!.continuationCount}',
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                Text('${snapshot.data!.task.user}の番'),
                const SizedBox(height: 20),
                CountdownTimer(targetDateTimeStr: snapshot.data!.task.createdAt),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FilledButton(
                              onPressed: () {}, child: const Text('完了して次の人にパス'))
                        ]))
              ],
            ),
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}

class CountdownTimer extends StatefulWidget {
    const CountdownTimer({Key? key, required this.targetDateTimeStr})
      : super(key: key);
  
  final String targetDateTimeStr;


  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Duration _duration;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    DateTime targetDateTime = DateTime.parse(widget.targetDateTimeStr);
    DateTime now = DateTime.now();
    _duration = targetDateTime.difference(now);
    if (_duration.isNegative) {
      _duration = Duration.zero;
    }
    startTimer();
  }

  void startTimer() {
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds > 0) {
          _duration = _duration - const Duration(seconds: 1);
        } else {
          _timer?.cancel(); // Stop the timer when it reaches 0
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text('残り時間'),
        Text(
          _formatDuration(_duration),
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

// Format the duration as a readable string
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitHours = twoDigits(duration.inHours);
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    _timer?.cancel(); // Always cancel the timer to prevent memory leaks
    super.dispose();
  }
}
