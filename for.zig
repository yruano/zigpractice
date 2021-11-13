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

  const stdin = std.io.getStdIn().reader();
  _ = try stdin.readByte();
}
