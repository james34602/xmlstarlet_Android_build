#pragma once

#include <boost/noncopyable.hpp>

#include <unicode/utypes.h>
#include <unicode/normalizer2.h>
#include <string>

class Ops : public boost::noncopyable
{
public:
    typedef std::string &(Ops::*Action)(std::string &);

    Ops();

    std::string &normalize(std::string &input);
    std::string &lower(std::string &input);
    std::string &upper(std::string &input);
    std::string &title(std::string &input);
    std::string &foldCase(std::string &input);

private:
    std::string m_output;

    UErrorCode m_status;
    const Normalizer2 &m_normalizer;
};


