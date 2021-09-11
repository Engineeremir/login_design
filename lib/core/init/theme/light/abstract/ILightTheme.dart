import 'package:login_design/core/init/theme/light/padding_insets.dart';

import '../color_scheme_light.dart';
import '../text_theme_light.dart';

abstract class ILightTheme {
  ColorSchemeLight? colorSchemeLight = ColorSchemeLight.instance;
  TextThemeLight? textThemeLight = TextThemeLight.instance;
  PaddingInsets insets = PaddingInsets();
}
