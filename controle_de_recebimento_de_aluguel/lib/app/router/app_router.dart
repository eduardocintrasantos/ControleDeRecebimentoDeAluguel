import 'package:controle_de_recebimento_de_aluguel/app/shell/app_shell.dart';
import 'package:controle_de_recebimento_de_aluguel/features/dashboard/view/dashboard_page.dart';
import 'package:controle_de_recebimento_de_aluguel/features/casa/model/model_casa.dart';
import 'package:controle_de_recebimento_de_aluguel/features/casa/view/casa_page.dart';
import 'package:controle_de_recebimento_de_aluguel/features/casa/view/create_casa.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/model/model_imobiliaria.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/view/create_imobiliaria.dart';
import 'package:controle_de_recebimento_de_aluguel/features/imobiliaria/view/imobiliaria_page.dart';
import 'package:controle_de_recebimento_de_aluguel/features/titulos/view/titulo_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String dashboard = '/';
  static const String imobiliaria = '/imobiliaria';
  static const String imobiliariaNova = '/imobiliaria/nova';
  static const String imobiliariaEditar = '/imobiliaria/editar';
  static const String casa = '/casa';
  static const String casaNova = '/casa/nova';
  static const String casaEditar = '/casa/editar';
  static const String titulo = '/titulo';

  static final GoRouter router = GoRouter(
    initialLocation: dashboard,
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: dashboard,
            name: 'dashboard',
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: imobiliaria,
            name: 'imobiliaria',
            builder: (context, state) => const ImobiliariaPage(),
          ),
          GoRoute(
            path: casa,
            name: 'casa',
            builder: (context, state) => const CasaPage(),
          ),
          GoRoute(
            path: titulo,
            name: 'titulo',
            builder: (context, state) => const TituloPage(),
          ),
        ],
      ),
      GoRoute(
        path: imobiliariaNova,
        name: 'imobiliaria-nova',
        builder: (context, state) => const CreateImobiliariaPage(),
      ),
      GoRoute(
        path: imobiliariaEditar,
        name: 'imobiliaria-editar',
        builder: (context, state) =>
            CreateImobiliariaPage(imobiliaria: state.extra as ModelImobiliaria),
      ),
      GoRoute(
        path: casaNova,
        name: 'casa-nova',
        builder: (context, state) => const CreateCasaPage(),
      ),
      GoRoute(
        path: casaEditar,
        name: 'casa-editar',
        builder: (context, state) =>
            CreateCasaPage(casa: state.extra as ModelCasa),
      ),
    ],
  );
}
