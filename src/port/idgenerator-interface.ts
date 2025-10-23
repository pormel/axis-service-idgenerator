import { Result } from "@pormeldev/axis-common-lib";

export interface IgGeneratorInterface {

  /**
   * Genera un ID único.
   */
  generateId(): Promise<Result<string, Error>>;


}

export const ID_GENERATOR_INTERFACE = Symbol("ID_GENERATOR_INTERFACE");
