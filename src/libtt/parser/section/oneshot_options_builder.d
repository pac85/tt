// Copyright 2020 Danilo Spinella <danyspin97@protonmail.com>
// Distributed under the terms of the GNU General Public License v2

module libtt.parser.section.oneshot_options_builder;

import libtt.exception : BooleanParseException, BuilderException;
import libtt.parser.section.options_builder : OptionsBuilder;
import libtt.parser.line : MultilineValueParser;
import libtt.parser.utils : parseBoolean;
import libtt.data : OneshotOptions;

class OneshotOptionsBuilder : OptionsBuilder
{
public:
    this(OneshotOptions oneshotOptions)
    {
        this.oneshotOptions = oneshotOptions;
    }

protected:
    override void setParamByKey(string key, string value)
    {
        try
        {
            trySetParamByKey(key, value);
        }
        catch (BooleanParseException e)
        {
            auto msg = e.msg ~ ` while parsing key "` ~ key ~ `"`;
            throw new BuilderException(msg);
        }
    }

    override void saveValuesOfParser(ref MultilineValueParser parser)
    {
        switch (parser.key)
        {
            case "depends":
                oneshotOptions.dependencies = parser.values;
                break;
            default:
                auto errorMessage = `Camp named "` ~ parser.key ~
                        `" is not allowed in section [options]`;
                throw new Exception(errorMessage);
        }
    }

private:
    void trySetParamByKey(string key, string value)
    {
        switch (key)
        {
            case "optional":
                oneshotOptions.optional = parseBoolean(value);
                break;
            case "write_message":
                oneshotOptions.writeMessage = parseBoolean(value);
                break;
            default:
                auto errorMessage = `Camp named "` ~ key ~ `" is not allowed`
                        ~ " in section [options]";
                throw new Exception(errorMessage);
        }
    }

    OneshotOptions oneshotOptions;
}

