import * as T from '../types';
/**
 * Function to generate the args for genConfig functions.
 * This can be overridden as part of Orchestrator config.
 *
 * NB: Since we are using ports, there is a small chance of a race condition
 * when multiple conductors are attempting to secure ports for their interfaces.
 * In the future it would be great to move to domain socket based interfaces.
 */
export declare const localConfigSeedArgs: () => Promise<T.PartialConfigSeedArgs>;
