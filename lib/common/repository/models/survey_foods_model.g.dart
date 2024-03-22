// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_foods_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSurveyFoodsModelCollection on Isar {
  IsarCollection<SurveyFoodsModel> get surveyFoodsModels => this.collection();
}

const SurveyFoodsModelSchema = CollectionSchema(
  name: r'SurveyFoodsModel',
  id: -1413642266002428893,
  properties: {
    r'surveyFoods': PropertySchema(
      id: 0,
      name: r'surveyFoods',
      type: IsarType.objectList,
      target: r'FoodModel',
    )
  },
  estimateSize: _surveyFoodsModelEstimateSize,
  serialize: _surveyFoodsModelSerialize,
  deserialize: _surveyFoodsModelDeserialize,
  deserializeProp: _surveyFoodsModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'FoodModel': FoodModelSchema,
    r'FoodNutrientsModel': FoodNutrientsModelSchema,
    r'NutrientModel': NutrientModelSchema
  },
  getId: _surveyFoodsModelGetId,
  getLinks: _surveyFoodsModelGetLinks,
  attach: _surveyFoodsModelAttach,
  version: '3.1.0+1',
);

int _surveyFoodsModelEstimateSize(
  SurveyFoodsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.surveyFoods;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FoodModel]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FoodModelSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _surveyFoodsModelSerialize(
  SurveyFoodsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<FoodModel>(
    offsets[0],
    allOffsets,
    FoodModelSchema.serialize,
    object.surveyFoods,
  );
}

SurveyFoodsModel _surveyFoodsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SurveyFoodsModel(
    surveyFoods: reader.readObjectList<FoodModel>(
      offsets[0],
      FoodModelSchema.deserialize,
      allOffsets,
      FoodModel(),
    ),
  );
  object.id = id;
  return object;
}

P _surveyFoodsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<FoodModel>(
        offset,
        FoodModelSchema.deserialize,
        allOffsets,
        FoodModel(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _surveyFoodsModelGetId(SurveyFoodsModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _surveyFoodsModelGetLinks(SurveyFoodsModel object) {
  return [];
}

void _surveyFoodsModelAttach(
    IsarCollection<dynamic> col, Id id, SurveyFoodsModel object) {
  object.id = id;
}

extension SurveyFoodsModelQueryWhereSort
    on QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QWhere> {
  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SurveyFoodsModelQueryWhere
    on QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QWhereClause> {
  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterWhereClause>
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

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterWhereClause> idBetween(
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

extension SurveyFoodsModelQueryFilter
    on QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QFilterCondition> {
  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
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

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
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

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
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

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
      surveyFoodsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyFoods',
      ));
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
      surveyFoodsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyFoods',
      ));
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
      surveyFoodsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surveyFoods',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
      surveyFoodsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surveyFoods',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
      surveyFoodsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surveyFoods',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
      surveyFoodsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surveyFoods',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
      surveyFoodsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surveyFoods',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
      surveyFoodsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'surveyFoods',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension SurveyFoodsModelQueryObject
    on QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QFilterCondition> {
  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterFilterCondition>
      surveyFoodsElement(FilterQuery<FoodModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'surveyFoods');
    });
  }
}

extension SurveyFoodsModelQueryLinks
    on QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QFilterCondition> {}

extension SurveyFoodsModelQuerySortBy
    on QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QSortBy> {}

extension SurveyFoodsModelQuerySortThenBy
    on QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QSortThenBy> {
  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension SurveyFoodsModelQueryWhereDistinct
    on QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QDistinct> {}

extension SurveyFoodsModelQueryProperty
    on QueryBuilder<SurveyFoodsModel, SurveyFoodsModel, QQueryProperty> {
  QueryBuilder<SurveyFoodsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SurveyFoodsModel, List<FoodModel>?, QQueryOperations>
      surveyFoodsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surveyFoods');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FoodModelSchema = Schema(
  name: r'FoodModel',
  id: 204927117867715681,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'fdcId': PropertySchema(
      id: 1,
      name: r'fdcId',
      type: IsarType.long,
    ),
    r'foodNutrients': PropertySchema(
      id: 2,
      name: r'foodNutrients',
      type: IsarType.objectList,
      target: r'FoodNutrientsModel',
    )
  },
  estimateSize: _foodModelEstimateSize,
  serialize: _foodModelSerialize,
  deserialize: _foodModelDeserialize,
  deserializeProp: _foodModelDeserializeProp,
);

int _foodModelEstimateSize(
  FoodModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.foodNutrients;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FoodNutrientsModel]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FoodNutrientsModelSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _foodModelSerialize(
  FoodModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeLong(offsets[1], object.fdcId);
  writer.writeObjectList<FoodNutrientsModel>(
    offsets[2],
    allOffsets,
    FoodNutrientsModelSchema.serialize,
    object.foodNutrients,
  );
}

