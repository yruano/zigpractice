const std = @import("std");
const os = std.os;
const assert = std.assert;
const mem = std.mem;

pub fn main() !void {
  const stdout = std.io.getStdOut().writer();
  
  const num_sum_num: i32 = 1 + 1;
  try stdout.print("1 + 1 = {d}\n" , .{num_sum_num});

  const num_div_num: f32 = 7.0 / 5.0;
  try stdout.print("7.0 / 5.0 = {d}\n" , .{num_div_num});

  //try stdout.print("{}\n{}\n{}\n{}\n{}\n{}\n{}\n{}\n", .{true or false, true and false, true or true, true and true, false or false, false and false, !true, !false});

  var optional_val: ?[]const u8 = null;
  try stdout.print("optional_val type: {s}\nval: {s}\n" , .{@typeName(@TypeOf(optional_val)), optional_val});

  optional_val = "hi";
  try stdout.print("optional_val type: {s}\nval: {s}\n" , .{@typeName(@TypeOf(optional_val)), optional_val});

  var num_error: anyerror!i32 = error.ArgNotFound;
  try stdout.print("num_error type: {s}\nval: {d}\n" , .{@typeName(@TypeOf(num_error)), num_error});

  num_error = 1234;
  try stdout.print("num_error type: {s}\nval: {d}\n" , .{@typeName(@TypeOf(num_error)), num_error});

  const bytes = "hello";
  try stdout.print("@typeName(@TypeOf(bytes)): {s}\n", .{@typeName(@TypeOf(bytes))});
  try stdout.print("bytes.len: {d}\n", .{bytes.len});
  try stdout.print("bytes[1]: {u}\n", .{bytes[1]});
  try stdout.print("bytes[5]: {u}\n", .{bytes[5]});
  try stdout.print("e == \x65: {}\n", .{'e' == '\x65'});
  try stdout.print("\u{1f4ag} : {d}\n", .{'\u{1f4ag}'});
  try stdout.print("💯 : {d}\n", .{'💯'});
  try stdout.print("mem.eql(u8, bytes, h\x65llo): {}\n", .{mem.eql(u8, bytes, "h\x65llo")});
  try stdout.print("\xff[0]: {x}\n", .{"\xff"[0]});
  try stdout.print("⚡ : {u}\n", .{'⚡'});


  //foo();
  var y: i32 = 5726;
  
  y += 1;
  try stdout.print("{d}\n", .{y});

  // 변수를 초기화해야합니다  variables must be initialized
  //var x: i32;
  //x = 1;

  var x: i32 = undefined;
  x = 1;
  try stdout.print("{d}\n", .{x});
}
fn foo() !void {
  const y = 5726;
  // 상수는 변환 불가능
  y += 1;
}