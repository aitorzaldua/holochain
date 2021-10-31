export declare const quietLoggerConfig: {
    type: string;
    state_dump: boolean;
    rules: {
        rules: {
            exclude: boolean;
            pattern: string;
        }[];
    };
};
export declare const saneLoggerConfig: {
    type: string;
    rules: {
        rules: {
            exclude: boolean;
            pattern: string;
        }[];
    };
    state_dump: boolean;
};
