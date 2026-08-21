const std = @import("std");

///_Maps function onto array items_
///*inputTypes*: type of items in input array
///*outputTypes*: type of items in output array
///*function*: the function to be applied to each item
///*arr*: the array that will have the function applied to its items
///*output*: an array of outputTypes that will contain the result
pub fn map( comptime inputTypes: type, comptime outputTypes: type, function: anytype, arr: []const inputTypes, output: []outputTypes ) void {
    for (arr, 0..) |val, index| {
        output[index] = function(val);
    }
}

///_Folds function from left_
///*inputTypes*: type of items in input array
///*outputTypes*: type of item to be returned
///*function*: the function to be used when folding *(must take 2 parameters)*
///*arr*: the array that will be folded
///*initial*: starting value for fold operation
pub fn foldl( comptime inputType: type, comptime outputType: type, function: anytype, arr: []const inputType, initial: outputType ) outputType {
    var acc: outputType = initial;

    for (arr) |item| {
        acc = function(acc, item);
    }

    return acc;
}

///_Folds function from right_
///*inputTypes*: type of items in input array
///*outputTypes*: type of item to be returned
///*function*: the function to be used when folding *(must take 2 parameters)*
///*arr*: the array that will be folded
///*initial*: starting value for fold operation
pub fn foldl( comptime inputType: type, comptime outputType: type, function: anytype, arr: []const inputType, initial: outputType ) outputType {
    var acc: outputType = initial;

    for (arr) |item| {
        acc = function(acc, item);
    }

    return acc;
}



//---------------------------------------------------------------------
pub fn double(x: anytype) @TypeOf(x) {
    return x * 2;
}

pub fn add(x: anytype, y: anytype) @TypeOf(x) {
    return x + y;
}

pub fn main() void {
    const tester = [_]u8{0, 2, 4, 6};
    var outArr: [4]u8 = undefined;

    foldl(comptime inputType: type, comptime outputType: type, function: anytype, arr: []const inputType, initial: outputType)
    map(u8, u8, double, &tester, &outArr);

    std.debug.print("map test: \n {any}\n\n", .{outArr});

    std.debug.print("foldl test: \n {any}\n\n", .{foldl(u8, u8, add, &tester, 0)});
}
