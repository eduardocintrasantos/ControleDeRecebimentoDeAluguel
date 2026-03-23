// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_casa.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelCasaCollection on Isar {
  IsarCollection<ModelCasa> get modelCasas => this.collection();
}

const ModelCasaSchema = CollectionSchema(
  name: r'ModelCasa',
  id: 2227200205810956323,
  properties: {
    r'bairro': PropertySchema(
      id: 0,
      name: r'bairro',
      type: IsarType.string,
    ),
    r'dataFinal': PropertySchema(
      id: 1,
      name: r'dataFinal',
      type: IsarType.dateTime,
    ),
    r'dataInicio': PropertySchema(
      id: 2,
      name: r'dataInicio',
      type: IsarType.dateTime,
    ),
    r'idImobiliaria': PropertySchema(
      id: 3,
      name: r'idImobiliaria',
      type: IsarType.long,
    ),
    r'numero': PropertySchema(
      id: 4,
      name: r'numero',
      type: IsarType.long,
    ),
    r'observacao': PropertySchema(
      id: 5,
      name: r'observacao',
      type: IsarType.string,
    ),
    r'rua': PropertySchema(
      id: 6,
      name: r'rua',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.bool,
    ),
    r'valorAluguel': PropertySchema(
      id: 8,
      name: r'valorAluguel',
      type: IsarType.double,
    )
  },
  estimateSize: _modelCasaEstimateSize,
  serialize: _modelCasaSerialize,
  deserialize: _modelCasaDeserialize,
  deserializeProp: _modelCasaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _modelCasaGetId,
  getLinks: _modelCasaGetLinks,
  attach: _modelCasaAttach,
  version: '3.1.0+1',
);

int _modelCasaEstimateSize(
  ModelCasa object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bairro.length * 3;
  bytesCount += 3 + object.observacao.length * 3;
  bytesCount += 3 + object.rua.length * 3;
  return bytesCount;
}

void _modelCasaSerialize(
  ModelCasa object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bairro);
  writer.writeDateTime(offsets[1], object.dataFinal);
  writer.writeDateTime(offsets[2], object.dataInicio);
  writer.writeLong(offsets[3], object.idImobiliaria);
  writer.writeLong(offsets[4], object.numero);
  writer.writeString(offsets[5], object.observacao);
  writer.writeString(offsets[6], object.rua);
  writer.writeBool(offsets[7], object.status);
  writer.writeDouble(offsets[8], object.valorAluguel);
}

ModelCasa _modelCasaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelCasa(
    bairro: reader.readString(offsets[0]),
    dataFinal: reader.readDateTime(offsets[1]),
    dataInicio: reader.readDateTime(offsets[2]),
    idImobiliaria: reader.readLong(offsets[3]),
    numero: reader.readLong(offsets[4]),
    rua: reader.readString(offsets[6]),
    status: reader.readBool(offsets[7]),
    valorAluguel: reader.readDouble(offsets[8]),
  );
  object.id = id;
  object.observacao = reader.readString(offsets[5]);
  return object;
}

