#define CATCH_CONFIG_MAIN
#include <catch2/catch_all.hpp>

TEST_CASE("Dummy check", "[dummy]" ) {
    REQUIRE(1 == 1);
}
