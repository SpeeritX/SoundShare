import 'package:flutter/cupertino.dart';
import 'package:sound_share/common/utils/nullable_extensions.dart';
import 'package:sound_share/ui/style/padding_values.dart';
import 'package:sound_share/common/utils/responsive_utils.dart';

///
/// Provides padding values, based on screen size
/// [static] paddings that are the same for every screen size
/// Should be used for elements that do not change regardless of the screen size
/// [dynamic] paddings may be different for phones with small screen or tablets
/// Used for distances, elements that should be adjusted based on screen size
class Paddings {
  static _Values? _values;

  static _Values get _valuesOrThrow =>
      _values.orIfNull(() => throw StateError("Paddings is not initialized!"));

  static PaddingValues get static => _valuesOrThrow.static;

  static PaddingValues get dynamic => _valuesOrThrow.dynamic;

  static void init(BuildContext context) {
    _values = _createPaddingValues(context);
  }

  static _Values _createPaddingValues(BuildContext context) {
    if (ResponsiveUtils.isSmallScreen(context)) {
      return _Values(
        static: const PaddingValues(),
        dynamic: const PaddingValues.smallScreen(),
      );
    }
    if (ResponsiveUtils.isTablet(context)) {
      return _Values(
        static: const PaddingValues(),
        dynamic: const PaddingValues.tabletScreen(),
      );
    }
    return _Values(
      static: const PaddingValues(),
      dynamic: const PaddingValues(),
    );
  }
}

class _Values {
  PaddingValues static;
  PaddingValues dynamic;

  _Values({
    required this.static,
    required this.dynamic,
  });
}
