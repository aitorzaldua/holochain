export declare const mkdirIdempotent: (dir: any) => any;
export declare const tempDir: () => Promise<any>;
/**
 * Directory to store downloaded DNAs in.
 * **NOTE**: this is currently shared among all runs over all time, for better caching.
 * TODO: change this to `tempDir` instead of `tempDirBase` to remove this overzealous caching!
 */
export declare const dnaDir: () => Promise<any>;
export declare const dnaPathToId: (dnaPath: any) => any;
