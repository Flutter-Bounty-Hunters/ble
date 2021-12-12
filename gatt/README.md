# GATT (Generic ATTribute profile)
GATT (Generic ATTribute profile) is the information protocol at the heart of Bluetooth Low Energy communication. This package provides structured representations for GATT IDs, which identify services, characteristics, and descriptors. This package also includes many SIG GATT IDs for easy reference in your BLE code.

## Usage
Reference existing SIG GATT IDs, or define your own.

```dart
import 'package:gatt/gatt.dart';

// Reference official SIG IDs:
print(batteryLevelCharacteristicId);

// Construct a SIG ID with the leading 16-bit or 32-bit UUID:
print(const SigGattId(0x1234));

// Construct a custom GATT ID:
print(const GattId(0x1234, '-0000-1111-2222-3456789ABCDE'));

// Access the leading 32-bits as an integer:
print(const GattId(0x1234, '-0000-1111-2222-3456789ABCDE').leadingHexInt);
// prints the integer form of 0x1234

// Access the leading 32-bits as a hex string:
print(const GattId(0x1234, '-0000-1111-2222-3456789ABCDE').asUuid4Bytes);
// prints "0001234"

// Access the lower 16-bits of the leading 32-bits as a hex string:
print(const GattId(0x1234, '-0000-1111-2222-3456789ABCDE').asUuid2Bytes);
// prints "1234"
```
