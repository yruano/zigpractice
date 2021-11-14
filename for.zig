const std = @import("std");

pub fn main() !void {
  const stdout = std.io.getStdOut().writer();

  //"for basics"
  var items1 = [_]i32{ 4, 5, 3, 4, 0 };
  var sum: i32 = 0;

  for (items1) |value| {
    try stdout.print("value : {d}\n", .{value});
      if (value == 0) {
        continue;
      }
    sum += value;
  }
  try stdout.print("sum : {d}\n", .{sum});

  for (items1[3..5]) |value| {
    try stdout.print("value : {d}\n", .{value});
    sum += value;
  }
  try stdout.print("sum : {d}\n", .{sum});

  var sum2: i32 = 0;
  for (items1) |_, i| {
    try stdout.print("@TypeOf(i) == usize : {d}\n", .{@TypeOf(i) == usize});
    sum2 += @intCast(i32, i);
  }
  try stdout.print("sum2 : {d}\n", .{sum2});

  //"for reference"
  var items2 = [_]i32{ 3, 4, 2 };

  for (items2) |*value| {
    try stdout.print("value.* : {d}\n", .{value.*});
    value.* += 1;
    try stdout.print("value.* : {d}\n", .{value.*});
  }

  try stdout.print("items[0] == 4 : {d}\n", .{items2[0] == 4});
  try stdout.print("items[1] == 5 : {d}\n", .{items2[1] == 5});
  try stdout.print("items[2] == 3 : {d}\n", .{items2[2] == 3});

  //"for else"

  var items3 = [_]?i32 { 3, 4, null, 5 };

    var sum: i32 = 0;
    const result = for (items3) |value| {
      if (value != null) {
        sum += value.?;
      }
    } else blk: {
      try stdout.print("value == 12 : {d}\n", .{value == 12});
      break :blk sum;
    };
  try stdout.print("result == 12 : {d}\n", .{result == 12});

  //"nested break"
  var conut1: usize = 0;
  outer1: for([_]i32{ 1, 2, 3, 4, 5 }) |_| {
    for([_]i32{ 1, 2, 3, 4, 5 }) |_| {
      conut1 += 1;
      try stdout.print("conut1 : {d}\n", .{conut1});
      if (conut1 == 5){
        break :outer1;
      }
    }
  }
  try stdout.print("conut1 : {d}\n", .{conut1});
  try stdout.print("conut1 == 1 : {d}\n", .{conut1 == 1});

  //"nested continue"
  var conut2: usize = 0;
  outer2: for([_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 }) |_| {
    for([_]i32{ 1, 2, 3, 4, 5 }) |_| {
      conut2 += 1;
      continue :outer2;
    }
  }
  try stdout.print("conut2 == 1\n", .{conut2 == 1});

  //"nested continue"
  var conut2: usize = 0;
  outer2: for([_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 }) |_| {
    for([_]i32{ 1, 2, 3, 4, 5 }) |_| {
      conut2 += 1;
      try stdout.print("conut2 : {d}\n", .{conut2});
      continue :outer2;
    }
    
  }
  try stdout.print("conut2 == 8 : {d}\n", .{conut2 == 8});

  const nums = [_]i32{ 2, 4, 6};
  var sum: usize = 0;
  inline for (nums) |i| {
    const T = switch (i) {
      2 => f32,
      4 => i8,
      6 => bool,
      else => unreachable,
    };
    try stdout.print("sum : {d}\n", .{sum});
    try stdout.print("@typeName(T).len : {d}\n", .{@typeName(T).len});
    sum += typeNameLength(T);
    try stdout.print("T : {d}\n", .{T});
  }
  try stdout.print("sum == 9 : {d}\n", .{sum == 9});

  const stdin = std.io.getStdIn().reader();
  _ = try stdin.readByte();
}

fn typeNameLength(comptime T: type) usize {
  return @typeName(T).len;
}