const std = @import("std");
const os = std.os;
const assert = std.assert;

pub fn main() !void {
  const stdout = std.io.getStdOut().writer();
  
  const num_sum_num: i32 = 1 + 1;
  try stdout.print("1 + 1 = {d}\n" ,.{num_sum_num});

  const num_div_num: f32 = 7.0 / 5.0;
  try stdout.print("7.0 / 5.0 = {d}\n" ,.{num_div_num});

  //try stdout.print("{}\n{}\n{}\n{}\n{}\n{}\n{}\n{}\n",.{true or false, true and false, true or true, true and true, false or false, false and false, !true, !false});

  var optional_val: ?[]const u8 = null;
  try stdout.print("optional_val type: {s}\nval: {s}\n" ,.{@typeName(@TypeOf(optional_val)), optional_val});

  optional_val = "hi";
  try stdout.print("optional_val type: {s}\nval: {s}\n" ,.{@typeName(@TypeOf(optional_val)), optional_val});

  var num_error: anyerror!i32 = error.ArgNotFound;
  try stdout.print("num_error type: {s}\nval: {d}\n" ,.{@typeName(@TypeOf(num_error)), num_error});

  num_error = 1234;
  try stdout.print("num_error type: {s}\nval: {d}\n" ,.{@typeName(@TypeOf(num_error)), num_error});
}