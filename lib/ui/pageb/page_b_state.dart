part of 'page_b_cubit.dart';

@freezed
class PageBState with _$PageBState{
  const factory PageBState.initial([@Default(0) int value]) = _Initial;
  const factory PageBState.success(int value) = _Success;
}