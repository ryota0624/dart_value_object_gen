import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class ValueObject {
  const ValueObject({
    this.valueField = '_value',
    this.constructorName = '_',
  });

  final String valueField;
  final String constructorName;
}

const valueObject = ValueObject();

class ValueObjectGenerator extends GeneratorForAnnotation<ValueObject> {
  @override
  Stream<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async* {
    final annotation = const TypeChecker.fromRuntime(ValueObject)
        .firstAnnotationOf(element, throwOnUnresolved: false);

    if (element is! ClassElement) {
      throw ArgumentError('annotation target should be class. actual=$element');
    }

    if (element.isConstructable) {
      throw ArgumentError('annotation target class. should be abstract class');
    }

    if (element.constructors.isEmpty) {
      throw ArgumentError(
          'annotation target class. should be have constructor');
    }

    final valueFieldName = annotation?.getField('valueField')?.toStringValue();

    if (valueFieldName == null) {
      throw StateError('valueField is null');
    }


    final constructorName =
        annotation?.getField('constructorName')?.toStringValue();

    if (constructorName == null) {
      throw StateError('constructorName is null');
    }

    // TODO: constructorのprivateチェック
    final constructor = element.constructors.firstWhere((element) => element.name == constructorName);
    if (constructor.parameters.length != 1) {
      throw ArgumentError('constructor parameters should single value');
    }

    // TODO: filedのprivateチェック
    // TODO: null許容させない
    final primitiveFieldElement = element.fields
        .firstWhere((element) => element.name == valueFieldName);

    final implClassName = '_${element.name}Impl';
    final primitiveElementName = primitiveFieldElement.type.getDisplayString(withNullability: false);

    yield '''
      class $implClassName extends ${element.name} {
        @override
        bool operator ==(Object o) {
          if (identical(this, o)) return true;
          return o is $implClassName && o.$valueFieldName == $valueFieldName;
        }
      
        $implClassName($primitiveElementName value): super.$constructorName(value);
      
        @override
        int get hashCode => $valueFieldName.hashCode;
      
        @override
        String toString() {
          return $valueFieldName.toString();
        }
      }
    ''';
  }
}
