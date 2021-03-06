import 'package:gatt/gatt.dart';
import 'package:test/test.dart';

void main() {
  group("GattId", () {
    test("construction and equality", () {
      expect(
        const GattId(0x1234, "-0000-1000-8000-00805F9B34FB").leadingHexInt,
        0x1234,
      );

      expect(
        const GattId(0x1234, "-0000-1000-8000-00805F9B34FB").baseUuid,
        "-0000-1000-8000-00805F9B34FB",
      );

      expect(
        const GattId(0x1234, "-0000-1000-8000-00805F9B34FB"),
        const GattId(0x00001234, "-0000-1000-8000-00805F9B34FB"),
      );

      expect(
        const GattId(0x1234, "-0000-1000-8000-00805F9B34FB") == const GattId(0x1235, "-0000-1000-8000-00805F9B34FB"),
        false,
      );

      expect(
        const GattId(0x1234, "-0000-1000-8000-00805F9B34FB") == const GattId(0x1234, "-1000-1000-8000-00805F9B34FB"),
        false,
      );
    });

    test("representations", () {
      expect(
        const GattId(0x1234, "-0000-1000-8000-00805F9B34FB").asUuid2Bytes,
        "1234",
      );

      expect(
        const GattId(0x1234, "-0000-1000-8000-00805F9B34FB").asUuid4Bytes,
        "00001234",
      );

      expect(
        const GattId(0x1234, "-0000-1000-8000-00805F9B34FB").asUuid,
        "00001234-0000-1000-8000-00805F9B34FB",
      );
    });
  });

  group("SigGattId", () {
    test("construction and equality", () {
      expect(
        const SigGattId(0x1234),
        const SigGattId(0x00001234),
      );

      expect(
        const SigGattId(0x1234) == const SigGattId(0x1235),
        false,
      );
    });

    test("representations", () {
      expect(
        const SigGattId(0x1234).asUuid,
        "00001234-0000-1000-8000-00805F9B34FB",
      );
    });
  });
}
