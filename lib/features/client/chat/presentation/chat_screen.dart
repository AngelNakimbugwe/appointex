import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_avatar.dart';
import '../../../../design/widgets/ax_bottom_nav.dart';
import '../data/fixtures.dart';

/// Client_Chat — one chat thread (`/chat/:threadId`): fixed 60 px header with
/// the provider avatar and presence, scrolling message list whose bubbles cap
/// at 78% of the content width (Tier 3 `.bubble`), and a fixed composer above
/// the bottom nav.
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, this.threadId});

  /// Resolves the thread against [kChatThreads]; falls back to the first
  /// thread so the route builder can pass `state.pathParameters['threadId']`.
  final String? threadId;

  ChatThread get _thread => kChatThreads.firstWhere(
        (thread) => thread.id == threadId,
        orElse: () => kChatThreads.first,
      );

  @override
  Widget build(BuildContext context) {
    final thread = _thread;
    return Scaffold(
      backgroundColor: AxColors.surfaceBright,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ChatHeader(
              thread: thread,
              onBack: () => context.canPop()
                  ? context.pop()
                  : context.go(AxRoutes.chat),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AxSpace.s16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final bubbleMaxWidth = constraints.maxWidth * 0.78;
                    final noticeMaxWidth = constraints.maxWidth * 0.88;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: AxSpace.s10,
                      children: [
                        for (final entry in thread.entries)
                          if (entry.isNotice)
                            _BlockedNotice(
                              text: entry.text,
                              maxWidth: noticeMaxWidth,
                            )
                          else
                            _MessageBubble(
                              text: entry.text,
                              outgoing: entry.outgoing,
                              maxWidth: bubbleMaxWidth,
                            ),
                      ],
                    );
                  },
                ),
              ),
            ),
            _Composer(
              note: kChatComposerNote,
              placeholder: kChatComposerPlaceholder,
            ),
          ],
        ),
      ),
      bottomNavigationBar: MediaQuery.withClampedTextScaling(
        maxScaleFactor: 1.2,
        child: AxBottomNav(
          current: AxNavItem.chat,
          onTap: (item) {
            switch (item) {
              case AxNavItem.home:
                context.go(AxRoutes.home);
              case AxNavItem.bookings:
                context.go(AxRoutes.bookings);
              case AxNavItem.chat:
                context.go(AxRoutes.chat);
              case AxNavItem.profile:
                context.go(AxRoutes.profile);
            }
          },
        ),
      ),
    );
  }
}

class _ChatHeader extends StatelessWidget {
  const _ChatHeader({required this.thread, this.onBack});

  static const double _height = 60; // height:60px — Client_Chat.dc.html line 19
  static const double _avatarSize = 34; // width/height:34px — Client_Chat.dc.html line 21
  static const double _avatarArtScale = 0.55; // svg 55%×55% — Client_Chat.dc.html line 21

  final ChatThread thread;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.symmetric(horizontal: AxSpace.s16),
      decoration: const BoxDecoration(
        color: AxColors.surface,
        border: Border(bottom: BorderSide(color: AxColors.border)),
      ),
      child: Row(
        spacing: AxSpace.s12,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onBack,
            child: const AxIcon(
              AxIcons.chevronLeft,
              size: 19,
              color: AxColors.brand,
            ),
          ),
          AxAvatar(
            size: _avatarSize,
            radius: _avatarSize / 2,
            gradient: thread.gradient,
            child: AxIcon(
              AxIcons.personFill,
              size: _avatarSize * _avatarArtScale,
              color: AxColors.surface,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  thread.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AxType.text(
                    AxType.bodySm,
                    weight: FontWeight.w700,
                    color: AxColors.brand,
                  ),
                ),
                Text(
                  thread.presenceLabel,
                  style: AxType.text(
                    AxType.micro,
                    color: AxColors.verifiedSoft,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.text,
    required this.outgoing,
    required this.maxWidth,
  });

  static const double _radius = 15; // .bubble border-radius:15px — Client_Chat.dc.html line 14
  static const double _tailRadius = 5; // border-bottom-*-radius:5px — Client_Chat.dc.html lines 30/33

  final String text;
  final bool outgoing;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: outgoing
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AxSpace.s13,
            vertical: AxSpace.s10,
          ),
          decoration: BoxDecoration(
            color: outgoing ? AxColors.brand : AxColors.panelNeutral,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(_radius),
              topRight: const Radius.circular(_radius),
              bottomLeft: Radius.circular(outgoing ? _radius : _tailRadius),
              bottomRight: Radius.circular(outgoing ? _tailRadius : _radius),
            ),
          ),
          child: Text(
            text,
            style: AxType.text(
              AxType.label,
              height: 1.45,
              color: outgoing ? AxColors.surface : AxColors.textStrong,
            ),
          ),
        ),
      ),
    );
  }
}

class _BlockedNotice extends StatelessWidget {
  const _BlockedNotice({required this.text, required this.maxWidth});

  static const double _radius = 20; // border-radius:20px — Client_Chat.dc.html line 39
  static const double _verticalMargin = 4; // margin:4px 0 — Client_Chat.dc.html line 39

  final String text;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: _verticalMargin),
      child: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AxSpace.s14,
              vertical: AxSpace.s8,
            ),
            decoration: BoxDecoration(
              color: AxColors.pendingBg,
              border: Border.all(color: AxColors.salmon),
              borderRadius: const BorderRadius.all(Radius.circular(_radius)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: AxSpace.s7,
              children: [
                const AxIcon(AxIcons.lock, size: 13, color: AxColors.pending),
                Flexible(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: AxType.text(
                      AxType.micro,
                      height: 1.4,
                      color: AxColors.brandMid,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Composer extends StatefulWidget {
  const _Composer({required this.note, required this.placeholder});

  static const double _fieldHeight = 42; // height:42px — Client_Chat.dc.html line 55
  static const double _sendButtonSize = 42; // width/height:42px — Client_Chat.dc.html line 58

  final String note;
  final String placeholder;

  @override
  State<_Composer> createState() => _ComposerState();
}

class _ComposerState extends State<_Composer> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    if (_controller.text.trim().isEmpty) return;
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AxSpace.s16,
        AxSpace.s8,
        AxSpace.s16,
        AxSpace.s16,
      ),
      decoration: const BoxDecoration(
        color: AxColors.surface,
        border: Border(top: BorderSide(color: AxColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AxSpace.s8,
        children: [
          Row(
            spacing: AxSpace.s5,
            children: [
              const AxIcon(AxIcons.lock24, size: 11, color: AxColors.textFaint),
              Expanded(
                child: Text(
                  widget.note,
                  style: AxType.text(AxType.microSm, color: AxColors.textFaint),
                ),
              ),
            ],
          ),
          Row(
            spacing: AxSpace.s10,
            children: [
              Expanded(
                child: Container(
                  height: _Composer._fieldHeight,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AxSpace.s16,
                  ),
                  decoration: const ShapeDecoration(
                    color: AxColors.panelNeutral,
                    shape: StadiumBorder(),
                  ),
                  child: TextField(
                    controller: _controller,
                    cursorColor: AxColors.brand,
                    style: AxType.text(
                      AxType.labelSm,
                      color: AxColors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 11.5,
                      ),
                      hintText: widget.placeholder,
                      hintStyle: AxType.text(
                        AxType.labelSm,
                        color: AxColors.textFaint,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _send,
                child: Container(
                  width: _Composer._sendButtonSize,
                  height: _Composer._sendButtonSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AxColors.salmon,
                  ),
                  child: const Center(
                    child: AxIcon(AxIcons.send, size: 16, color: AxColors.brand),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
