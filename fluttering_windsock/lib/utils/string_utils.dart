class StringUtils {
  static String capitalize(String s) =>
      (s != null && s.isNotEmpty) ? s[0].toUpperCase() + s.substring(1) : s;
}
