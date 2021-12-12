import '../gatt_id.dart';

/// The trailing hex string for all officially registered SIG attribute IDs.
const sigBaseUuid = "-0000-1000-8000-00805F9B34FB";

/// A [GattId] for an officially registered Special Interest Group (SIG) attribute.
///
/// For example, the SIG defines GATT IDs for various common characteristics
/// such as battery level, current time, device name, heart rate, etc.
class SigGattId extends GattId {
  const SigGattId(int leadingHexInt)
      : super(
          leadingHexInt: leadingHexInt,
          baseUuid: sigBaseUuid,
        );
}
