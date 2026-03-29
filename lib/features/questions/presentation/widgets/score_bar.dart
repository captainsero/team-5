import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:team_5_examapp/core/constants/contants_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';

class ScoreBar extends StatelessWidget {
  const ScoreBar({super.key, required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: AppSize.s130,
          height: AppSize.s130,
          child: SfRadialGauge(
            axes: [
              RadialAxis(
                showLabels: false,
                showTicks: false,
                startAngle: AppConstants.scoreBarAngle,
                endAngle: AppConstants.scoreBarAngle,
                axisLineStyle: const AxisLineStyle(
                  thickness: AppConstants.scoreBarWidth,
                  thicknessUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.bothCurve,
                ),
                pointers: [
                  RangePointer(
                    value: value,
                    width: AppConstants.scoreBarWidth,
                    sizeUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
                ranges: [
                  GaugeRange(
                    startValue: value + 2,
                    endValue: value + (100 - value - 2),
                    sizeUnit: GaugeSizeUnit.factor,
                    startWidth: AppConstants.scoreBarWidth,
                    endWidth: AppConstants.scoreBarWidth,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          top: AppSize.s52,
          left: AppSize.s35,
          child: Text(
            "$value%",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}
