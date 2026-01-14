// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_food_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecordFoodViewModel)
const recordFoodViewModelProvider = RecordFoodViewModelProvider._();

final class RecordFoodViewModelProvider
    extends
        $AsyncNotifierProvider<RecordFoodViewModel, List<FoodNutritionModel>> {
  const RecordFoodViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recordFoodViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recordFoodViewModelHash();

  @$internal
  @override
  RecordFoodViewModel create() => RecordFoodViewModel();
}

String _$recordFoodViewModelHash() =>
    r'2efa9aee99c0874b743f79206e3b44477c60cdb9';

abstract class _$RecordFoodViewModel
    extends $AsyncNotifier<List<FoodNutritionModel>> {
  FutureOr<List<FoodNutritionModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<FoodNutritionModel>>,
              List<FoodNutritionModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<FoodNutritionModel>>,
                List<FoodNutritionModel>
              >,
              AsyncValue<List<FoodNutritionModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
