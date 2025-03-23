/// Um `enum` que contém as chaves de cache do aplicativo.
enum Cachekey {
  isLogged,
  isDarkMode,
  themeColor,
}

extension CacheKeyExtension on Cachekey {
  String get value {
    switch (this) {
      case Cachekey.isLogged:
        return 'isLogged';
      case Cachekey.isDarkMode:
        return 'isDarkMode';
      case Cachekey.themeColor:
        return 'themeColor';
    }
  }
}