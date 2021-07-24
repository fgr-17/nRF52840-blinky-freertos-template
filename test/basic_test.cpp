#include <catch.hpp>

TEST_CASE("true test", "[basic]") {
    REQUIRE(1 == 1);
}

TEST_CASE("false test", "[basic]") {
    // REQUIRE(1 == 0);
}