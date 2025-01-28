const std = @import("std");
const testing = std.testing;

export fn gate_nand(one: bool, two: bool) bool {
    return !(one and two);
}

export fn gate_not(one: bool) bool {
    return gate_nand(one, one);
}

export fn gate_and(one: bool, two: bool) bool {
    return gate_not(gate_nand(one, two));
}

test "minimal test cases for nand" {
    try testing.expect(gate_nand(true, false) == true);
    try testing.expect(gate_nand(false, false) == true);
    try testing.expect(gate_nand(false, true) == true);
    try testing.expect(gate_nand(true, true) == false);
}

test "minimal test cases for not" {
    try testing.expect(gate_not(true) == false);
    try testing.expect(gate_not(false) == true);
}

test "minimal test cases for and" {
    try testing.expect(gate_and(true, true) == true);
    try testing.expect(gate_and(true, false) == false);
    try testing.expect(gate_and(false, true) == false);
    try testing.expect(gate_and(false, false) == false);
}
