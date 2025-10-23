# @pormeldev/axis-service-idgenerator

[![npm version](https://img.shields.io/npm/v/@pormeldev/axis-service-idgenerator.svg)](https://www.npmjs.com/package/@pormeldev/axis-service-idgenerator)

Interfaz del servicio de generación de IDs únicos para el ecosistema Axis. Proporciona un contrato estándar para la generación de identificadores únicos en aplicaciones basadas en NestJS.

## 📋 Características

- **Interfaz estándar**: Contrato unificado para generación de IDs
- **Result Pattern**: Manejo de errores consistente con `@pormeldev/axis-common-lib`
- **TypeScript**: Soporte completo con tipos definidos
- **Dependency Injection**: Símbolo de inyección de dependencias incluido

## 🚀 Instalación

```bash
npm install @pormeldev/axis-service-idgenerator
```

## 📖 Uso

### Importación

```typescript
import { IgGeneratorInterface, ID_GENERATOR_INTERFACE } from '@pormeldev/axis-service-idgenerator';
```

### Inyección de Dependencias

```typescript
import { Injectable } from '@nestjs/common';
import { IgGeneratorInterface, ID_GENERATOR_INTERFACE } from '@pormeldev/axis-service-idgenerator';

@Injectable()
export class MyService {
  constructor(
    @Inject(ID_GENERATOR_INTERFACE)
    private readonly idGenerator: IgGeneratorInterface,
  ) {}

  async createEntity() {
    const idResult = await this.idGenerator.generateId();
    
    if (!idResult.ok) {
      throw new Error('Failed to generate ID');
    }
    
    return {
      id: idResult.value,
      // ... otros campos
    };
  }
}
```

### Módulo de NestJS

```typescript
import { Module } from '@nestjs/common';
import { IgGeneratorInterface } from '@pormeldev/axis-service-idgenerator';

@Module({
  providers: [
    {
      provide: ID_GENERATOR_INTERFACE,
      useClass: YourIdGeneratorImplementation, // Tu implementación
    },
  ],
})
export class AppModule {}
```

## 🔧 Interfaz

### `IgGeneratorInterface`

```typescript
export interface IgGeneratorInterface {
  /**
   * Genera un ID único.
   * @returns Promise<Result<string, Error>> - Resultado con el ID generado o error
   */
  generateId(): Promise<Result<string, Error>>;
}
```

### Símbolo de Inyección

```typescript
export const ID_GENERATOR_INTERFACE = Symbol("ID_GENERATOR_INTERFACE");
```

## 🔄 Patrón Result

Este servicio utiliza el **Result Pattern** para manejo de errores:

```typescript
const idResult = await idGenerator.generateId();

if (idResult.ok) {
  // Éxito: usar idResult.value
  console.log('Generated ID:', idResult.value);
} else {
  // Error: manejar idResult.errors
  console.error('Error generating ID:', idResult.errors);
}
```

## 📦 Dependencias

- `@pormeldev/axis-common-lib`: Para el patrón Result y tipos comunes

## 🛠️ Scripts de Desarrollo

```bash
# Compilar
npm run build

# Ejecutar tests
npm test

# Tests en modo watch
npm run test:watch

# Coverage
npm run test:coverage
```

## 📝 Changelog

### v1.0.0
- Versión inicial con interfaz básica de generación de IDs
- Integración con `@pormeldev/axis-common-lib`
- Símbolo de inyección de dependencias


## 🔗 Enlaces Relacionados

- [@pormeldev/axis-common-lib](https://www.npmjs.com/package/@pormeldev/axis-common-lib)
- [NestJS Documentation](https://docs.nestjs.com/)
- [Ecosistema Axis](https://github.com/pormeldev)

