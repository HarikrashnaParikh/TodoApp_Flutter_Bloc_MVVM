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

import '../model/task.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1774010842753414240),
      name: 'Task',
      lastPropertyId: const IdUid(5, 8741486030967597375),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4967507265118138974),
            name: 'internalId',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 104858696525910186),
            name: 'id',
            type: 9,
            flags: 2048,
            indexId: const IdUid(1, 6378400555499177565)),
        ModelProperty(
            id: const IdUid(3, 3201753897040791214),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 9146457233980025799),
            name: 'isDone',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8741486030967597375),
            name: 'isDeleted',
            type: 1,
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
      lastEntityId: const IdUid(1, 1774010842753414240),
      lastIndexId: const IdUid(1, 6378400555499177565),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Task: EntityDefinition<Task>(
        model: _entities[0],
        toOneRelations: (Task object) => [],
        toManyRelations: (Task object) => {},
        getId: (Task object) => object.internalId,
        setId: (Task object, int id) {
          object.internalId = id;
        },
        objectToFB: (Task object, fb.Builder fbb) {
          final idOffset = fbb.writeString(object.id);
          final titleOffset = fbb.writeString(object.title);
          fbb.startTable(6);
          fbb.addInt64(0, object.internalId);
          fbb.addOffset(1, idOffset);
          fbb.addOffset(2, titleOffset);
          fbb.addBool(3, object.isDone);
          fbb.addBool(4, object.isDeleted);
          fbb.finish(fbb.endTable());
          return object.internalId;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final isDoneParam =
              const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 10);
          final isDeletedParam =
              const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 12);
          final object = Task(
              id: idParam,
              title: titleParam,
              isDone: isDoneParam,
              isDeleted: isDeletedParam)
            ..internalId =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Task] entity fields to define ObjectBox queries.
class Task_ {
  /// see [Task.internalId]
  static final internalId =
      QueryIntegerProperty<Task>(_entities[0].properties[0]);

  /// see [Task.id]
  static final id = QueryStringProperty<Task>(_entities[0].properties[1]);

  /// see [Task.title]
  static final title = QueryStringProperty<Task>(_entities[0].properties[2]);

  /// see [Task.isDone]
  static final isDone = QueryBooleanProperty<Task>(_entities[0].properties[3]);

  /// see [Task.isDeleted]
  static final isDeleted =
      QueryBooleanProperty<Task>(_entities[0].properties[4]);
}