FoodModel _foodModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodModel(
    description: reader.readStringOrNull(offsets[0]),
    fdcId: reader.readLongOrNull(offsets[1]),
    foodNutrients: reader.readObjectList<FoodNutrientsModel>(
      offsets[2],
      FoodNutrientsModelSchema.deserialize,
      allOffsets,
      FoodNutrientsModel(),
    ),
  );
  return object;
}

P _foodModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<FoodNutrientsModel>(
        offset,
        FoodNutrientsModelSchema.deserialize,
        allOffsets,
        FoodNutrientsModel(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FoodModelQueryFilter
    on QueryBuilder<FoodModel, FoodModel, QFilterCondition> {
  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> fdcIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fdcId',
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> fdcIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fdcId',
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> fdcIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fdcId',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> fdcIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fdcId',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> fdcIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fdcId',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition> fdcIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fdcId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      foodNutrientsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'foodNutrients',
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      foodNutrientsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'foodNutrients',
      ));
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      foodNutrientsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodNutrients',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      foodNutrientsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodNutrients',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      foodNutrientsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodNutrients',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      foodNutrientsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodNutrients',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      foodNutrientsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodNutrients',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      foodNutrientsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodNutrients',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension FoodModelQueryObject
    on QueryBuilder<FoodModel, FoodModel, QFilterCondition> {
  QueryBuilder<FoodModel, FoodModel, QAfterFilterCondition>
      foodNutrientsElement(FilterQuery<FoodNutrientsModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'foodNutrients');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FoodNutrientsModelSchema = Schema(
  name: r'FoodNutrientsModel',
  id: 6325384937886623908,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.string,
    ),
    r'nutrient': PropertySchema(
      id: 1,
      name: r'nutrient',
      type: IsarType.object,
      target: r'NutrientModel',
    )
  },
  estimateSize: _foodNutrientsModelEstimateSize,
  serialize: _foodNutrientsModelSerialize,
  deserialize: _foodNutrientsModelDeserialize,
  deserializeProp: _foodNutrientsModelDeserializeProp,
);

int _foodNutrientsModelEstimateSize(
  FoodNutrientsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.amount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nutrient;
    if (value != null) {
      bytesCount += 3 +
          NutrientModelSchema.estimateSize(
              value, allOffsets[NutrientModel]!, allOffsets);
    }
  }
  return bytesCount;
}

void _foodNutrientsModelSerialize(
  FoodNutrientsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.amount);
  writer.writeObject<NutrientModel>(
    offsets[1],
    allOffsets,
    NutrientModelSchema.serialize,
    object.nutrient,
  );
}

FoodNutrientsModel _foodNutrientsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodNutrientsModel(
    amount: reader.readStringOrNull(offsets[0]),
    nutrient: reader.readObjectOrNull<NutrientModel>(
      offsets[1],
      NutrientModelSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _foodNutrientsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<NutrientModel>(
        offset,
        NutrientModelSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FoodNutrientsModelQueryFilter
    on QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QFilterCondition> {
  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'amount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      amountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'amount',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      nutrientIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nutrient',
      ));
    });
  }

  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      nutrientIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nutrient',
      ));
    });
  }
}

extension FoodNutrientsModelQueryObject
    on QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QFilterCondition> {
  QueryBuilder<FoodNutrientsModel, FoodNutrientsModel, QAfterFilterCondition>
      nutrient(FilterQuery<NutrientModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'nutrient');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NutrientModelSchema = Schema(
  name: r'NutrientModel',
  id: 8579251573132223153,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'number': PropertySchema(
      id: 1,
      name: r'number',
      type: IsarType.string,
    ),
    r'unitName': PropertySchema(
      id: 2,
      name: r'unitName',
      type: IsarType.string,
    )
  },
  estimateSize: _nutrientModelEstimateSize,
  serialize: _nutrientModelSerialize,
  deserialize: _nutrientModelDeserialize,
  deserializeProp: _nutrientModelDeserializeProp,
);

int _nutrientModelEstimateSize(
  NutrientModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.number;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unitName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _nutrientModelSerialize(
  NutrientModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeString(offsets[1], object.number);
  writer.writeString(offsets[2], object.unitName);
}

NutrientModel _nutrientModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NutrientModel(
    name: reader.readStringOrNull(offsets[0]),
    number: reader.readStringOrNull(offsets[1]),
    unitName: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _nutrientModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension NutrientModelQueryFilter
    on QueryBuilder<NutrientModel, NutrientModel, QFilterCondition> {
  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'number',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: '',
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      numberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'number',
        value: '',
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitName',
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitName',
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: '',
      ));
    });
  }

  QueryBuilder<NutrientModel, NutrientModel, QAfterFilterCondition>
      unitNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitName',
        value: '',
      ));
    });
  }
}

extension NutrientModelQueryObject
    on QueryBuilder<NutrientModel, NutrientModel, QFilterCondition> {}
