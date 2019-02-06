#define IN_LIBEXSLT
#include "libexslt/libexslt.h"

#include <libxml/xmlversion.h>

//#include "config.h"

//#include <libxslt/xsltconfig.h>
#include <libxslt/extensions.h>

//#include <libexslt/exsltconfig.h>
#include "exslt.h"

/**
 * exsltRegisterAll:
 *
 * Registers all available EXSLT extensions
 */
void
exsltRegisterAll (void) {
    xsltInitGlobals();
    exsltCommonRegister();
#ifdef EXSLT_CRYPTO_ENABLED
    exsltCryptoRegister();
#endif
    exsltMathRegister();
    exsltSetsRegister();
    exsltFuncRegister();
    exsltStrRegister();
    exsltDateRegister();
    exsltSaxonRegister();
    exsltDynRegister();
}

