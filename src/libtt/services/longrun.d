module libtt.services.longrun;

import libtt.services.service;
import libtt.services.script;

class Longrun : Service {
    // Script to setup and execute the longrun program
    Script run;
    // Script to run when the longrun exits, usually to cleanup files
    Script finish;

    // Notify option of s6-rc
    ubyte notify;

    Service[] depends;
    class Logger : Script {
        string destination;
        uint maxsize;

        this() {
            // TODO add default logger script
            execute = "";
        }
    }

    this(Service s) {
        super(s);

        run = new Script();
        finish = new Script();
    }
}