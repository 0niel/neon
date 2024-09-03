import 'package:neon_framework/theme.dart';
import 'package:vector_graphics/vector_graphics.dart';

/// The custom theme used in the Neon app.
const neonTheme = NeonTheme(
  branding: branding,
);

/// The custom branding used in the Neon app.
const branding = Branding(
  name: 'Nextcloud Neon',
  logo: VectorGraphic(
    width: 100,
    height: 100,
    loader: AssetBytesLoader(
      'assets/logo_inverted.svg.vec',
    ),
  ),
  sourceCodeURL: 'https://github.com/nextcloud/neon',
  issueTrackerURL: 'https://github.com/nextcloud/neon/issues',
  legalese: 'Copyright © 2024, provokateurin\nUnder GPLv3 license',
);
