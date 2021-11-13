const std = @import("std");

pub fn main() !void {
  cont stdout = std.io.getStdOut().writer();
  
  //"for basics"

  for (items) |value| {  
    try stdout.print("value : {d}\n", .{value});
    if (value == 0) {
      continue;
    }
    sum += value;
  }
  try stdout.print("sum : {d}\n", .{sum});

  for (items[3..5]) |value| {
    try stdout.print("value : {d}\n", .{value});
    sum += value;
  }
  try stdout.print("sum : {d}\n", .{sum});

  var sum2: i32 = 0;
  for (items) |_, i| {
    try stdout.print("@TypeOf(i) == usize : {d}\n", .{@TypeOf(i) == usize});
    sum2 += @intCast(i32, i);
  }
  try stdout.print("sum2 : {d}\n", .{sum2});

  //"for reference"
  var items = [_]i32 { 3, 4, 2 };

  for (items) |*value| {
    try stdout.print("value.* : {d}\n", .{value.*});
    value.* += 1;
    try stdout.print("value.* : {d}\n", .{value.*});
  }

  try stdout.print("items[0] == 4 : {d}\n", .{items[0] == 4});
  try stdout.print("items[1] == 5 : {d}\n", .{items[1] == 5});
  try stdout.print("items[2] == 3 : {d}\n", .{items[2] == 3});
}