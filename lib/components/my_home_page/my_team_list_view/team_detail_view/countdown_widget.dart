import 'dart:async';
import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final DateTime startTime;

  const CountdownWidget({Key? key, required this.startTime}) : super(key: key);

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Timer _timer;
  late Duration _remainingTime =
      const Duration(hours: 24) - (DateTime.now().difference(widget.startTime));

  @override
  void initState() {
    super.initState();
    _remainingTime =
        Duration(hours: 24) - (DateTime.now().difference(widget.startTime));
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime -= Duration(seconds: 1);
        if (_remainingTime.inSeconds == 0) {
          timer.cancel();
          // Handle countdown completion
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: CircularProgressIndicator(
              value: _remainingTime.inSeconds /
                  (24 * 60 * 60), // Calculate progress
              strokeWidth: 6,
              backgroundColor: const Color(0xFFEBDDFF),
              color: const Color(0xFF68548E),
              strokeCap: StrokeCap.round,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Chip(
                avatar: Icon(Icons.hourglass_empty_outlined),
                label: Text('残り時間'),
              ),
              const SizedBox(height: 8),
              // Text(
              //   _formatDuration(_remainingTime),
              //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 64,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[100], // 灰色の背景
                      borderRadius: BorderRadius.circular(10), // 角丸
                    ),
                    child: Center(
                      child: Text(_formatDurationHours(_remainingTime),
                          style: const TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const Text(':',
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                  Container(
                    width: 64,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[100], // 灰色の背景
                      borderRadius: BorderRadius.circular(10), // 角丸
                    ),
                    child: Center(
                      child: Text(_formatDurationMinutes(_remainingTime),
                          style: const TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  String _formatDurationHours(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    return "$twoDigitHours";
  }

  String _formatDurationMinutes(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "$twoDigitMinutes";
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