P _modelCasaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelCasaGetId(ModelCasa object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _modelCasaGetLinks(ModelCasa object) {
  return [];
}

void _modelCasaAttach(IsarCollection<dynamic> col, Id id, ModelCasa object) {
  object.id = id;
}

extension ModelCasaQueryWhereSort
    on QueryBuilder<ModelCasa, ModelCasa, QWhere> {
  QueryBuilder<ModelCasa, ModelCasa, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelCasaQueryWhere
    on QueryBuilder<ModelCasa, ModelCasa, QWhereClause> {
  QueryBuilder<ModelCasa, ModelCasa, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ModelCasa, ModelCasa, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterWhereClause> idBetween(
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

extension ModelCasaQueryFilter
    on QueryBuilder<ModelCasa, ModelCasa, QFilterCondition> {
  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> bairroEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> bairroGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> bairroLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> bairroBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bairro',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> bairroStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> bairroEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> bairroContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> bairroMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bairro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> bairroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> bairroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> dataFinalEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataFinal',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
      dataFinalGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataFinal',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> dataFinalLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataFinal',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> dataFinalBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataFinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> dataInicioEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
      dataInicioGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> dataInicioLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> dataInicioBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataInicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
      idImobiliariaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idImobiliaria',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
      idImobiliariaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idImobiliaria',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
      idImobiliariaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idImobiliaria',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
      idImobiliariaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idImobiliaria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> numeroEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numero',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> numeroGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numero',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> numeroLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numero',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> numeroBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numero',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> observacaoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
      observacaoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'observacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> observacaoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'observacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> observacaoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'observacao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
      observacaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'observacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> observacaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'observacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> observacaoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> observacaoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observacao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
      observacaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observacao',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
      observacaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observacao',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> ruaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> ruaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> ruaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> ruaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rua',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> ruaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> ruaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> ruaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> ruaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rua',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> ruaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rua',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> ruaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rua',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> statusEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> valorAluguelEqualTo(
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

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
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

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition>
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

  QueryBuilder<ModelCasa, ModelCasa, QAfterFilterCondition> valorAluguelBetween(
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

extension ModelCasaQueryObject
    on QueryBuilder<ModelCasa, ModelCasa, QFilterCondition> {}

extension ModelCasaQueryLinks
    on QueryBuilder<ModelCasa, ModelCasa, QFilterCondition> {}

extension ModelCasaQuerySortBy on QueryBuilder<ModelCasa, ModelCasa, QSortBy> {
  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByDataFinal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataFinal', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByDataFinalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataFinal', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByDataInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInicio', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByDataInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInicio', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByIdImobiliaria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idImobiliaria', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByIdImobiliariaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idImobiliaria', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByObservacao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observacao', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByObservacaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observacao', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByRua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByRuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByValorAluguel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> sortByValorAluguelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.desc);
    });
  }
}

extension ModelCasaQuerySortThenBy
    on QueryBuilder<ModelCasa, ModelCasa, QSortThenBy> {
  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByDataFinal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataFinal', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByDataFinalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataFinal', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByDataInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInicio', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByDataInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataInicio', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByIdImobiliaria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idImobiliaria', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByIdImobiliariaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idImobiliaria', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByObservacao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observacao', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByObservacaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observacao', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByRua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByRuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByValorAluguel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.asc);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QAfterSortBy> thenByValorAluguelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAluguel', Sort.desc);
    });
  }
}

extension ModelCasaQueryWhereDistinct
    on QueryBuilder<ModelCasa, ModelCasa, QDistinct> {
  QueryBuilder<ModelCasa, ModelCasa, QDistinct> distinctByBairro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bairro', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QDistinct> distinctByDataFinal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataFinal');
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QDistinct> distinctByDataInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataInicio');
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QDistinct> distinctByIdImobiliaria() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idImobiliaria');
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QDistinct> distinctByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numero');
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QDistinct> distinctByObservacao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observacao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QDistinct> distinctByRua(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rua', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<ModelCasa, ModelCasa, QDistinct> distinctByValorAluguel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valorAluguel');
    });
  }
}

extension ModelCasaQueryProperty
    on QueryBuilder<ModelCasa, ModelCasa, QQueryProperty> {
  QueryBuilder<ModelCasa, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ModelCasa, String, QQueryOperations> bairroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bairro');
    });
  }

  QueryBuilder<ModelCasa, DateTime, QQueryOperations> dataFinalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataFinal');
    });
  }

  QueryBuilder<ModelCasa, DateTime, QQueryOperations> dataInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataInicio');
    });
  }

  QueryBuilder<ModelCasa, int, QQueryOperations> idImobiliariaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idImobiliaria');
    });
  }

  QueryBuilder<ModelCasa, int, QQueryOperations> numeroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numero');
    });
  }

  QueryBuilder<ModelCasa, String, QQueryOperations> observacaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observacao');
    });
  }

  QueryBuilder<ModelCasa, String, QQueryOperations> ruaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rua');
    });
  }

  QueryBuilder<ModelCasa, bool, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ModelCasa, double, QQueryOperations> valorAluguelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valorAluguel');
    });
  }
}
