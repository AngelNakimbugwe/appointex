/// Copy and rows from `.design-src/Biz_Clients.dc.html`, verbatim.
library;

import 'package:flutter/material.dart';

import '../../../../design/tokens/ax_gradients.dart';

const String kPageTitle = 'Clients';
const String kSearchHint = 'Search clients';

/// `.th` row, in artboard order. Rendered uppercased (Rule 8 — CSS
/// `text-transform` has no Flutter equivalent).
const List<String> kColumns = [
  'Client',
  'Last visit',
  'Visits',
  'Total spend',
  'Favourite service',
];

/// One client `.row` of the table.
class ClientRecord {
  const ClientRecord({
    required this.name,
    required this.lastVisit,
    required this.visits,
    required this.totalSpend,
    required this.favouriteService,
    required this.gradient,
  });

  final String name;
  final String lastVisit;
  final String visits;
  final String totalSpend;
  final String favouriteService;

  /// The avatar's `linear-gradient(135deg,…)`.
  final Gradient gradient;
}

const List<ClientRecord> kClients = [
  ClientRecord(
    name: 'Aisha Kirabo',
    lastVisit: '26 Aug 2026',
    visits: '7',
    totalSpend: 'UGX 980,000',
    favouriteService: 'Everyday glam',
    gradient: AxGradients.avatarBlush,
  ),
  ClientRecord(
    name: 'Diana Nansubuga',
    lastVisit: '26 Aug 2026',
    visits: '2',
    totalSpend: 'UGX 410,000',
    favouriteService: 'Bridal makeup, full glam',
    gradient: AxGradients.avatarPale,
  ),
  ClientRecord(
    name: 'Ruth Mirembe',
    lastVisit: '26 Aug 2026',
    visits: '4',
    totalSpend: 'UGX 640,000',
    favouriteService: 'Photoshoot makeup',
    gradient: AxGradients.avatarSand,
  ),
  ClientRecord(
    name: 'Fiona Tumusiime',
    lastVisit: '21 Aug 2026',
    visits: '11',
    totalSpend: 'UGX 1,540,000',
    favouriteService: 'Everyday glam',
    gradient: AxGradients.avatarRose,
  ),
  ClientRecord(
    name: 'Grace Namono',
    lastVisit: '29 Aug 2026',
    visits: '1',
    totalSpend: 'UGX 350,000',
    favouriteService: 'Wedding party glam',
    gradient: AxGradients.avatarSandBlush,
  ),
];
