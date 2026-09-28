// Copy and rows from `.design-src/Client_Confirmation.dc.html`, verbatim.

class ConfirmationDetail {
  const ConfirmationDetail(this.label, this.value);

  final String label;
  final String value;
}

class Confirmation {
  const Confirmation({
    required this.title,
    required this.subtitle,
    required this.details,
    required this.amountLabel,
    required this.amountValue,
    required this.footnote,
    required this.primaryLabel,
    required this.secondaryLabel,
  });

  final String title;
  final String subtitle;
  final List<ConfirmationDetail> details;
  final String amountLabel;
  final String amountValue;
  final String footnote;
  final String primaryLabel;
  final String secondaryLabel;
}

const kConfirmationDetails = [
  ConfirmationDetail('Provider', 'Patricia Glam Studio'),
  ConfirmationDetail('Service', 'Bridal makeup, full glam'),
  ConfirmationDetail('When', 'Wed 26 Aug, 12:00 pm'),
];

const kConfirmation = Confirmation(
  title: 'Booking confirmed',
  subtitle: "We've sent a WhatsApp confirmation to your number.",
  details: kConfirmationDetails,
  amountLabel: 'Amount held',
  amountValue: 'UGX 206,000',
  footnote:
      "Free cancellation up to 24 hours before. If your provider cancels or doesn't show, you're refunded automatically.",
  primaryLabel: 'View booking',
  secondaryLabel: 'Add to calendar',
);
