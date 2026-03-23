# Controle de Recebimento de Aluguel

App mobile offline para controlar o recebimento de aluguéis. Substitui o controle em papel por uma aplicação local onde é possível cadastrar imobiliárias, casas e acompanhar os títulos em aberto ou já recebidos.

## Tecnologias

- **Flutter** — framework principal
- **Riverpod** — gerenciamento de estado
- **Isar** — banco de dados local (offline-first)
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
├── app/                  # Configurações globais: tema, rotas, widget raiz
├── core/
│   ├── database/         # Inicialização do Isar e providers globais
│   ├── enums/            # Enums: CasaStatus, TituloStatus
│   ├── utils/            # Funções auxiliares reutilizáveis
│   └── extensions/       # Extensões Dart para tipos nativos
└── features/
    ├── imobiliaria/      # Model, repo, view model e telas de imobiliárias
    ├── casa/             # Cadastro, edição e listagem de casas
    ├── titulos/          # Listagem e marcação de recebimento
    └── dashboard/        # Visão geral com indicadores de recebimentos
```

Cada feature contém suas próprias camadas MVVM internamente:

```
features/imobiliaria/
├── model/
├── repository/
├── view_model/
├── view/
└── widgets/
```

## Geração de código (Isar)

O Isar requer geração de código via `build_runner`. Após criar ou alterar um model:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Regras de Negócio principais

- **RN01** — Imobiliária deve ser cadastrada antes da casa.
- **RN02** — Ao salvar uma casa, títulos são gerados automaticamente por mês no período do contrato.
- **RN03** — Ao inativar uma casa, títulos futuros em aberto são cancelados.
- **RN04** — O usuário marca cada título como Recebido manualmente (ação reversível).
- **RN05** — App 100% offline, sem login ou chamadas de API.
