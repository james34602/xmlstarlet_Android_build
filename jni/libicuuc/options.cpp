#include "options.h"

#include <cstdlib>

Options::Options(int argc, char **argv)
    : m_argc(argc)
    , m_argv(argv)
    , m_action(nullptr)
{
    try {
        addOptions();

        if (getValue("help")) {
            std::cout << m_options;
            exit(EXIT_SUCCESS);
        }
    } catch (const std::exception &e) {
        std::cerr << e.what() << std::endl;
        std::cerr << m_options;
        exit(EXIT_FAILURE);
    }
}

template <class Type>
Type Options::getValue(const char *optionKey) const
{
    if (!m_map.count(optionKey)) {
        return Type();
    }
    return m_map[optionKey].as<Type>();
}
bool Options::getValue(const char *optionKey) const
{
    return m_map.count(optionKey);
}
Ops::Action Options::getAction() const
{
    assert(m_action);
    return m_action;
}

void Options::addOptions()
{
    namespace po = boost::program_options;

    static const int style =
        (po::command_line_style::unix_style ^
         po::command_line_style::allow_guessing) |
        po::command_line_style::allow_long_disguise;

#define O(definition, callback, ...)                  \
    (definition,                                      \
     po::bool_switch()->notifier([this](bool yep) {   \
         if (yep) {                                   \
             m_action = &Ops::callback;               \
         }                                            \
     }),                                              \
     ##__VA_ARGS__)

    m_options.add_options()
        ("help,h", "Show help message")
        O("normalize,n", normalize)
        O("lower,l", lower)
        O("upper,u", upper)
        O("title,t", title)
        O("fold-case,f", foldCase)
    ;

    po::store(po::command_line_parser(m_argc, m_argv)
              .style(style)
              .options(m_options)
              .run(), m_map);
    po::notify(m_map);
}
