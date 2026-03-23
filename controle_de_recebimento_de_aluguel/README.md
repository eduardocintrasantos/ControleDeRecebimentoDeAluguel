# Controle de Recebimento de Aluguel

App mobile offline para controlar o recebimento de aluguéis. Substitui o controle em papel por uma aplicação local onde é possível cadastrar imobiliárias, casas e acompanhar os títulos em aberto ou já recebidos.

## Tecnologias

- **Flutter** — framework principal
- **Riverpod** — gerenciamento de estado (`AsyncNotifier`)
- **Isar** — banco de dados local (offline-first)
- **Go Router** — gerenciamento de rotas declarativo com `ShellRoute`
- **intl** — formatação de datas e valores
- **MVVM** — padrão arquitetural

## Arquitetura (MVVM)

O projeto segue o padrão **Model-View-ViewModel**, organizado por features.

```
UI (View) → ViewModel → Repository → Isar (banco local)
```

| Camada | Responsabilidade |
|--------|-----------------|
| **Model** | Dados e regras de negócio. Classes Isar com `@collection`. |
| **ViewModel** | Lógica da tela, expõe estado via Riverpod (`AsyncNotifier`). |
| **View** | Telas e widgets. Lê estado do ViewModel, não contém lógica. |
| **Repository** | Encapsula queries do Isar, isola o ViewModel do banco. |

## Estrutura de Pastas

```
lib/
├── app/
│   ├── router/           # Rotas do app (GoRouter + ShellRoute)
│   └── shell/            # AppShell — scaffold com BottomNavigationBar
├── core/
│   ├── database/         # Inicialização do Isar (IsarService)
│   ├── utils/            # Funções auxiliares reutilizáveis
│   └── extensions/       # Extensões Dart para tipos nativos
└── features/
    ├── dashboard/        # Resumo mensal e títulos em atraso
    ├── imobiliaria/      # Cadastro e listagem de imobiliárias
    ├── casa/             # Cadastro e listagem de casas
    └── titulos/          # Listagem, filtros e marcação de recebimento
```

Cada feature contém suas próprias camadas MVVM internamente:

```
features/imobiliaria/
├── model/
├── repository/
├── view_model/
└── view/
```

## Navegação

O app usa `ShellRoute` para manter a `BottomNavigationBar` persistente entre as 4 abas principais. Telas de cadastro e edição ficam fora do shell (sem barra inferior).

| Rota | Tela |
|------|------|
| `/` | Dashboard |
| `/imobiliaria` | Lista de imobiliárias |
| `/imobiliaria/nova` | Cadastro de imobiliária |
| `/imobiliaria/editar` | Edição de imobiliária |
| `/casa` | Lista de casas |
| `/casa/nova` | Cadastro de casa |
| `/casa/editar` | Edição de casa |
| `/titulo` | Títulos com filtros |

## Geração de código (Isar)

O Isar requer geração de código via `build_runner`. Após criar ou alterar um model:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Build

Para gerar o APK de release:

```bash
flutter build apk --release
```

O APK gerado fica em:
```
build/app/outputs/flutter-apk/app-release.apk
```

## Regras de Negócio implementadas

- **RN01** — Imobiliária deve ser cadastrada antes da casa (dropdown obrigatório no formulário).
- **RN02** — Ao salvar uma casa, títulos são gerados automaticamente por mês no período do contrato (dataInicio → dataFinal).
- **RN04** — O usuário marca cada título como Recebido manualmente via switch (ação reversível — volta para Aberto).
- **RN05** — App 100% offline, sem login ou chamadas de API.

> **RN03** — Cancelamento de títulos futuros ao inativar uma casa: pendente de implementação.
