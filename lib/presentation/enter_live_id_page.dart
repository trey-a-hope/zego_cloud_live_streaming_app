import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zego_cloud_live_streaming_app/presentation/live_page.dart';

class EnterLiveIdPage extends StatefulWidget {
  final bool isHost;

  const EnterLiveIdPage({
    required this.isHost,
    super.key,
  });

  @override
  State<EnterLiveIdPage> createState() => _EnterLiveIdPageState();
}

class _EnterLiveIdPageState extends State<EnterLiveIdPage> {
  final TextEditingController _liveIdController = TextEditingController();

  @override
  void dispose() {
    _liveIdController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final liveId = _liveIdController.text;

    if (liveId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        const SnackBar(content: Text('Please enter a live stream ID')),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LivePage(
            liveId: liveId,
            isHost: widget.isHost,
          ),
        ),
      );
      _liveIdController.clear();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Enter Live ID ${widget.isHost ? 'To Start' : 'To Watch'}',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _liveIdController,
                  decoration: const InputDecoration(
                    hintText: 'Live Stream ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                const Gap(16),
                ElevatedButton(
                  onPressed: _handleSubmit,
                  child: Text(widget.isHost ? 'Start' : 'Watch'),
                ),
              ],
            ),
          ),
        ),
      );
}
