import 'package:exchange_rate/features/models/dunamu_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final priceProvider = StateProvider<double>((ref) => 0);

List<DunamuModel> initPrice = [];