/**********************************************************************************/
/* Copyright by @bkozdras <b.kozdras@gmail.com>                                   */
/* Purpose: Dummy test.                                                  */
/* Version: 1.0                                                                   */
/* Licence: MIT                                                                   */
/**********************************************************************************/

#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <stdint.h>

#include <cmocka.h>

static void DummyTest(void** state)
{
    (void) state;
}

int main(void)
{
    const struct CMUnitTest tests[] =
    {
        cmocka_unit_test(DummyTest)
    };

    return cmocka_run_group_tests(tests, NULL, NULL);
}
