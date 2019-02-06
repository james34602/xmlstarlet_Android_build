#pragma once

#include <boost/program_options.hpp>
#include <boost/noncopyable.hpp>

#include "ops.h"

class Options : public boost::noncopyable
{
public:
    /* XXX: add separate run() method */
    Options(int argc, char **argv);

    template <class Type>
    Type getValue(const char *optionKey) const;
    bool getValue(const char *optionKey) const; /** flags */
    Ops::Action getAction() const;

private:
    typedef boost::program_options::variables_map Map;
    typedef boost::program_options::options_description Description;

    Map m_map;
    Description m_options;
    Ops::Action m_action;

    int m_argc;
    char **m_argv;

    void addOptions();
};
