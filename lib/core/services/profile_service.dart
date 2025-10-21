import '../../data/datasources/objectbox_service.dart';
import '../../data/models/user_profile_model.dart';
import '../../domain/entities/user_profile.dart';
import '../../objectbox.g.dart';
import 'preferences_service.dart';

/// Service for managing user profiles and profile switching
class ProfileService {
  final ObjectBoxService _objectBoxService;
  final PreferencesService _preferencesService;

  // Key for storing active profile ID
  static const _keyActiveProfileId = 'active_profile_id';

  // Current active profile (cached)
  UserProfile? _activeProfile;

  ProfileService(this._objectBoxService, this._preferencesService);

  /// Get the box for UserProfileModel
  Box<UserProfileModel> get _profileBox =>
      _objectBoxService.store.box<UserProfileModel>();

  /// Initialize profile service
  /// Creates default profile if none exists
  Future<void> initialize() async {
    // Check if any profiles exist
    final allProfiles = await getAllProfiles();

    if (allProfiles.isEmpty) {
      // Create default "Self" profile
      final defaultProfile = UserProfile(
        name: 'Me',
        avatarEmoji: '👤',
        colorValue: ProfileColors.defaultColor,
        relationship: 'Self',
        isActive: true,
        isDefaultProfile: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final savedProfile = await createProfile(defaultProfile);
      await setActiveProfile(savedProfile.id!);
    } else {
      // Load active profile from preferences
      final activeProfileId = await _preferencesService.getInt(
        _keyActiveProfileId,
      );
      if (activeProfileId != null) {
        _activeProfile = await getProfileById(activeProfileId);
      }

      // If no active profile set or profile not found, use first profile
      if (_activeProfile == null) {
        _activeProfile = allProfiles.first;
        await setActiveProfile(_activeProfile!.id!);
      }
    }
  }

  /// Get currently active profile
  Future<UserProfile?> getActiveProfile() async {
    if (_activeProfile != null) {
      return _activeProfile;
    }

    final activeProfileId = await _preferencesService.getInt(
      _keyActiveProfileId,
    );
    if (activeProfileId != null) {
      _activeProfile = await getProfileById(activeProfileId);
    }

    return _activeProfile;
  }

  /// Get active profile ID
  Future<int?> getActiveProfileId() async {
    final profile = await getActiveProfile();
    return profile?.id;
  }

  /// Set active profile by ID
  Future<void> setActiveProfile(int profileId) async {
    final profile = await getProfileById(profileId);
    if (profile != null) {
      _activeProfile = profile;
      await _preferencesService.setInt(_keyActiveProfileId, profileId);
    }
  }

  /// Create a new profile
  Future<UserProfile> createProfile(UserProfile profile) async {
    final model = UserProfileModel.fromEntity(profile);
    final id = _profileBox.put(model);
    return (await getProfileById(id))!;
  }

  /// Update an existing profile
  Future<UserProfile> updateProfile(UserProfile profile) async {
    if (profile.id == null) {
      throw Exception('Cannot update profile without ID');
    }

    final updatedProfile = profile.copyWith(updatedAt: DateTime.now());

    final model = UserProfileModel.fromEntity(updatedProfile);
    _profileBox.put(model);

    // Update cached active profile if it's the one being updated
    if (_activeProfile?.id == profile.id) {
      _activeProfile = updatedProfile;
    }

    return updatedProfile;
  }

  /// Delete a profile by ID
  Future<void> deleteProfile(int profileId) async {
    // Prevent deletion of the last profile
    final allProfiles = await getAllProfiles();
    if (allProfiles.length <= 1) {
      throw Exception('Cannot delete the last profile');
    }

    // Prevent deletion of default profile if it's the only one
    final profile = await getProfileById(profileId);
    if (profile?.isDefaultProfile == true && allProfiles.length <= 1) {
      throw Exception('Cannot delete the default profile');
    }

    // If deleting active profile, switch to another profile
    if (_activeProfile?.id == profileId) {
      final otherProfile = allProfiles.firstWhere((p) => p.id != profileId);
      await setActiveProfile(otherProfile.id!);
    }

    _profileBox.remove(profileId);
  }

  /// Get a profile by ID
  Future<UserProfile?> getProfileById(int id) async {
    final model = _profileBox.get(id);
    return model?.toEntity();
  }

  /// Get all profiles
  Future<List<UserProfile>> getAllProfiles() async {
    final models = _profileBox.getAll();
    return models.map((model) => model.toEntity()).toList();
  }

  /// Get all active profiles
  Future<List<UserProfile>> getActiveProfiles() async {
    final query = _profileBox
        .query(UserProfileModel_.isActive.equals(true))
        .build();
    final models = query.find();
    query.close();
    return models.map((model) => model.toEntity()).toList();
  }

  /// Get profiles by relationship
  Future<List<UserProfile>> getProfilesByRelationship(
    String relationship,
  ) async {
    final query = _profileBox
        .query(UserProfileModel_.relationship.equals(relationship))
        .build();
    final models = query.find();
    query.close();
    return models.map((model) => model.toEntity()).toList();
  }

  /// Search profiles by name
  Future<List<UserProfile>> searchProfiles(String searchQuery) async {
    final allProfiles = await getAllProfiles();
    final lowercaseQuery = searchQuery.toLowerCase();
    return allProfiles.where((profile) {
      return profile.name.toLowerCase().contains(lowercaseQuery) ||
          (profile.relationship?.toLowerCase().contains(lowercaseQuery) ??
              false);
    }).toList();
  }

  /// Get profile count
  Future<int> getProfileCount() async {
    return _profileBox.count();
  }

  /// Check if a profile name already exists
  Future<bool> isProfileNameExists(String name, {int? excludeId}) async {
    final allProfiles = await getAllProfiles();
    return allProfiles.any(
      (profile) =>
          profile.name.toLowerCase() == name.toLowerCase() &&
          profile.id != excludeId,
    );
  }

  /// Toggle profile active status
  Future<void> toggleProfileStatus(int profileId) async {
    final profile = await getProfileById(profileId);
    if (profile != null) {
      await updateProfile(profile.copyWith(isActive: !profile.isActive));
    }
  }

  /// Get profile statistics (medicine count, adherence, etc.)
  Future<Map<String, dynamic>> getProfileStatistics(int profileId) async {
    // This will be implemented when integrating with repositories
    return {
      'medicineCount': 0,
      'todayDoses': 0,
      'adherenceRate': 0.0,
      'currentStreak': 0,
    };
  }

  /// Clear cache
  void clearCache() {
    _activeProfile = null;
  }
}
