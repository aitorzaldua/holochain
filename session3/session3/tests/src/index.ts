
import { Orchestrator } from "@holochain/tryorama";

import session3 from './test_conf/session3';
import zome_exercise from './test_conf/zome_exercise';

let orchestrator: Orchestrator<any>;

orchestrator = new Orchestrator();
session3(orchestrator);
orchestrator.run();

orchestrator = new Orchestrator();
zome_exercise(orchestrator);
orchestrator.run();



