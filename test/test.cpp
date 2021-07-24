#define CATCH_CONFIG_MAIN
#include <catch.hpp>

TEST_CASE("Basic test", "[basic]") {
    REQUIRE(1 == 1);
}