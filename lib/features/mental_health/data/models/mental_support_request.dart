import 'package:equatable/equatable.dart';

class MentalSupportRequest extends Equatable {
  final int? age;
  final String? gender;
  final String? education;
  final String? employed;
  final int? income;
  final String? gapInResume;
  final String? pc;
  final String? internetAccess;
  final String? liveWithParents;
  final String? readOut;
  final String? disabled;
  final String? mentalIllnessB4;
  final int? timesHosp;
  final int? daysHosp;
  final String? anxiety1;
  final String? anxiety2;
  final String? anxiety3;
  final String? depression1;
  final String? depression2;
  final String? lackOfConcentration1;
  final String? lackOfConcentration2;
  final String? obsessiveThinking1;
  final String? obsessiveThinking2;
  final String? moodSwing1;
  final String? moodSwing2;
  final String? panicAttacks;
  final String? compulsiveBehavior1;
  final String? compulsiveBehavior2;
  final String? tiredness1;
  final String? tiredness2;

  const MentalSupportRequest({
    this.age,
    this.gender,
    this.education,
    this.employed,
    this.income,
    this.gapInResume,
    this.pc,
    this.internetAccess,
    this.liveWithParents,
    this.readOut,
    this.disabled,
    this.mentalIllnessB4,
    this.timesHosp,
    this.daysHosp,
    this.anxiety1,
    this.anxiety2,
    this.anxiety3,
    this.depression1,
    this.depression2,
    this.lackOfConcentration1,
    this.lackOfConcentration2,
    this.obsessiveThinking1,
    this.obsessiveThinking2,
    this.moodSwing1,
    this.moodSwing2,
    this.panicAttacks,
    this.compulsiveBehavior1,
    this.compulsiveBehavior2,
    this.tiredness1,
    this.tiredness2,
  });

  factory MentalSupportRequest.fromJson(Map<String, dynamic> json) {
    return MentalSupportRequest(
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      education: json['education'] as String?,
      employed: json['employed'] as String?,
      income: json['income'] as int?,
      gapInResume: json['gap_in_resume'] as String?,
      pc: json['pc'] as String?,
      internetAccess: json['internet_access'] as String?,
      liveWithParents: json['live_with_parents'] as String?,
      readOut: json['read_out'] as String?,
      disabled: json['disabled'] as String?,
      mentalIllnessB4: json['mental_illness_b4'] as String?,
      timesHosp: json['times_hosp'] as int?,
      daysHosp: json['days_hosp'] as int?,
      anxiety1: json['anxiety1'] as String?,
      anxiety2: json['anxiety2'] as String?,
      anxiety3: json['anxiety3'] as String?,
      depression1: json['depression1'] as String?,
      depression2: json['depression2'] as String?,
      lackOfConcentration1: json['lack_of_concentration1'] as String?,
      lackOfConcentration2: json['lack_of_concentration2'] as String?,
      obsessiveThinking1: json['obsessive_thinking1'] as String?,
      obsessiveThinking2: json['obsessive_thinking2'] as String?,
      moodSwing1: json['mood_swing1'] as String?,
      moodSwing2: json['mood_swing2'] as String?,
      panicAttacks: json['panic_attacks'] as String?,
      compulsiveBehavior1: json['compulsive_behavior1'] as String?,
      compulsiveBehavior2: json['compulsive_behavior2'] as String?,
      tiredness1: json['tiredness1'] as String?,
      tiredness2: json['tiredness2'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "age": age,
        "gender": gender,
        "education": education,
        "employed": employed,
        "income": income,
        "gap_in_resume": gapInResume,
        "pc": pc,
        "internet_access": internetAccess,
        "live_with_parents": liveWithParents,
        "read_out": readOut,
        "disabled": disabled,
        "mental_illness_b4": mentalIllnessB4,
        "times_hosp": timesHosp,
        "days_hosp": daysHosp,
        "anxiety1": anxiety1,
        "anxiety2": anxiety2,
        "anxiety3": anxiety3,
        "depression1": depression1,
        "depression2": depression2,
        "lack_of_concentration1": lackOfConcentration1,
        "lack_of_concentration2": lackOfConcentration2,
        "obsessive_thinking1": obsessiveThinking1,
        "obsessive_thinking2": obsessiveThinking2,
        "mood_swing1": moodSwing1,
        "mood_swing2": moodSwing2,
        "panic_attacks": panicAttacks,
        "compulsive_behavior1": compulsiveBehavior1,
        "compulsive_behavior2": compulsiveBehavior2,
        "tiredness1": tiredness1,
        "tiredness2": tiredness2,
      };

  @override
  List<Object?> get props {
    return [
      age,
      gender,
      education,
      employed,
      income,
      gapInResume,
      pc,
      internetAccess,
      liveWithParents,
      readOut,
      disabled,
      mentalIllnessB4,
      timesHosp,
      daysHosp,
      anxiety1,
      anxiety2,
      anxiety3,
      depression1,
      depression2,
      lackOfConcentration1,
      lackOfConcentration2,
      obsessiveThinking1,
      obsessiveThinking2,
      moodSwing1,
      moodSwing2,
      panicAttacks,
      compulsiveBehavior1,
      compulsiveBehavior2,
      tiredness1,
      tiredness2,
    ];
  }
}
