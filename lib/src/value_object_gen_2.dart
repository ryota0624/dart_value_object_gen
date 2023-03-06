import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class ValueObject2 {
  const ValueObject2({
    required this.className,
    this.valueField = '_value',
    this.constructorName = '_',
  });

  final String className;
  final String valueField;
  final String constructorName;
}

class ValueObject2Generator extends GeneratorForAnnotation<ValueObject2> {
  @override
  Stream<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async* {
    final annotation = const TypeChecker.fromRuntime(ValueObject2)
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

    // TODO: filedのprivateチェック
    // TODO: null許容させない
    final primitiveFieldElements = element.accessors.where((acc) => acc.isGetter && acc.name == valueFieldName);
    if (primitiveFieldElements.isEmpty) {
      throw Exception('isEmpty');
    }
    final primitiveFieldElement = primitiveFieldElements.first;
    final implClassName = annotation?.getField('className')?.toStringValue();
    final primitiveElementName = primitiveFieldElement.type.getDisplayString(withNullability: false).replaceAll('Function()', '');

    yield '''
      class $implClassName extends ${element.name} {
        final $primitiveElementName _value;
       
        @override
        bool operator ==(Object o) {
          if (identical(this, o)) return true;
          return o is $implClassName && o.$valueFieldName == $valueFieldName;
        }
      
        $implClassName($primitiveElementName this._value);
      
        @override
        int get hashCode => $valueFieldName.hashCode;
      
        @override
        String toString() => $valueFieldName.toString();
        
        $primitiveElementName toJson() => _value;
        
        factory $implClassName.fromJson($primitiveElementName json) => $implClassName(json);
      }
    ''';
  }
}
