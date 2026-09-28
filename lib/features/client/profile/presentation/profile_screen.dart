import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../core/auth/auth_repository.dart';
import '../../../../core/user/user_repository.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_avatar.dart';
import '../../../../design/widgets/ax_bottom_nav.dart';
import '../../../../design/widgets/ax_primary_button.dart';

/// Client_Profile (`/profile`) — the bottom-nav Profile tab. No artboard
/// exists for it (BUILD_PLAN.md § Known gaps), so this is a deliberate
/// extension in the app's visual language: identity header plus sign-out.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseUser = ref.watch(authStateChangesProvider).value;
    final appUser = ref.watch(currentAppUserProvider).value;

    final name = (appUser?.displayName.trim().isNotEmpty ?? false)
        ? appUser!.displayName.trim()
        : (firebaseUser?.displayName?.trim().isNotEmpty ?? false)
            ? firebaseUser!.displayName!.trim()
            : 'Guest user';
    final subtitle = firebaseUser?.phoneNumber ??
        firebaseUser?.email ??
        'Browsing without an account';

    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AxSpace.s18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Profile',
                style: AxType.head(
                  AxType.h5,
                  weight: FontWeight.w800,
                  color: AxColors.brand,
                ),
              ),
              const SizedBox(height: AxSpace.s18),
              Container(
                padding: const EdgeInsets.all(AxSpace.s16),
                decoration: BoxDecoration(
                  color: AxColors.panelSoft,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AxSpace.s16),
                  ),
                  border: Border.all(color: AxColors.border),
                ),
                child: Row(
                  spacing: AxSpace.s14,
                  children: [
                    AxAvatar(
                      size: 56,
                      child: Text(
                        name.isEmpty ? '?' : name[0].toUpperCase(),
                        style: AxType.head(
                          AxType.title,
                          weight: FontWeight.w800,
                          color: AxColors.brand,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AxSpace.s2,
                        children: [
                          Text(
                            name,
                            style: AxType.text(
                              AxType.bodyLg,
                              weight: FontWeight.w700,
                              color: AxColors.textPrimary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            subtitle,
                            style: AxType.text(
                              AxType.labelSm,
                              color: AxColors.textMuted,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              AxPrimaryButton(
                label: 'Log out',
                style: AxButtonStyle.outline,
                onPressed: () async {
                  await ref.read(authRepositoryProvider).signOut();
                  if (context.mounted) context.go(AxRoutes.onboarding);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MediaQuery.withClampedTextScaling(
        maxScaleFactor: 1.2,
        child: AxBottomNav(
          current: AxNavItem.profile,
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
