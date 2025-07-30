import 'package:flutter/material.dart';

import '../localization/localization.dart';

class NoResultView extends StatelessWidget {
  final String? title;
  const NoResultView({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title ??
            CountrySelectorLocalization.of(context)?.noResultMessage ??
            CountrySelectorLocalizationEn().noResultMessage,
        key: const ValueKey('no-result'),
      ),
    );
  }
}
