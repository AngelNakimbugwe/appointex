/// Copy and rows from `.design-src/Biz_Services.dc.html`, verbatim.
library;

const String kPageTitle = 'Services';
const String kAddServiceLabel = '+ Add service';

/// `.th` row, in artboard order. Rendered uppercased (Rule 8 — CSS
/// `text-transform` has no Flutter equivalent).
const List<String> kColumns = [
  'Service',
  'Category',
  'Duration',
  'Price',
  'Active',
];

/// One service `.row` of the table.
class ServiceRow {
  const ServiceRow({
    required this.name,
    required this.category,
    required this.duration,
    required this.price,
    required this.active,
  });

  final String name;
  final String category;
  final String duration;
  final String price;

  /// The state of the Active column's `.toggle` (`#6B3F3A` when true,
  /// `#D7D1C2` when false).
  final bool active;
}

const List<ServiceRow> kServices = [
  ServiceRow(
    name: 'Everyday glam',
    category: 'Makeup',
    duration: '45 min',
    price: 'UGX 120,000',
    active: true,
  ),
  ServiceRow(
    name: 'Bridal makeup, full glam',
    category: 'Makeup',
    duration: '90 min',
    price: 'UGX 350,000',
    active: true,
  ),
  ServiceRow(
    name: 'Photoshoot makeup',
    category: 'Makeup',
    duration: '60 min',
    price: 'UGX 160,000',
    active: true,
  ),
  ServiceRow(
    name: 'Makeup trial session',
    category: 'Makeup',
    duration: '45 min',
    price: 'UGX 90,000',
    active: false,
  ),
  ServiceRow(
    name: 'Wedding party glam (group)',
    category: 'Makeup',
    duration: '3 to 5 hrs',
    price: 'From UGX 600,000',
    active: true,
  ),
];
