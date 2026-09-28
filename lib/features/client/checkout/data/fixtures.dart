import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_type.dart';

/// Copy and rows from `.design-src/Client_Checkout.dc.html`, verbatim.

class CheckoutLine {
  const CheckoutLine({
    required this.label,
    required this.amount,
    this.icon,
    this.color,
  });

  final String label;
  final String amount;

  /// 10px inline icon shown before the label (bolt / map-pin fee lines).
  final String? icon;

  /// Label + amount tint; null uses the default ink/brand pair.
  final Color? color;
}

class CheckoutPaymentMethod {
  const CheckoutPaymentMethod({
    required this.brand,
    required this.brandSize,
    required this.brandBackground,
    required this.brandForeground,
    required this.label,
    this.selected = false,
  });

  /// Brand tile text — "MTN" / "Airtel".
  final String brand;

  /// Brand tile font size. Airtel is 8px, which has no AxType step.
  final double brandSize;

  final Color brandBackground;
  final Color brandForeground;

  /// Method label next to the tile.
  final String label;

  final bool selected;
}

class CheckoutNote {
  const CheckoutNote({required this.icon, required this.color, required this.text});

  final String icon;
  final Color color;
  final String text;
}

class Checkout {
  const Checkout({
    required this.title,
    required this.locationTitle,
    required this.locationDetail,
    required this.changeLabel,
    required this.costItems,
    required this.costFees,
    required this.costTotalLabel,
    required this.costTotalAmount,
    required this.payWithLabel,
    required this.methods,
    required this.numberLabel,
    required this.numberValue,
    required this.notes,
    required this.footerTotalLabel,
    required this.footerTotalAmount,
    required this.ctaLabel,
  });

  final String title;
  final String locationTitle;
  final String locationDetail;
  final String changeLabel;
  final List<CheckoutLine> costItems;
  final List<CheckoutLine> costFees;
  final String costTotalLabel;
  final String costTotalAmount;
  final String payWithLabel;
  final List<CheckoutPaymentMethod> methods;
  final String numberLabel;
  final String numberValue;
  final List<CheckoutNote> notes;
  final String footerTotalLabel;
  final String footerTotalAmount;
  final String ctaLabel;
}

const kCheckoutCostItems = [
  CheckoutLine(label: 'Bridal makeup, full glam', amount: 'UGX 180,000'),
  CheckoutLine(label: 'Lashes add-on', amount: 'UGX 20,000'),
];

const kCheckoutCostFees = [
  CheckoutLine(label: 'Subtotal', amount: 'UGX 200,000'),
  CheckoutLine(label: 'Service fee (3%)', amount: 'UGX 6,000'),
  CheckoutLine(
    label: 'Urgent booking fee (25%)',
    amount: 'UGX 50,000',
    icon: AxIcons.boltFill,
    color: AxColors.urgentTo,
  ),
  CheckoutLine(
    label: 'Mobile service fee (5%)',
    amount: 'UGX 10,000',
    icon: AxIcons.mapPin26,
    color: AxColors.escrow,
  ),
];

const kCheckoutMethods = [
  CheckoutPaymentMethod(
    brand: 'MTN',
    brandSize: AxType.nano9,
    brandBackground: AxColors.mtn,
    brandForeground: AxColors.brand,
    label: 'MTN Mobile Money',
    selected: true,
  ),
  // Client_Checkout.dc.html line 54: `font-size:8px` — no AxType step exists.
  CheckoutPaymentMethod(
    brand: 'Airtel',
    brandSize: 8,
    brandBackground: AxColors.airtel,
    brandForeground: AxColors.surface,
    label: 'Airtel Money',
  ),
];

const kCheckoutNotes = [
  CheckoutNote(
    icon: AxIcons.lock20,
    color: AxColors.brand,
    text:
        'Held securely by Appointex until the appointment is marked complete. We never ask for or store your mobile money PIN.',
  ),
  CheckoutNote(
    icon: AxIcons.shield,
    color: AxColors.verified,
    text:
        'Buyer protection and verified reviews apply only to bookings paid in the app.',
  ),
];

const kCheckout = Checkout(
  title: 'Checkout',
  locationTitle: 'At my location',
  locationDetail: 'Naguru, Kampala · details sent to provider after booking',
  changeLabel: 'Change',
  costItems: kCheckoutCostItems,
  costFees: kCheckoutCostFees,
  costTotalLabel: 'Total',
  costTotalAmount: 'UGX 266,000',
  payWithLabel: 'Pay with',
  methods: kCheckoutMethods,
  numberLabel: 'Mobile money number',
  numberValue: '+256 772 ••• 145',
  notes: kCheckoutNotes,
  footerTotalLabel: 'Total',
  footerTotalAmount: 'UGX 266,000',
  ctaLabel: 'Confirm payment',
);
