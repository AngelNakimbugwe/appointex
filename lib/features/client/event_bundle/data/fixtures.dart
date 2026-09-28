import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_gradients.dart';

/// Copy and rows from `.design-src/Client_EventBundle.dc.html`, verbatim.

class EventBundleType {
  const EventBundleType({required this.label, this.selected = false});

  final String label;
  final bool selected;
}

class EventBundleService {
  const EventBundleService({
    required this.art,
    required this.gradient,
    required this.artScale,
    required this.title,
    required this.detail,
  });

  /// `AxArt` asset drawn inside the 38px tile.
  final String art;

  /// Gradient of the 38px tile.
  final Gradient gradient;

  /// Fraction of the tile the art occupies — 55% / 52% / 55%
  /// (Client_EventBundle.dc.html lines 47, 56, 65).
  final double artScale;

  final String title;
  final String detail;
}

class EventBundle {
  const EventBundle({
    required this.title,
    required this.intro,
    required this.types,
    required this.dateLabel,
    required this.changeLabel,
    required this.teamLabel,
    required this.services,
    required this.addServiceLabel,
    required this.providersLabel,
    required this.totalLabel,
    required this.ctaLabel,
  });

  final String title;
  final String intro;
  final List<EventBundleType> types;
  final String dateLabel;
  final String changeLabel;
  final String teamLabel;
  final List<EventBundleService> services;
  final String addServiceLabel;
  final String providersLabel;
  final String totalLabel;
  final String ctaLabel;
}

const kEventBundleTypes = [
  EventBundleType(label: 'Wedding', selected: true),
  EventBundleType(label: 'Kwanjula'),
  EventBundleType(label: 'Graduation'),
  EventBundleType(label: 'Photoshoot'),
];

const kEventBundleServices = [
  EventBundleService(
    art: AxArt.artBraids,
    gradient: AxGradients.avatarBlush,
    artScale: 0.55,
    title: 'Hair · Grace Nabbosa',
    detail: '9:00 am · UGX 120,000',
  ),
  EventBundleService(
    art: AxArt.artMakeup,
    gradient: AxGradients.avatarPale,
    artScale: 0.52,
    title: 'Makeup · Patricia Glam Studio',
    detail: '10:30 am · UGX 180,000',
  ),
  EventBundleService(
    art: AxArt.artPhotography,
    gradient: AxGradients.avatarSand,
    artScale: 0.55,
    title: 'Photography · Kato Visuals',
    detail: '1:00 pm · UGX 350,000',
  ),
];

const kEventBundle = EventBundle(
  title: 'Plan an event',
  intro: 'One booking, the whole team, one checkout.',
  types: kEventBundleTypes,
  dateLabel: 'Saturday, 12 September',
  changeLabel: 'Change',
  teamLabel: 'Your event team',
  services: kEventBundleServices,
  addServiceLabel: 'Add another service',
  providersLabel: '3 providers',
  totalLabel: 'UGX 650,000',
  ctaLabel: 'Review & pay',
);
