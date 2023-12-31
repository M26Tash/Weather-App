import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/providers/weather_provider.dart';
import 'package:weather_app/data/resourses/app_icons.dart';
import 'package:weather_app/ui/router/app_routes.dart';
import 'package:weather_app/ui/theme/app_colors.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WeatherProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 24),
        Column(
          children: [
            TextButton.icon(
              onPressed: null,
              icon: SvgPicture.asset(AppIcons.location),
              label: Text(
                model.weatherData?.timezone ?? 'Error',
                style: TextStyle(
                  fontSize: 20,
                  height: 22 / 20,
                  color: AppColors.textColor,
                ),
              ),
            ),
            Text(
              '${model.date.last} ${model.setCurrentTime()}',
              style: TextStyle(
                fontSize: 14,
                height: 22 / 14,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.search);
          },
          splashRadius: 24,
          iconSize: 24,
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
