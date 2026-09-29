import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart' show AxIcons;
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_primary_button.dart';
import '../data/fixtures.dart';

/// Client_Checkout (`/checkout`) — the pay leg of the booking flow. The user
/// confirms where the appointment happens, reviews the itemised total
/// (rush and mobile fees included), picks a mobile-money wallet and confirms.
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, this.checkout = kCheckout});

  final Checkout checkout;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late int _selectedMethod =
      widget.checkout.methods.indexWhere((m) => m.selected);

  @override
  Widget build(BuildContext context) {
    final checkout = widget.checkout;
    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            _HeaderBar(
              title: checkout.title,
              onBack: () => context.canPop()
                  ? context.pop()
                  : context.go(AxRoutes.home),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AxSpace.s18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AxSpace.s14,
                  children: [
                    _LocationCard(
                      checkout: checkout,
                      onChange: () => context.go(AxRoutes.book),
                    ),
                    _CostCard(checkout: checkout),
                    _PaySection(
                      checkout: checkout,
                      selectedIndex: _selectedMethod,
                      onSelect: (index) =>
                          setState(() => _selectedMethod = index),
                    ),
                    _SecurityNotes(notes: checkout.notes),
                  ],
                ),
              ),
            ),
            _FooterBar(
              totalLabel: checkout.footerTotalLabel,
              totalAmount: checkout.footerTotalAmount,
              ctaLabel: checkout.ctaLabel,
              onCta: () => context.go(AxRoutes.confirmation),
            ),
          ],
        ),
      ),
    );
  }
}

/// Client_Checkout.dc.html line 18: `height:56px; gap:14px; padding:0 16px;
/// border-bottom:1px solid #ECE7DC`, back arrow + Manrope 16/700 title.
class _HeaderBar extends StatelessWidget {
  const _HeaderBar({required this.title, required this.onBack});

  static const double _height = 56; // Client_Checkout.dc.html:18

  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.symmetric(horizontal: AxSpace.s16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AxColors.border)),
      ),
      child: Row(
        spacing: AxSpace.s14,
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
          Text(
            title,
            style: AxType.head(AxType.title, color: AxColors.brand),
          ),
        ],
      ),
    );
  }
}

/// The escrow-tinted location strip — lines 24–33.
class _LocationCard extends StatelessWidget {
  const _LocationCard({required this.checkout, this.onChange});

