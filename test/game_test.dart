import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_makam_yolculugu/oyun_makam_yolculugu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(makamYolculuguConfig.title.length, 33);
    expect(makamYolculuguConfig.tagline.length, 33);
    for (final s in makamYolculuguConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(makamYolculuguConfig.gameId, makamYolculuguId);
    expect(makamYolculuguRules.gameId, makamYolculuguId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(makamYolculuguRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: makamYolculuguId, optionalMechanics: makamYolculuguRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(makamYolculuguRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
