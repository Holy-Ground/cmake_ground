// Copyright (c) 2023 HolyGround, All Rights Reserved.
// Authors: EunSung Yang

#include "gtest/gtest.h"

#include "example/utils.hpp"

namespace holyground::example {
TEST(ExampleUtils, Print) { EXPECT_NO_THROW(example::Print("for test")); }
} // namespace holyground::example
