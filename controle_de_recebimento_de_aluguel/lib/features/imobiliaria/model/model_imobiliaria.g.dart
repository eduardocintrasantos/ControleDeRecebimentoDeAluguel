// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_imobiliaria.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelImobiliariaCollection on Isar {
  IsarCollection<ModelImobiliaria> get modelImobiliarias => this.collection();
}

const ModelImobiliariaSchema = CollectionSchema(
  name: r'ModelImobiliaria',
  id: 7686867421115376370,
  properties: {
    r'bairro': PropertySchema(
      id: 0,
      name: r'bairro',
      type: IsarType.string,
    ),
    r'descricao': PropertySchema(
      id: 1,
      name: r'descricao',
      type: IsarType.string,
    ),
    r'numero': PropertySchema(
      id: 2,
      name: r'numero',
      type: IsarType.long,
    ),
    r'rua': PropertySchema(
      id: 3,
      name: r'rua',
      type: IsarType.string,
    ),
    r'telefone': PropertySchema(
      id: 4,
      name: r'telefone',
      type: IsarType.string,
    )
  },
  estimateSize: _modelImobiliariaEstimateSize,
  serialize: _modelImobiliariaSerialize,
  deserialize: _modelImobiliariaDeserialize,
  deserializeProp: _modelImobiliariaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _modelImobiliariaGetId,
  getLinks: _modelImobiliariaGetLinks,
  attach: _modelImobiliariaAttach,
  version: '3.1.0+1',
);

int _modelImobiliariaEstimateSize(
  ModelImobiliaria object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bairro;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.descricao.length * 3;
  {
    final value = object.rua;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.telefone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _modelImobiliariaSerialize(
  ModelImobiliaria object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bairro);
  writer.writeString(offsets[1], object.descricao);
  writer.writeLong(offsets[2], object.numero);
  writer.writeString(offsets[3], object.rua);
  writer.writeString(offsets[4], object.telefone);
}

ModelImobiliaria _modelImobiliariaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelImobiliaria(
    bairro: reader.readStringOrNull(offsets[0]),
    descricao: reader.readString(offsets[1]),
    numero: reader.readLongOrNull(offsets[2]),
    rua: reader.readStringOrNull(offsets[3]),
    telefone: reader.readStringOrNull(offsets[4]),
  );
  object.id = id;
  return object;
}

P _modelImobiliariaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelImobiliariaGetId(ModelImobiliaria object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _modelImobiliariaGetLinks(ModelImobiliaria object) {
  return [];
}

void _modelImobiliariaAttach(
    IsarCollection<dynamic> col, Id id, ModelImobiliaria object) {
  object.id = id;
}

extension ModelImobiliariaQueryWhereSort
    on QueryBuilder<ModelImobiliaria, ModelImobiliaria, QWhere> {
  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelImobiliariaQueryWhere
    on QueryBuilder<ModelImobiliaria, ModelImobiliaria, QWhereClause> {
  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterWhereClause> idBetween(
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

extension ModelImobiliariaQueryFilter
    on QueryBuilder<ModelImobiliaria, ModelImobiliaria, QFilterCondition> {
  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bairro',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bairro',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroEqualTo(
    String? value, {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroGreaterThan(
    String? value, {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroLessThan(
    String? value, {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroStartsWith(
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroEndsWith(
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bairro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bairro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      bairroIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bairro',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      descricaoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      descricaoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      descricaoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      descricaoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descricao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      descricaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      descricaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      descricaoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      descricaoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descricao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      numeroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numero',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      numeroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numero',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      numeroEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numero',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      numeroGreaterThan(
    int? value, {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      numeroLessThan(
    int? value, {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      numeroBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rua',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rua',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaEqualTo(
    String? value, {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaGreaterThan(
    String? value, {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaLessThan(
    String? value, {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaStartsWith(
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaEndsWith(
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

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rua',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rua',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      ruaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rua',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telefone',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telefone',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefone',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterFilterCondition>
      telefoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefone',
        value: '',
      ));
    });
  }
}

extension ModelImobiliariaQueryObject
    on QueryBuilder<ModelImobiliaria, ModelImobiliaria, QFilterCondition> {}

extension ModelImobiliariaQueryLinks
    on QueryBuilder<ModelImobiliaria, ModelImobiliaria, QFilterCondition> {}

extension ModelImobiliariaQuerySortBy
    on QueryBuilder<ModelImobiliaria, ModelImobiliaria, QSortBy> {
  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      sortByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      sortByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      sortByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      sortByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      sortByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.asc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      sortByNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.desc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy> sortByRua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.asc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      sortByRuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.desc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      sortByTelefone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.asc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      sortByTelefoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.desc);
    });
  }
}

extension ModelImobiliariaQuerySortThenBy
    on QueryBuilder<ModelImobiliaria, ModelImobiliaria, QSortThenBy> {
  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      thenByBairro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.asc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      thenByBairroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bairro', Sort.desc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      thenByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      thenByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      thenByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.asc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      thenByNumeroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero', Sort.desc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy> thenByRua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.asc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      thenByRuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rua', Sort.desc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      thenByTelefone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.asc);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QAfterSortBy>
      thenByTelefoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefone', Sort.desc);
    });
  }
}

extension ModelImobiliariaQueryWhereDistinct
    on QueryBuilder<ModelImobiliaria, ModelImobiliaria, QDistinct> {
  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QDistinct> distinctByBairro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bairro', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QDistinct>
      distinctByDescricao({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descricao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QDistinct>
      distinctByNumero() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numero');
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QDistinct> distinctByRua(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rua', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelImobiliaria, ModelImobiliaria, QDistinct>
      distinctByTelefone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefone', caseSensitive: caseSensitive);
    });
  }
}

extension ModelImobiliariaQueryProperty
    on QueryBuilder<ModelImobiliaria, ModelImobiliaria, QQueryProperty> {
  QueryBuilder<ModelImobiliaria, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ModelImobiliaria, String?, QQueryOperations> bairroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bairro');
    });
  }

  QueryBuilder<ModelImobiliaria, String, QQueryOperations> descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descricao');
    });
  }

  QueryBuilder<ModelImobiliaria, int?, QQueryOperations> numeroProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numero');
    });
  }

  QueryBuilder<ModelImobiliaria, String?, QQueryOperations> ruaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rua');
    });
  }

  QueryBuilder<ModelImobiliaria, String?, QQueryOperations> telefoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefone');
    });
  }
}
