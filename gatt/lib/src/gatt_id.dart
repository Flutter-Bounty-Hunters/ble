/// An ID for a GATT attribute, e.g., service, characteristic, or
/// descriptor.
///
/// A GATT ID is a standard 128-bit (16 byte) UUID. However, it is
/// common to specify a GATT ID based only on the first 16 bits (2 bytes),
/// or the first 32 bits (4 bytes), instead of passing the entire UUID.
/// `GattId` supports storage and access of the leading bytes and the
/// trailing bytes, independently, to help facilitate BLE communication.
class GattId {
  const GattId({
    required this.leadingHexInt,
    required String baseUuid,
  }) : _baseUuid = baseUuid;

  /// The first 4 bytes of the full UUID for this GATT ID.
  final int leadingHexInt;

  final String _baseUuid;

  /// The last 2 bytes of the leading 4 bytes of the UUID, expressed
  /// as a hex string.
  ///
  /// Example:
  ///
  /// Full UUID -> 0000180F-0000-1000-8000-00805F9B34FB
  ///
  /// As 2 byte UUID -> 180F
  String get asUuid2Bytes => leadingHexInt.toRadixString(16).padLeft(8, '0').substring(4);

  /// The leading 4 bytes of the UUID, expressed as a hex string.
  ///
  /// Example:
  ///
  /// Full UUID -> 0000180F-0000-1000-8000-00805F9B34FB
  ///
  /// As 4 byte UUID -> 0000180F
  String get asUuid4Bytes => leadingHexInt.toRadixString(16).padLeft(8, '0');

  /// The full UUID representation of this GATT ID, expressed as
  /// a hex string with UUID dashes.
  ///
  /// Example: 0000180F-0000-1000-8000-00805F9B34FB
  String get asUuid => "$asUuid4Bytes$_baseUuid";

  @override
  String toString() => asUuid;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GattId &&
          runtimeType == other.runtimeType &&
          leadingHexInt == other.leadingHexInt &&
          _baseUuid == other._baseUuid;

  @override
  int get hashCode => leadingHexInt.hashCode ^ _baseUuid.hashCode;
}
