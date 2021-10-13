
import { Orchestrator } from "@holochain/tryorama";

import zome_01 from './tragedy-commons/zome_01';

let orchestrator: Orchestrator<any>;

orchestrator = new Orchestrator();
zome_01(orchestrator);
orchestrator.run();



