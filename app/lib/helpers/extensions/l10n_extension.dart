import 'package:app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}
