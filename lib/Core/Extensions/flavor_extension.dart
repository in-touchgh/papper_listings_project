import '../Enums/enums.dart';

///Extensions in general allow you add more functionality to predefined libraries
///such as enums, Strings, etc
///
/// This extension file adds more functionality to the [Flavors] enum already defined
/// depending on the enum value selected.
///

extension FlavorExtension on Flavors {
  String get flavorName {
    switch (this) {
      case Flavors.dev:
        return 'Dev - Starter Template';
      case Flavors.prod:
        return 'Starter Template';
    }
  }

  bool get devType {
    switch (this) {
      case Flavors.dev:
        return true;
      case Flavors.prod:
        return false;
    }
  }
}
