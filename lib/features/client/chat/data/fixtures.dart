import 'package:flutter/material.dart';

import '../../../../design/tokens/ax_gradients.dart';

/// One entry in a thread: a message bubble or the system "message blocked"
/// notice. [outgoing] matches the artboard alignment — outgoing bubbles are
/// right-aligned on the brand background.
class ChatEntry {
  const ChatEntry.message({required this.text, this.outgoing = false})
      : isNotice = false;

  const ChatEntry.notice({required this.text})
      : outgoing = false,
        isNotice = true;

  final String text;
  final bool outgoing;
  final bool isNotice;
}

/// A conversation thread. The artboard shows exactly one — Patricia Glam
/// Studio.
class ChatThread {
  const ChatThread({
    required this.id,
    required this.name,
    required this.presenceLabel,
    required this.gradient,
    required this.entries,
  });

  final String id;
  final String name;
  final String presenceLabel;
  final Gradient gradient;
  final List<ChatEntry> entries;

  String get lastMessageText =>
      entries.lastWhere((entry) => !entry.isNotice).text;
}

const String kChatComposerNote = 'Numbers and contact info are blocked before checkout';
const String kChatComposerPlaceholder = 'Message Patricia…';
const String kChatInboxTitle = 'Chat';

const List<ChatThread> kChatThreads = [
  ChatThread(
    id: 'patricia-glam-studio',
    name: 'Patricia Glam Studio',
    presenceLabel: 'Online',
    gradient: AxGradients.avatarBlush,
    entries: [
      ChatEntry.message(
        text: 'Hi! Do you have anything free on the 26th for bridal makeup?',
      ),
      ChatEntry.message(
        text: "Yes, 12:00 pm is open. I can also do a trial the week before if you'd like.",
        outgoing: true,
      ),
      ChatEntry.message(
        text: "That'd be great. Easier if we just sort the rest on WhatsApp, call me on 0772…",
      ),
      ChatEntry.notice(
        text: 'Message blocked — phone numbers and contact details are shared automatically once your deposit is paid',
      ),
      ChatEntry.message(
        text: "Ah okay, makes sense. I'll just book it here then.",
      ),
    ],
  ),
];
