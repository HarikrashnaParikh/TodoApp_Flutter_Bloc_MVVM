part of 'routes_import.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginScreenRoute.page, path: "/"),
        AutoRoute(page: RegisterScreenRoute.page),
        AutoRoute(page: ForgotPasswordScreenRoute.page),
        AutoRoute(page: TasksScreenRoute.page, path: "/"),
        AutoRoute(page: AddTaskScreenRoute.page)
      ];
}
