class UserPreferences {
  final List<String> placeTypes;   // e.g. ['cafe', 'outdoor']
  final String travelMode;         // e.g. 'walk', 'drive', 'train', 'nearby'

  const UserPreferences({
    required this.placeTypes,
    required this.travelMode,
  });
}