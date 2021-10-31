import { TestStats } from "./orchestrator";
export declare type Reporter = {
    before: (total: number) => void;
    after: (stats: TestStats) => void;
    each: (description: string) => void;
};
export declare const unit: {
    before: (..._x: any[]) => void;
    each: (..._x: any[]) => void;
    after: (..._x: any[]) => void;
};
export declare const basic: (log: any) => {
    before: (total: any) => any;
    each: (desc: any) => any;
    after: ({ successes, errors }: {
        successes: any;
        errors: any;
    }) => void;
};
