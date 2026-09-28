import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_avatar.dart';
import '../../../../design/widgets/ax_bottom_nav.dart';
import '../../../../design/widgets/ax_card.dart';
import '../../../../design/widgets/ax_mobile_header.dart';
import '../data/fixtures.dart';

/// The Chat tab root (`/chat`). No artboard exists for a chat inbox
/// (BUILD_PLAN.md §Known gaps) — this is the documented minimal extension:
/// a token-only list of the artboard's conversations, each leading to
/// [ChatScreen] on tap. Not pixel-sourced; no golden.
class ChatInboxScreen extends StatelessWidget {
  const ChatInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AxMobileHeader(kChatInboxTitle, showBack: false),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  AxSpace.pageH,
                  AxSpace.s4,
                  AxSpace.pageH,
                  AxSpace.s18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AxSpace.s12,
                  children: [
                    for (final thread in kChatThreads)
                      _ConversationRow(thread: thread),
                  ],
                ),
              ),
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

class _ConversationRow extends StatelessWidget {
  const _ConversationRow({required this.thread});

  static const double _avatarSize = 44;
  static const double _avatarArtScale = 0.55;

  final ChatThread thread;

  @override
  Widget build(BuildContext context) {
    return AxCard(
      radius: AxRadius.tile,
      padding: const EdgeInsets.all(AxSpace.s12),
      onTap: () => context.go('${AxRoutes.chat}/${thread.id}'),
      child: Row(
        spacing: AxSpace.s12,
        children: [
          AxAvatar(
            size: _avatarSize,
            radius: AxRadius.card,
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
              spacing: AxSpace.s3,
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
                  thread.lastMessageText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AxType.text(
                    AxType.caption,
                    color: AxColors.textSubtle,
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
