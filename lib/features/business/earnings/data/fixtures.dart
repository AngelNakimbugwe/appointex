/// Copy and rows from `.design-src/Biz_Earnings.dc.html`, verbatim.
library;

const String kPageTitle = 'Earnings';
const String kPayoutAccount = 'Payout account: MTN ··56';

/// `.th` row, in artboard order. Rendered uppercased (Rule 8 — CSS
/// `text-transform` has no Flutter equivalent).
const List<String> kColumns = [
  'Date',
  'Client & service',
  'Amount',
  'Commission',
  'Status',
];

/// One `.stat` tile of the summary row.
class EarningsStat {
  const EarningsStat({
    required this.label,
    required this.value,
    this.dark = false,
  });

  final String label;
  final String value;

  /// Whether this tile is the dark `#6B3F3A` "Next payout" tile.
  final bool dark;
}

const List<EarningsStat> kStats = [
  EarningsStat(
    label: 'Gross bookings (30 days)',
    value: 'UGX 3,240,000',
  ),
  EarningsStat(
    label: 'Appointex commission (9%)',
    value: 'UGX 291,600',
  ),
  EarningsStat(
    label: 'Net payout',
    value: 'UGX 2,948,400',
  ),
  EarningsStat(
    label: 'Next payout',
    value: 'Fri, 29 Aug',
    dark: true,
  ),
];

/// One payout `.row` of the table.
class PayoutEntry {
  const PayoutEntry({
    required this.date,
    required this.clientService,
    required this.amount,
    required this.commission,
    required this.released,
  });

  final String date;
  final String clientService;
  final String amount;
  final String commission;

  /// `Held` (pending colours) when false, `Released` (verified colours) when
  /// true — the `.pill` states of the Status column.
  final bool released;
}

const String kHeldLabel = 'Held';
const String kReleasedLabel = 'Released';

const List<PayoutEntry> kPayouts = [
  PayoutEntry(
    date: '26 Aug',
    clientService: 'Aisha K. · Everyday glam',
    amount: 'UGX 120,000',
    commission: 'UGX 10,800',
    released: false,
  ),
  PayoutEntry(
    date: '21 Aug',
    clientService: 'Fiona T. · Everyday glam',
    amount: 'UGX 140,000',
    commission: 'UGX 12,600',
    released: true,
  ),
  PayoutEntry(
    date: '18 Aug',
    clientService: 'Ruth M. · Photoshoot makeup',
    amount: 'UGX 160,000',
    commission: 'UGX 14,400',
    released: true,
  ),
  PayoutEntry(
    date: '14 Aug',
    clientService: 'Grace N. · Bridal makeup',
    amount: 'UGX 350,000',
    commission: 'UGX 31,500',
    released: true,
  ),
];

const String kFootnote =
    'Held funds are released to your mobile money account within 24 hours of '
    'the appointment being marked complete.';
