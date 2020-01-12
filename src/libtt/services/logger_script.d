// Copyright 2020 Danilo Spinella <danyspin97@protonmail.com>
// Distributed under the terms of the GNU General Public License v2

module libtt.services.logger_script;

import libtt.services.environment : Environment;
import libtt.services.script : Script;

class LoggerScript : Script
{
public:
    @property string destination() { return m_destination; }
    @property uint maxsize() { return m_maxsize; }

    this (
        string execute,
        string user,
        string group,
        Environment environment,
        string destination,
        uint maxsize,
        Type type,
        string shebang = ""
    ) {
        super(
            getDefaultExecute(),
            user,
            group,
            environment,
            type,
            shebang
        );
    }
private:
    string getDefaultExecute()
    {
        // TODO add default logger script
        return "";
    }

    string m_destination;
    uint m_maxsize;
}