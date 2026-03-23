// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_titulo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelTituloCollection on Isar {
  IsarCollection<ModelTitulo> get modelTitulos => this.collection();
}

const ModelTituloSchema = CollectionSchema(
  name: r'ModelTitulo',
  id: -4578638180998126734,
  properties: {
    r'ano': PropertySchema(
      id: 0,
      name: r'ano',
      type: IsarType.long,
    ),
    r'dataRecebimento': PropertySchema(
      id: 1,
      name: r'dataRecebimento',
      type: IsarType.dateTime,
    ),
    r'idCasa': PropertySchema(
      id: 2,
      name: r'idCasa',
      type: IsarType.long,
    ),
    r'mes': PropertySchema(
      id: 3,
      name: r'mes',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.bool,
    ),
    r'valorAluguel': PropertySchema(
      id: 5,
      name: r'valorAluguel',
      type: IsarType.double,
    )
  },
  estimateSize: _modelTituloEstimateSize,
  serialize: _modelTituloSerialize,
  deserialize: _modelTituloDeserialize,
  deserializeProp: _modelTituloDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _modelTituloGetId,
  getLinks: _modelTituloGetLinks,
  attach: _modelTituloAttach,
  version: '3.1.0+1',
);

int _modelTituloEstimateSize(
  ModelTitulo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _modelTituloSerialize(
  ModelTitulo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.ano);
  writer.writeDateTime(offsets[1], object.dataRecebimento);
  writer.writeLong(offsets[2], object.idCasa);
  writer.writeLong(offsets[3], object.mes);
  writer.writeBool(offsets[4], object.status);
  writer.writeDouble(offsets[5], object.valorAluguel);
}

ModelTitulo _modelTituloDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelTitulo(
    ano: reader.readLong(offsets[0]),
    dataRecebimento: reader.readDateTimeOrNull(offsets[1]),
    idCasa: reader.readLong(offsets[2]),
    mes: reader.readLong(offsets[3]),
    status: reader.readBool(offsets[4]),
    valorAluguel: reader.readDouble(offsets[5]),
  );
  object.id = id;
  return object;
}

P _modelTituloDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelTituloGetId(ModelTitulo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _modelTituloGetLinks(ModelTitulo object) {
  return [];
}

void _modelTituloAttach(
    IsarCollection<dynamic> col, Id id, ModelTitulo object) {
  object.id = id;
}

extension ModelTituloQueryWhereSort
    on QueryBuilder<ModelTitulo, ModelTitulo, QWhere> {
  QueryBuilder<ModelTitulo, ModelTitulo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelTituloQueryWhere
    on QueryBuilder<ModelTitulo, ModelTitulo, QWhereClause> {
  QueryBuilder<ModelTitulo, ModelTitulo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ModelTituloQueryFilter
    on QueryBuilder<ModelTitulo, ModelTitulo, QFilterCondition> {
  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> anoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ano',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> anoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ano',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> anoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ano',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> anoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ano',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition>
      dataRecebimentoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dataRecebimento',
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition>
      dataRecebimentoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dataRecebimento',
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition>
      dataRecebimentoEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataRecebimento',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition>
      dataRecebimentoGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataRecebimento',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition>
      dataRecebimentoLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataRecebimento',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition>
      dataRecebimentoBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataRecebimento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> idCasaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCasa',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition>
      idCasaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idCasa',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> idCasaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idCasa',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> idCasaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idCasa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> mesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mes',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> mesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mes',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> mesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mes',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> mesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition> statusEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition>
      valorAluguelEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorAluguel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition>
      valorAluguelGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valorAluguel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition>
      valorAluguelLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valorAluguel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterFilterCondition>
      valorAluguelBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valorAluguel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ModelTituloQueryObject
    on QueryBuilder<ModelTitulo, ModelTitulo, QFilterCondition> {}

extension ModelTituloQueryLinks
    on QueryBuilder<ModelTitulo, ModelTitulo, QFilterCondition> {}

extension ModelTituloQuerySortBy
    on QueryBuilder<ModelTitulo, ModelTitulo, QSortBy> {
  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> sortByAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> sortByAnoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.desc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> sortByDataRecebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataRecebimento', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy>
      sortByDataRecebimentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataRecebimento', Sort.desc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> sortByIdCasa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCasa', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> sortByIdCasaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCasa', Sort.desc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> sortByMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mes', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> sortByMesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mes', Sort.desc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> sortByValorAluguel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy>
      sortByValorAluguelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.desc);
    });
  }
}

extension ModelTituloQuerySortThenBy
    on QueryBuilder<ModelTitulo, ModelTitulo, QSortThenBy> {
  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenByAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenByAnoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ano', Sort.desc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenByDataRecebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataRecebimento', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy>
      thenByDataRecebimentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataRecebimento', Sort.desc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenByIdCasa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCasa', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenByIdCasaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCasa', Sort.desc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenByMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mes', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenByMesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mes', Sort.desc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy> thenByValorAluguel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.asc);
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QAfterSortBy>
      thenByValorAluguelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.desc);
    });
  }
}

extension ModelTituloQueryWhereDistinct
    on QueryBuilder<ModelTitulo, ModelTitulo, QDistinct> {
  QueryBuilder<ModelTitulo, ModelTitulo, QDistinct> distinctByAno() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ano');
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QDistinct>
      distinctByDataRecebimento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataRecebimento');
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QDistinct> distinctByIdCasa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idCasa');
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QDistinct> distinctByMes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mes');
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<ModelTitulo, ModelTitulo, QDistinct> distinctByValorAluguel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valorAluguel');
    });
  }
}

extension ModelTituloQueryProperty
    on QueryBuilder<ModelTitulo, ModelTitulo, QQueryProperty> {
  QueryBuilder<ModelTitulo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ModelTitulo, int, QQueryOperations> anoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ano');
    });
  }

  QueryBuilder<ModelTitulo, DateTime?, QQueryOperations>
      dataRecebimentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataRecebimento');
    });
  }

  QueryBuilder<ModelTitulo, int, QQueryOperations> idCasaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCasa');
    });
  }

  QueryBuilder<ModelTitulo, int, QQueryOperations> mesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mes');
    });
  }

  QueryBuilder<ModelTitulo, bool, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ModelTitulo, double, QQueryOperations> valorAluguelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valorAluguel');
    });
  }
}
