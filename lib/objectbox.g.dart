// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/item.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7932492332027291679),
      name: 'Item',
      lastPropertyId: const IdUid(8, 2546208966551432421),
      flags: 2,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 321193347701524980),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1616061029864682726),
            name: 'imgpath',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 160515473588519041),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8543480107739698037),
            name: 'count',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8343164983302738503),
            name: 'type',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2819843710009550810),
            name: 'price',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 2546208966551432421),
            name: 'tag',
            type: 30,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 7932492332027291679),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [4182022105342773186],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Item: EntityDefinition<Item>(
        model: _entities[0],
        toOneRelations: (Item object) => [],
        toManyRelations: (Item object) => {},
        getId: (Item object) => object.id,
        setId: (Item object, int id) {
          object.id = id;
        },
        objectToFB: (Item object, fb.Builder fbb) {
          final imgpathOffset = fbb.writeList(
              object.imgpath.map(fbb.writeString).toList(growable: false));
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final countOffset =
              object.count == null ? null : fbb.writeString(object.count!);
          final typeOffset =
              object.type == null ? null : fbb.writeString(object.type!);
          final tagOffset = fbb.writeList(
              object.tag.map(fbb.writeString).toList(growable: false));
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, imgpathOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(4, countOffset);
          fbb.addOffset(5, typeOffset);
          fbb.addFloat64(6, object.price);
          fbb.addOffset(7, tagOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Item()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..imgpath = const fb.ListReader<String>(
                    fb.StringReader(asciiOptimization: true),
                    lazy: false)
                .vTableGet(buffer, rootOffset, 6, [])
            ..name = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8)
            ..count = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 12)
            ..type = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 14)
            ..price = const fb.Float64Reader()
                .vTableGetNullable(buffer, rootOffset, 16)
            ..tag = const fb.ListReader<String>(
                    fb.StringReader(asciiOptimization: true),
                    lazy: false)
                .vTableGet(buffer, rootOffset, 18, []);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Item] entity fields to define ObjectBox queries.
class Item_ {
  /// see [Item.id]
  static final id = QueryIntegerProperty<Item>(_entities[0].properties[0]);

  /// see [Item.imgpath]
  static final imgpath =
      QueryStringVectorProperty<Item>(_entities[0].properties[1]);

  /// see [Item.name]
  static final name = QueryStringProperty<Item>(_entities[0].properties[2]);

  /// see [Item.count]
  static final count = QueryStringProperty<Item>(_entities[0].properties[3]);

  /// see [Item.type]
  static final type = QueryStringProperty<Item>(_entities[0].properties[4]);

  /// see [Item.price]
  static final price = QueryDoubleProperty<Item>(_entities[0].properties[5]);

  /// see [Item.tag]
  static final tag =
      QueryStringVectorProperty<Item>(_entities[0].properties[6]);
}
