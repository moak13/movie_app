// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../features/movie/movie_view.dart';
import '../../features/splash/splash_view.dart';
import '../../features/wrapper/wrapper_view.dart';
import '../models/movie_model.dart';

class Routes {
  static const String splashView = '/';
  static const String wrapperView = '/wrapper-view';
  static const String movieView = '/movie-view';
  static const all = <String>{
    splashView,
    wrapperView,
    movieView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.wrapperView, page: WrapperView),
    RouteDef(Routes.movieView, page: MovieView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    WrapperView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const WrapperView(),
        settings: data,
      );
    },
    MovieView: (data) {
      var args = data.getArgs<MovieViewArguments>(
        orElse: () => MovieViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => MovieView(
          key: args.key,
          movie: args.movie,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MovieView arguments holder class
class MovieViewArguments {
  final Key? key;
  final Movie? movie;
  MovieViewArguments({this.key, this.movie});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToSplashView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.splashView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToWrapperView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.wrapperView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMovieView({
    Key? key,
    Movie? movie,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.movieView,
      arguments: MovieViewArguments(key: key, movie: movie),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
