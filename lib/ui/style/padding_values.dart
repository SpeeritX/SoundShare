class PaddingValues {
  final double m1;
  final double m2;
  final double m3;
  final double m4;

  const PaddingValues()
      : m1 = 8,
        m2 = 13,
        m3 = 21,
        m4 = 34;

  const PaddingValues.smallScreen()
      : m1 = 5,
        m2 = 8,
        m3 = 13,
        m4 = 21;

  const PaddingValues.tabletScreen()
      : m1 = 13,
        m2 = 21,
        m3 = 34,
        m4 = 55;
}