  final Checkout checkout;
  final VoidCallback? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s14,
        vertical: AxSpace.s12,
      ),
      decoration: BoxDecoration(
        color: AxColors.escrowBg,
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.card)),
        border: Border.all(color: AxColors.escrowBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              spacing: AxSpace.s9,
              children: [
                const AxIcon(AxIcons.mapPin, size: 17, color: AxColors.escrow),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        checkout.locationTitle,
                        style: AxType.text(
                          AxType.labelSm,
                          weight: FontWeight.w700,
                          color: AxColors.escrowDeep,
                        ),
                      ),
                      Text(
                        checkout.locationDetail,
                        style: AxType.text(
                          AxType.micro,
                          color: AxColors.escrowMid,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onChange,
            child: Text(
              checkout.changeLabel,
              style: AxType.text(
                AxType.captionSm,
                weight: FontWeight.w700,
                color: AxColors.escrow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The itemised cost panel — lines 34–44.
class _CostCard extends StatelessWidget {
  const _CostCard({required this.checkout});

  final Checkout checkout;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AxSpace.s14),
      decoration: const BoxDecoration(
        color: AxColors.surfaceWarm,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Column(
        spacing: AxSpace.s9,
        children: [
          for (final line in checkout.costItems) _CostLine(line: line),
          const _Rule(),
          for (final line in checkout.costFees) _CostLine(line: line),
          const _Rule(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  checkout.costTotalLabel,
                  style: AxType.text(
                    AxType.body14,
                    weight: FontWeight.w800,
                    color: AxColors.brand,
                  ),
                ),
              ),
              Text(
                checkout.costTotalAmount,
                style: AxType.text(
                  AxType.body14,
                  weight: FontWeight.w800,
                  color: AxColors.brand,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CostLine extends StatelessWidget {
  const _CostLine({required this.line});

  final CheckoutLine line;

  @override
  Widget build(BuildContext context) {
    final color = line.color;
    final label = color == null
        ? Text(
            line.label,
            style: AxType.text(AxType.labelSm, color: AxColors.textPrimary),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AxSpace.s4,
            children: [
              AxIcon(line.icon!, size: 10, color: color),
              Flexible(
                child: Text(
                  line.label,
                  style: AxType.text(AxType.labelSm, color: color),
                ),
              ),
            ],
          );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: label),
        Flexible(
          child: Text(
            line.amount,
            style: AxType.text(
              AxType.labelSm,
              weight: color == null ? FontWeight.w600 : FontWeight.w700,
              color: color ?? AxColors.brand,
            ),
          ),
        ),
      ],
    );
  }
}

/// `height:1px; background:#E8E3D8; margin:2px 0` — lines 37, 42.
class _Rule extends StatelessWidget {
  const _Rule();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: AxSpace.s2),
      color: AxColors.borderSoft,
    );
  }
}

/// "Pay with" — wallet picker and number field, lines 46–64.
class _PaySection extends StatelessWidget {
  const _PaySection({
    required this.checkout,
    required this.selectedIndex,
    this.onSelect,
  });

  final Checkout checkout;
  final int selectedIndex;
  final ValueChanged<int>? onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s10,
      children: [
        Text(
          checkout.payWithLabel,
          style: AxType.head(AxType.bodySm, color: AxColors.brand),
        ),
        for (var i = 0; i < checkout.methods.length; i++)
          _MethodRow(
            method: checkout.methods[i],
            selected: i == selectedIndex,
            onTap: onSelect == null ? null : () => onSelect!(i),
          ),
        Padding(
          padding: const EdgeInsets.only(top: AxSpace.s2),
          child: _NumberField(
            label: checkout.numberLabel,
            value: checkout.numberValue,
          ),
        ),
      ],
    );
  }
}

class _MethodRow extends StatelessWidget {
  const _MethodRow({
    required this.method,
    required this.selected,
    this.onTap,
  });

  static const double _brandTileWidth = 34; // Client_Checkout.dc.html:49
  static const double _brandTileHeight = 24; // Client_Checkout.dc.html:49
  static const double _brandTileRadius = 5; // Client_Checkout.dc.html:49
  static const double _radioSize = 18; // Client_Checkout.dc.html:51

  final CheckoutPaymentMethod method;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AxSpace.s14,
          vertical: AxSpace.s13,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AxRadius.card)),
          border: Border.all(
            color: selected ? AxColors.brand : AxColors.borderStrong,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          spacing: AxSpace.s12,
          children: [
            Container(
              width: _brandTileWidth,
              height: _brandTileHeight,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: method.brandBackground,
                borderRadius:
                    const BorderRadius.all(Radius.circular(_brandTileRadius)),
              ),
              child: Text(
                method.brand,
                style: AxType.text(
                  method.brandSize,
                  weight: FontWeight.w800,
                  color: method.brandForeground,
                ),
              ),
            ),
            Expanded(
              child: Text(
                method.label,
                style: AxType.text(
                  AxType.label,
                  weight: FontWeight.w600,
                  color: selected ? AxColors.brand : AxColors.textPrimary,
                ),
              ),
            ),
            Container(
              width: _radioSize,
              height: _radioSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? AxColors.brand : AxColors.dividerMid,
                  width: selected ? 5.5 : 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The masked mobile-money number — lines 58–63.
class _NumberField extends StatelessWidget {
  const _NumberField({required this.label, required this.value});

  static const double _fieldHeight = 46; // Client_Checkout.dc.html:60

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s6,
      children: [
        Text(
          label,
          style: AxType.text(AxType.captionSm, color: AxColors.textSubtle),
        ),
        Container(
          height: _fieldHeight,
          padding: const EdgeInsets.symmetric(horizontal: AxSpace.s14),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(AxRadius.md)),
            border: Border.all(color: AxColors.borderStrong),
          ),
          child: Text(
            value,
            style: AxType.text(
              AxType.bodySm,
              weight: FontWeight.w600,
              color: AxColors.brand,
            ),
          ),
        ),
      ],
    );
  }
}

/// The escrow / protection notes — lines 66–75.
class _SecurityNotes extends StatelessWidget {
  const _SecurityNotes({required this.notes});

  final List<CheckoutNote> notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AxSpace.s12),
      decoration: const BoxDecoration(
        color: AxColors.surfaceWarm,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.md)),
      ),
      child: Column(
        spacing: AxSpace.s10,
        children: [
          for (final note in notes) _NoteRow(note: note),
        ],
      ),
    );
  }
}

class _NoteRow extends StatelessWidget {
  const _NoteRow({required this.note});

  final CheckoutNote note;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s8,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AxSpace.s2),
          child: AxIcon(note.icon, size: 14, color: note.color),
        ),
        Expanded(
          child: Text(
            note.text,
            style: AxType.text(
              AxType.captionSm,
              color: AxColors.textBody,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

/// The fixed total + confirm bar — lines 78–86.
class _FooterBar extends StatelessWidget {
  const _FooterBar({
    required this.totalLabel,
    required this.totalAmount,
    required this.ctaLabel,
    required this.onCta,
  });

  /// Client_Checkout.dc.html line 81: `font-size:18px` — no AxType step.
  static const double _totalSize = 18;

  final String totalLabel;
  final String totalAmount;
  final String ctaLabel;
  final VoidCallback onCta;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(AxSpace.s18, AxSpace.s14, AxSpace.s18, AxSpace.s22),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AxColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AxSpace.s12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                totalLabel,
                style: AxType.text(AxType.labelSm, color: AxColors.textSubtle),
              ),
              Text(
                totalAmount,
                style: AxType.head(
                  _totalSize,
                  weight: FontWeight.w800,
                  color: AxColors.brand,
                ),
              ),
            ],
          ),
          AxPrimaryButton(
            label: ctaLabel,
            labelSize: AxType.body,
            onPressed: onCta,
          ),
        ],
      ),
    );
  }
}
