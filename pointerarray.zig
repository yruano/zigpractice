const std = @import("std");
const expect = std.testing.expect;

test "pointer slicing" {
  var array = [_]u8 { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
  const slice = array[ 2..4 ];
  try expect(slice.len == 2);

  try expect(array[3] == 4);
  slice[1] += 1;
  try expect(array[3] == 5);
}

fn pointer() [10]u8 {
  var array = [_]u8 { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
  return array;
}

pub fn main() !void {
  const stdout = std.io.getStdOut().writer();
  const slice = pointer()[ 2..4 ];

  try stdout.print("slice.len == 2 : {}\n", .{slice.len == 2});

  try stdout.print("array[3] == 4 : {d}\n", .{pointer()[3] == 4});
  
  // 생각해보니 함수여서 간섭이안됨ㅋㅋㅋㅋ 바보였다.
  slice[1] += 1;
  try stdout.print("array[3] == 5 : {d}\n", .{pointer()[3] == 5});
}

test "comptime pointers" {
  comptime {
    var x: i32 = 1;
    const ptr = &x;
    ptr.* += 1;
    x += 1;
    try expect(ptr.* == 3);
  }
}

pub fn main() !void {
  const stdout = std.io.getStdOut().writer();

  var x: i32 = 1;
  const ptr = &x;
  try stdout.print("{d}\n", .{&x});
  try stdout.print("{d}\n", .{ptr});
  ptr.* += 1;
  try stdout.print("{d}\n", .{ptr.*});
  try stdout.print("{d}\n", .{x});
  x += 1;
  try stdout.print("ptr.* == 3 : {}\n", .{ptr.* == 3});

}

test "@ptrToInt and @intToPtr" {
  const ptr = @intToPtr(*i32, 0xdeadbee0);
  const addr = @ptrToInt(ptr);
  try expect(@TypeOf(addr) == usize);
  try expect(addr == 0xdeadbee0);
}

pub fn main() !void {
  const stdout = std.io.getStdOut().writer();
  const ptr = @intToPtr(*i32, 0xdeadbee0);
  const addr = @ptrToInt(ptr);
  try stdout.print("ptr : {}\n", .{ptr});
  try stdout.print("addr : {}\n", .{addr});

  try stdout.print("(@TypeOf(addr) == usize) : {}\n", .{(@TypeOf(addr) == usize)});
  try stdout.print("(addr == 0xdeadbee0) : {}\n", .{(addr == 0xdeadbee0)});
}