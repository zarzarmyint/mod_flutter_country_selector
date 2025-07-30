import 'package:flutter/material.dart';

import '../localization/localization.dart';

class SearchBox extends StatefulWidget {
  final Function(String) onChanged;
  final Function() onSubmitted;
  final bool autofocus;
  final InputDecoration? decoration;
  final TextStyle? style;
  final Color? searchIconColor;

  const SearchBox({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
    required this.autofocus,
    this.decoration,
    this.style,
    this.searchIconColor,
  });

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String _previousValue = '';

  @override
  void initState() {
    super.initState();
  }

  void handleChange(text) {
    widget.onChanged(text);

    final isAutofill = text.length > 3 && _previousValue == '';
    if (isAutofill) {
      widget.onSubmitted();
    }
    _previousValue = text;
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: CountrySelectorLocalization.of(context)?.typeToSearch ??
          CountrySelectorLocalizationEn().typeToSearch,
      textField: true,
      child: ExcludeSemantics(
        child: TextField(
          autofocus: widget.autofocus,
          onChanged: handleChange,
          onSubmitted: (_) => widget.onSubmitted(),
          cursorColor: widget.style?.color,
          style: widget.style ?? Theme.of(context).textTheme.titleLarge,
          autofillHints: const [AutofillHints.countryName],
          decoration: widget.decoration ??
              InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  size: 24,
                ),
                filled: true,
                isDense: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: CountrySelectorLocalization.of(context)?.search ??
                    CountrySelectorLocalizationEn().search,
              ),
        ),
      ),
    );
  }
}
