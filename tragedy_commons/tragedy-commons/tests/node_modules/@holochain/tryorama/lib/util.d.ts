import { ObjectS } from './types';
export declare const delay: (ms: number) => Promise<unknown>;
export declare const trace: (x: any, msg?: string) => any;
export declare const stringify: (x: any) => string;
export declare const stripPortFromUrl: (url: any) => any;
export declare function promiseSerialArray<T>(promises: Array<Promise<T>>): Promise<Array<T>>;
export declare function promiseSerialObject<T>(promises: ObjectS<Promise<T>>): Promise<ObjectS<T>>;
/** @deprecated */
export declare const downloadFile: ({ url, path, overwrite }: {
    url: string;
    path: string;
    overwrite?: boolean | undefined;
}) => Promise<void>;
export declare const unimplemented: (reason: string) => never;
