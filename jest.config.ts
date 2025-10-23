export default {
    preset: 'ts-jest',
    testEnvironment: 'node',
    moduleFileExtensions: ['ts', 'js', 'json'],
    testMatch: ['**/*.spec.ts'], // Busca archivos de pruebas terminados en .spec.ts
    rootDir: './src', // Cambia esto si tus archivos fuente están en otra carpeta
    transform: {
      '^.+\\.ts$': 'ts-jest',
    },
    collectCoverage: true,
    collectCoverageFrom: ['**/*.ts', '!**/node_modules/**', '!**/dist/**'],
    coverageDirectory: '../coverage',
  };
  