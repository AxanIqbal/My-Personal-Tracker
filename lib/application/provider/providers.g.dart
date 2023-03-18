// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userSupabaseStreamHash() =>
    r'5f2108bf244d458f95a4aea365b79c46d183d2b8';

/// See also [userSupabaseStream].
@ProviderFor(userSupabaseStream)
final userSupabaseStreamProvider =
    AutoDisposeStreamProvider<AuthState>.internal(
  userSupabaseStream,
  name: r'userSupabaseStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userSupabaseStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserSupabaseStreamRef = AutoDisposeStreamProviderRef<AuthState>;
String _$userSupabaseHash() => r'8645312fbe467ee1bbd5047c2ae2605ed781f4dc';

/// See also [userSupabase].
@ProviderFor(userSupabase)
final userSupabaseProvider = AutoDisposeFutureProvider<User>.internal(
  userSupabase,
  name: r'userSupabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userSupabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserSupabaseRef = AutoDisposeFutureProviderRef<User>;
String _$projectSupabaseHash() => r'e1bedd0642a778c6ae95005ae37416793a485e41';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef ProjectSupabaseRef = AutoDisposeFutureProviderRef<Project>;

/// See also [projectSupabase].
@ProviderFor(projectSupabase)
const projectSupabaseProvider = ProjectSupabaseFamily();

/// See also [projectSupabase].
class ProjectSupabaseFamily extends Family<AsyncValue<Project>> {
  /// See also [projectSupabase].
  const ProjectSupabaseFamily();

  /// See also [projectSupabase].
  ProjectSupabaseProvider call(
    String projectId,
  ) {
    return ProjectSupabaseProvider(
      projectId,
    );
  }

  @override
  ProjectSupabaseProvider getProviderOverride(
    covariant ProjectSupabaseProvider provider,
  ) {
    return call(
      provider.projectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'projectSupabaseProvider';
}

/// See also [projectSupabase].
class ProjectSupabaseProvider extends AutoDisposeFutureProvider<Project> {
  /// See also [projectSupabase].
  ProjectSupabaseProvider(
    this.projectId,
  ) : super.internal(
          (ref) => projectSupabase(
            ref,
            projectId,
          ),
          from: projectSupabaseProvider,
          name: r'projectSupabaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectSupabaseHash,
          dependencies: ProjectSupabaseFamily._dependencies,
          allTransitiveDependencies:
              ProjectSupabaseFamily._allTransitiveDependencies,
        );

  final String projectId;

  @override
  bool operator ==(Object other) {
    return other is ProjectSupabaseProvider && other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
