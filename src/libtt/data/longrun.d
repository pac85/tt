// Copyright 2020 Danilo Spinella <danyspin97@protonmail.com>
// Distributed under the terms of the GNU General Public License v2

module libtt.data.longrun;

import libtt.data.logger_script : LoggerScript;
import libtt.data.longrun_options : LongrunOptions;
import libtt.data.script : Script;
import libtt.data.service : Service;

class Longrun : Service
{
public:
    @property ref Script run () { return m_run; }
    @property ref Script finish () { return m_finish; }
    @property void finish(Script finish) { m_finish = finish; }
    @property LoggerScript logger()
    {
        if (m_logger is null)
        {
            return defaultLogger;
        }

        return m_logger;
    }
    @property void logger(LoggerScript logger) { m_logger = logger; }

    this(
        string name,
        string polishName,
        string description,
        string path,
        ref LongrunOptions options,
        ref Script run,
    ) {
        super(
            name,
            polishName,
            description,
            path,
            options
        );

        m_run = run;
    }

private:
    LoggerScript defaultLogger()
    {
        // TODO: instance a LoggerScript object
        return null;
    }

    Script m_run;
    Script m_finish;
    LoggerScript m_logger;
}
