with Text_IO; use Text_IO;

procedure imp3ada is

   package Int_IO is new Text_IO.Integer_IO(INTEGER);
   use Int_IO;

   My_File  : FILE_TYPE;
   One_Char : CHARACTER;
   line      : INTEGER;
Line_content : String(1..200);
N : Natural;
   state     : INTEGER;
   new_state : INTEGER;
   host_name : STRING(1..100);
   global_key: STRING(1..100);
   host_key  : STRING(1..100);
   global_str: STRING(1..100);
   host_str  : STRING(1..100);
   global_quoted_str: STRING(1..100);
   host_quoted_str: STRING(1..100);
   global_int: STRING(1..100);
   host_int  : STRING(1..100);
   global_float: STRING(1..100);
   host_float  : STRING(1..100);
   host_name_pos  : INTEGER;
   global_key_pos : INTEGER;
   host_key_pos   : INTEGER;
   global_str_pos : INTEGER;
   host_str_pos   : INTEGER;
   global_quoted_str_pos : INTEGER;
   host_quoted_str_pos   : INTEGER;
   global_int_pos : INTEGER;
   host_int_pos   : INTEGER;
   global_float_pos : INTEGER;
   host_float_pos   : INTEGER;
   global_set       : STRING(1..2000);
   global_set_pos   : INTEGER;
   global_override  : BOOLEAN;
   host_set       : STRING(1..2000);
   host_set_pos   : INTEGER;
   host_override  : BOOLEAN;
   tmp_set       : STRING(1..2000);
   tmp_set_pos   : INTEGER;
   global_content: STRING(1..5000);
   host_content: STRING(1..5000);
   correct_content: STRING(1..5000);
   global_content_pos: INTEGER;
   host_content_pos: INTEGER;
   correct_content_pos: INTEGER;
   add_flag : BOOLEAN;


   type STATE_ARRAY is array(1..805) of INTEGER;
   type INPUT_ARRAY is array(1..805) of CHARACTER;

   States : STATE_ARRAY := (1, 1, 1, 1, 2, 1, 3, 4, 5, 6, 7, 8, 8, 8, 8, 9, 8, 10, 11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 28, 28, 28, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 29, 35, 35, 30, 30, 30, 30, 30, 33, 33, 33, 33, 33, 34, 34, 34, 34, 34, 37, 37, 37, 37, 37, 31, 31, 31, 31, 31, 32, 10, 12, 12, 12, 12, 13, 12, 12, 14, 14, 14, 14, 15, 14, 16, 17, 18, 19, 19, 19, 19, 20, 20, 20, 20, 21, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 24, 23, 25, 25, 25, 25, 26, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 39, 39, 39, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 40, 46, 46, 41, 41, 41, 41, 41, 44, 44, 44, 44, 44, 45, 45, 45, 45, 45, 48, 48, 48, 48, 48, 42, 42, 42, 42, 42, 43);
   Next_States : STATE_ARRAY := (1, 1, 1, 2, 1, 3, 4, 5, 6, 7, 8, 8, 8, 8, 9, 8, 10, 11, 10, 10, 10, 10, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 29, 28, 28, 28, 28, 29, 29, 29, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 35, 36, 37, 10, 12, 32, 31, 31, 10, 12, 32, 31, 31, 10, 12, 32, 31, 31, 10, 12, 32, 31, 31, 31, 31, 10, 12, 32, 10, 12, 12, 12, 12, 13, 12, 16, 14, 14, 14, 14, 15, 14, 16, 17, 18, 19, 20, 20, 20, 21, 20, 20, 20, 21, 20, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 24, 25, 22, 22, 22, 23, 23, 23, 24, 23, 25, 25, 25, 25, 26, 25, 12, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 40, 39, 39, 39, 39, 40, 40, 40, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 46, 47, 48, 25, 12, 43, 42, 42, 25, 12, 43, 42, 42, 25, 12, 43, 42, 42, 25, 12, 43, 42, 42, 42, 42, 25, 12, 43, 25);
   Input_Characters : INPUT_ARRAY := (ASCII.HT, ASCII.LF, ' ', '#', ASCII.LF, 'g', 'l', 'o', 'b', 'a', 'l', ASCII.HT, ASCII.LF, ' ', '#', ASCII.LF, '{', '#', ASCII.LF, ASCII.HT, ASCII.LF, ' ', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '_', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '_', '=', ASCII.HT, ' ', ASCII.HT, ' ', '=', ASCII.HT, ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '-', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '/', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '/', '-', '.', '_', '"', '\', '"', ASCII.LF, '}', '#', ASCII.HT, ' ', ASCII.LF, '}', '#', ASCII.HT, ' ', ASCII.LF, '}', '#', ASCII.HT, ' ', ASCII.LF, '}', '#', ASCII.HT, ' ', ASCII.HT, ' ', ASCII.LF, '}', '#', ASCII.LF, '}', ASCII.HT, ASCII.LF, ' ', '#', ASCII.LF, 'h', ';', ASCII.HT, ASCII.LF, ' ', '#', ASCII.LF, 'h', 'o', 's', 't', ASCII.HT, ASCII.LF, ' ', '#', ASCII.HT, ASCII.LF, ' ', '#', ASCII.LF, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '_', '-', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ASCII.HT, ASCII.LF, ' ', '#', '{', '.', '_', '-', ASCII.HT, ASCII.LF, ' ', '#', ASCII.LF, '{', ASCII.HT, ASCII.LF, ' ', '#', ASCII.LF, '}', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '_', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '_', '=', ASCII.HT, ' ', ASCII.HT, ' ', '=', ASCII.HT, ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '-', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '/', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '/', '-', '.', '_', '"', '\', '"', ASCII.LF, '}', '#', ASCII.HT, ' ', ASCII.LF, '}', '#', ASCII.HT, ' ', ASCII.LF, '}', '#', ASCII.HT, ' ', ASCII.LF, '}', '#', ASCII.HT, ' ', ASCII.HT, ' ', ASCII.LF, '}', '#', ASCII.LF);
   --Input_Characters : INPUT_ARRAY := ('\t', '\n', ' ', '#', '\n', 'g', 'l', 'o', 'b', 'a', 'l', '\t', '\n', ' ', '#', '\n', '{', '#', '\n', '\t', '\n', ' ', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '_', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '_', '=', '\t', ' ', '\t', ' ', '=', '\t', ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '-', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '/', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '/', '-', '.', '_', '"', '\\', '"', '\n', '}', '#', '\t', ' ', '\n', '}', '#', '\t', ' ', '\n', '}', '#', '\t', ' ', '\n', '}', '#', '\t', ' ', '\t', ' ', '\n', '}', '#', '\n', '}', '\t', '\n', ' ', '#', '\n', 'h', ';', '\t', '\n', ' ', '#', '\n', 'h', 'o', 's', 't', '\t', '\n', ' ', '#', '\t', '\n', ' ', '#', '\n', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '_', '-', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '\t', '\n', ' ', '#', '{', '.', '_', '-', '\t', '\n', ' ', '#', '\n', '{', '\t', '\n', ' ', '#', '\n', '}', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '_', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '_', '=', '\t', ' ', '\t', ' ', '=', '\t', ' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '-', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '/', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '/', '-', '.', '_', '"', '\\', '"', '\n', '}', '#', '\t', ' ', '\n', '}', '#', '\t', ' ', '\n', '}', '#', '\t', ' ', '\n', '}', '#', '\t', ' ', '\t', ' ', '\n', '}', '#', '\n');

   procedure findState(oldstate : in     INTEGER;
                       charactor: in     CHARACTER;
                       nextstate: out    INTEGER) is
   begin
      for Index in 1..805 loop
         if States(Index) = oldstate and Input_Characters(Index) = charactor then
            nextstate := Next_States(Index);
            return;
         end if;
      end loop;
      nextstate := -1;
   end findState;

   procedure checkOverride(new_key : in STRING;
                           key_size: in INTEGER;
                           in_set  : in STRING;
                           out_set : out STRING;
                           in_set_pos: in INTEGER;
                           out_set_pos: out INTEGER;
                           is_override: out BOOLEAN) is
   begin
     for Index in 1..(in_set_pos - key_size) loop
         if in_set(Index) = '^' and in_set((Index + 1)..(Index + key_size)) = new_key(1..key_size) then
            is_override := TRUE;
            out_set_pos := in_set_pos;
            return;
         end if;
     end loop;
     is_override := FALSE;
     out_set_pos := in_set_pos + key_size + 2;
     --out_set_pos := in_set_pos;
     out_set(1..out_set_pos) := in_set(1..in_set_pos) & '^' & new_key(1..key_size) & '$';
   end checkOverride;

   procedure getKeyFloat(old_statel  : in     INTEGER;
                         old_stater  : in     INTEGER;
                         new_statel  : in     INTEGER;
                         new_stater  : in     INTEGER;
                         orig        : in     STRING;
                         char        : in     CHARACTER;
                         base_int    : in     STRING;
                         int_pos     : in     INTEGER;
                         float_pos   : in     INTEGER;
                         out_pos     : out    INTEGER;
                         newkeyvalue : out    STRING) is
   begin
      if old_statel = old_stater and new_statel = new_stater then
          out_pos := int_pos + 1;
          newkeyvalue(1..out_pos) := base_int(1..int_pos) & char;
      else
          if new_statel = new_stater then
              out_pos := float_pos + 1;
              newkeyvalue(out_pos) := char;
          else
              newkeyvalue := orig;
              out_pos := float_pos;
          end if;
      end if;
   end getKeyFloat;

   procedure getKeyValue(old_statel  : in     INTEGER;
                         old_stater  : in     INTEGER;
                         new_statel  : in     INTEGER;
                         new_stater  : in     INTEGER;
                         orig        : in     STRING;
                         char        : in     CHARACTER;
                         in_pos      : in     INTEGER;
                         out_pos     : out    INTEGER;
                         newkeyvalue : out    STRING) is
   begin
      if old_statel = old_stater and new_statel = new_stater then
          out_pos := 1;
          newkeyvalue(out_pos) := char;
      else
          if new_statel = new_stater then
              --newkeyvalue := orig & char;
              --findSpace(orig, space_place);
              --Put(space_place);
              --newkeyvalue(1..space_place) := orig(1..(space_place-1)) & char;
              out_pos := in_pos + 1;
              newkeyvalue(out_pos) := char;
          else
              newkeyvalue := orig;
              out_pos := in_pos;
          end if;
      end if;
   end getKeyValue;

   procedure getKeyQuotedStr(old_statel  : in     INTEGER;
                             old_stater  : in     INTEGER;
                             new_statel  : in     INTEGER;
                             new_stater  : in     INTEGER;
                             orig        : in     STRING;
                             char        : in     CHARACTER;
                             quoted_list : in     INTEGER;
                             in_pos      : in     INTEGER;
                             out_pos     : out    INTEGER;
                             newkeyvalue : out    STRING) is
   begin
      if old_statel = old_stater and new_statel = new_stater then
          out_pos := 1;
          newkeyvalue(out_pos) := char;
      else
          if new_statel = quoted_list or new_statel = (quoted_list + 1) then
              out_pos := in_pos + 1;
              newkeyvalue(out_pos) := char;
          else
              newkeyvalue := orig;
              out_pos := in_pos;
          end if;
      end if;
   end getKeyQuotedStr;

   function Strip_Leading_Blank (Str : String)
       return String is
   begin -- Strip_Leading_Blank
       if Str (Str'First) = ' ' then
       return Str (1+Str'First .. Str'Last);
      else
      return Str;
      end if;
   end Strip_Leading_Blank;

   procedure globalhostQuotedBody(key        : in STRING;
                            value      : in STRING;
                            key_size   : in INTEGER;
                            value_size   : in INTEGER;
                            value_type : in CHARACTER;
                            override   : in BOOLEAN;
                            in_local_content : in STRING;
                            out_local_content : out STRING;
                            in_local_content_pos : in INTEGER;
                            out_local_content_pos : out INTEGER) is
   begin
     if value = "" then
        out_local_content := in_local_content;
        out_local_content_pos := in_local_content_pos;
     elsif override then
        --Put("    " & value_type & ":O:" & key & ':' & value & ASCII.LF);
        out_local_content_pos := in_local_content_pos + 4 + 1 + 3 + key_size + 1 + 2 + value_size + 3 + 1;
        out_local_content((in_local_content_pos + 1)..out_local_content_pos) := "    " & value_type & ":O:" & key & ':' & '"' & '"' & value & '"' & '"' & '"' & ASCII.LF;
     else
        --Put("    " & value_type & "::" & key & ':' & value & ASCII.LF);
        out_local_content_pos := in_local_content_pos + 4 + 1 + 2 + key_size + 1 + 2 + value_size + 3 + 1;
        out_local_content((in_local_content_pos + 1)..out_local_content_pos) := "    " & value_type & "::" & key & ':' & '"' & '"' & value & '"' & '"' & '"' & ASCII.LF;
     end if;
   end globalhostQuotedBody;

   procedure globalhostBody(key        : in STRING;
                            value      : in STRING;
                            key_size   : in INTEGER;
                            value_size   : in INTEGER;
                            value_type : in CHARACTER;
                            override   : in BOOLEAN;
                            in_local_content : in STRING;
                            out_local_content : out STRING;
                            in_local_content_pos : in INTEGER;
                            out_local_content_pos : out INTEGER) is
   begin
     if value = "" then
        out_local_content := in_local_content;
        out_local_content_pos := in_local_content_pos;
     elsif override then
        --Put("    " & value_type & ":O:" & key & ':' & value & ASCII.LF);
        out_local_content_pos := in_local_content_pos + 4 + 1 + 3 + key_size + 1 + value_size + 1;
        out_local_content((in_local_content_pos + 1)..out_local_content_pos) := "    " & value_type & ":O:" & key & ':' & value & ASCII.LF;
     else
        --Put("    " & value_type & "::" & key & ':' & value & ASCII.LF);
        out_local_content_pos := in_local_content_pos + 4 + 1 + 2 + key_size + 1 + value_size + 1;
        out_local_content((in_local_content_pos + 1)..out_local_content_pos) := "    " & value_type & "::" & key & ':' & value & ASCII.LF;
     end if;
   end globalhostBody;

   procedure escaped_quotedstr(in_quotedstr : in STRING;
                               out_quotedstr : out STRING; 
                               in_quotedstr_pos : in INTEGER; 
                               out_quotedstr_pos : out INTEGER) is
   Index : INTEGER;
   tab   : INTEGER;
   begin
     if in_quotedstr_pos = 0 then
        out_quotedstr := in_quotedstr;
        out_quotedstr_pos := in_quotedstr_pos;
        return;
     else
       Index := 1;
       tab := 0;
       while Index <= in_quotedstr_pos loop
           if in_quotedstr(Index) = '\' then
              Index := Index + 1;
              tab := tab + 1;
              if in_quotedstr(Index) = 'n' then
                 out_quotedstr(Index - tab) := ASCII.LF;
              elsif in_quotedstr(Index) = 'r' then
                 out_quotedstr(Index - tab) := ASCII.CR;
              elsif in_quotedstr(Index) = '\' then
                 out_quotedstr(Index - tab) := '\';
              else
                 out_quotedstr(Index - tab) := in_quotedstr(Index);
              end if;
           else
              out_quotedstr(Index - tab) := in_quotedstr(Index);
           end if;
           Index := Index + 1;
       end loop;
       out_quotedstr_pos := in_quotedstr_pos - tab;
     end if;
   end escaped_quotedstr;

   procedure correctBody(title          : in STRING;
                         in_title_pos   : in INTEGER; 
                         in_content     : in STRING;
                         in_content_pos : in INTEGER;
                         in_add_flag  : in BOOLEAN;
                         out_add_flag  : out BOOLEAN;
                         in_whole_content : in STRING;
                         out_whole_content : out STRING;
                         in_whole_content_pos : in INTEGER;
                         out_whole_content_pos : out INTEGER) is
   begin
   if in_add_flag = TRUE then
     --Put(in_title_pos);
     --Put(in_content_pos);
     --Put(in_whole_content_pos);
     if in_content_pos = 0 then
       out_whole_content_pos := in_whole_content_pos + in_title_pos + 1;
       out_whole_content((in_whole_content_pos + 1)..out_whole_content_pos) := title & ASCII.LF;
       out_add_flag := FALSE;
     else
       if in_content(in_content_pos) = ASCII.LF then
         out_whole_content_pos := in_whole_content_pos + in_title_pos + 1 + in_content_pos;
         out_whole_content((in_whole_content_pos + 1)..out_whole_content_pos) := title & ASCII.LF & in_content;
       else
         out_whole_content_pos := in_whole_content_pos + in_title_pos + 1 + in_content_pos + 1;
         out_whole_content((in_whole_content_pos + 1)..out_whole_content_pos) := title & ASCII.LF & in_content & ASCII.LF;
       end if;
       out_add_flag := FALSE;
     end if;
   else
     out_whole_content_pos := in_whole_content_pos;
     out_whole_content := in_whole_content;
     out_add_flag := FALSE;
   end if;
   end correctBody;

begin

   line  := 0;
   state := 1;
   host_name_pos  := 0;
   global_key_pos := 0;
   host_key_pos   := 0;
   global_str_pos := 0;
   host_str_pos := 0;
   global_quoted_str_pos:= 0;
   host_quoted_str_pos:= 0;
   global_int_pos := 0;
   host_int_pos := 0;
   global_float_pos := 0;
   host_float_pos := 0;
   global_set_pos := 0;
   host_set_pos := 0;
   tmp_set_pos := 0;
   global_content_pos := 0;
   host_content_pos := 0;
   correct_content_pos := 0;
   add_flag := TRUE;

   open(My_File,In_File, "test.cfg");

   loop       -- using a look ahead method
      exit when End_Of_File(My_File);
      --begin
        Get_Line(My_File,Line_content,N);
        line := line + 1;
      --exception
      --  when END_ERROR =>
      --    One_Char := ASCII.LF;
      --end;
      --Put(One_Char);
      --Put(line);
      --if End_Of_Line(My_File) then
      --   if End_Of_File(My_File) then
      --      line := line;
      --   else
      --      line := line + 1;
            --Put(One_Char);
            --Put(line);
      --   end if;
         --New_Line;
      --end if;

      for iter in 1..(N+1) loop
        if iter <= N then
          One_Char := Line_content(iter);
        else
          One_Char := ASCII.LF;
        end if;
        --Put(state);
        findState(state, One_Char, new_state);
        --Put(One_Char);
        --Put(line);
        --Put(new_state);
        --New_Line;
        if new_state = -1 then
          if state = 2 or state = 9 or state = 11 or state = 13 or state = 15 or state = 21 or state = 24 or state = 26 or state = 32 or state = 43 then
            Put("");
          elsif state = 35 or state = 36 then
            global_quoted_str_pos := global_quoted_str_pos + 1;
            global_quoted_str(global_quoted_str_pos) := One_Char;
            if state = 36 then
              state := 35;
            elsif iter = (N+1) then
              state := 58;
              Put(correct_content(1..correct_content_pos));
              Put_Line("ERR:P:"&Strip_Leading_Blank(Integer'Image(line)));
              return;
            end if;
          elsif state = 46 or state = 47 then
            host_quoted_str_pos := host_quoted_str_pos + 1;
            host_quoted_str(host_quoted_str_pos) := One_Char;
            if state = 47 then
              state := 46;
            elsif iter = (N+1) then
              state := 58;
              Put(correct_content(1..correct_content_pos));
              Put_Line("ERR:P:"&Strip_Leading_Blank(Integer'Image(line)));
              return;
            end if;
          else
            Put(correct_content(1..correct_content_pos));
            Put_Line("ERR:P:"&Strip_Leading_Blank(Integer'Image(line)));
            return;
          end if;
          --if iter = N then
          --  findState(state, ASCII.LF, state);
          --end if;
        else
          --Put(new_state);
          getKeyValue(state, 20, new_state, 22, host_name,  One_Char, host_name_pos,  host_name_pos, host_name);
          getKeyValue(state, 10, new_state, 27, global_key, One_Char, global_key_pos, global_key_pos, global_key);
          getKeyValue(state, 25, new_state, 38, host_key,   One_Char, host_key_pos,   host_key_pos, host_key);

          getKeyFloat(state, 30, new_state, 33, global_float, One_Char, global_int, global_int_pos, global_float_pos, global_float_pos, global_float);
          getKeyFloat(state, 41, new_state, 44, host_float  , One_Char, host_int,   host_int_pos,   host_float_pos,   host_float_pos,   host_float);

          if global_float_pos = 0 then
             getKeyValue(state, 29, new_state, 30, global_int, One_Char, global_int_pos, global_int_pos, global_int);
          else
             global_int_pos := 0;
          end if;

          if host_float_pos = 0 then
             getKeyValue(state, 40, new_state, 41, host_int,   One_Char, host_int_pos,   host_int_pos,   host_int);
          else
             host_int_pos := 0;
          end if;

          getKeyValue(state, 29, new_state, 34, global_str, One_Char, global_str_pos, global_str_pos, global_str);
          getKeyValue(state, 40, new_state, 45, host_str,   One_Char, host_str_pos,   host_str_pos, host_str);

          getKeyQuotedStr(state, 29, new_state, 35, global_quoted_str, One_Char, 35, global_quoted_str_pos, global_quoted_str_pos, global_quoted_str);
          getKeyQuotedStr(state, 40, new_state, 46, host_quoted_str,   One_Char, 46, host_quoted_str_pos,   host_quoted_str_pos,   host_quoted_str);

          if (state > 26 and state < 38) and (new_state = 10 or new_state = 12) then
             --Put("GLOBAL ");
             --New_Line;

             checkOverride(global_key(1..global_key_pos), global_key_pos, global_set, global_set, global_set_pos, global_set_pos, global_override);
             --New_Line;
             --Put(global_set(1..global_set_pos));
             --New_Line;
             globalhostBody(global_key(1..global_key_pos), global_int(1..global_int_pos), global_key_pos, global_int_pos, 'I', global_override, global_content, global_content, global_content_pos, global_content_pos);
             globalhostBody(global_key(1..global_key_pos), global_float(1..global_float_pos), global_key_pos, global_float_pos, 'F', global_override, global_content, global_content, global_content_pos, global_content_pos);
             globalhostBody(global_key(1..global_key_pos), global_str(1..global_str_pos), global_key_pos, global_str_pos, 'S', global_override, global_content, global_content, global_content_pos, global_content_pos);
             escaped_quotedstr(global_quoted_str(1..global_quoted_str_pos), global_quoted_str(1..global_quoted_str_pos), global_quoted_str_pos, global_quoted_str_pos);
             globalhostQuotedBody(global_key(1..global_key_pos), global_quoted_str(1..global_quoted_str_pos), global_key_pos, global_quoted_str_pos, 'Q', global_override, global_content, global_content, global_content_pos, global_content_pos);
             --Put(global_content(1..global_content_pos));
             global_key_pos := 0;
             global_int_pos := 0;
             global_float_pos := 0;
             global_str_pos := 0;
             global_quoted_str_pos:= 0;
             add_flag := TRUE;
             if new_state = 12 then
                correctBody("GLOBAL:", 7, global_content(1..global_content_pos), global_content_pos, add_flag, add_flag, correct_content, correct_content, correct_content_pos, correct_content_pos);
                --Put(correct_content(1..correct_content_pos));
             end if;
          elsif (state > 37 and state < 49) and (new_state = 25 or new_state = 12) then
             --Put("HOST ");
             --Put(host_name(1..host_name_pos));
             --New_Line;

             checkOverride(host_key(1..host_key_pos), host_key_pos, global_set, tmp_set, global_set_pos, tmp_set_pos, global_override);
             checkOverride(host_key(1..host_key_pos), host_key_pos, host_set, host_set, host_set_pos, host_set_pos, host_override);
             if global_override then
                host_override := global_override;
             end if;
             globalhostBody(host_key(1..host_key_pos), host_int(1..host_int_pos), host_key_pos, host_int_pos, 'I', host_override, host_content, host_content, host_content_pos, host_content_pos);
             globalhostBody(host_key(1..host_key_pos), host_float(1..host_float_pos), host_key_pos, host_float_pos, 'F', host_override, host_content, host_content, host_content_pos, host_content_pos);
             globalhostBody(host_key(1..host_key_pos), host_str(1..host_str_pos), host_key_pos, host_str_pos, 'S', host_override, host_content, host_content, host_content_pos, host_content_pos);
             --Put(host_quoted_str_pos);
             --Put(host_quoted_str(1..host_quoted_str_pos));
             escaped_quotedstr(host_quoted_str(1..host_quoted_str_pos), host_quoted_str(1..host_quoted_str_pos), host_quoted_str_pos, host_quoted_str_pos);
             --Put(host_quoted_str_pos);
             --Put(host_quoted_str(1..host_quoted_str_pos));
             globalhostQuotedBody(host_key(1..host_key_pos), host_quoted_str(1..host_quoted_str_pos), host_key_pos, host_quoted_str_pos, 'Q', host_override, host_content, host_content, host_content_pos, host_content_pos);
             --Put(host_content(1..host_content_pos));
             host_key_pos := 0;
             host_int_pos := 0;
             host_float_pos := 0;
             host_str_pos := 0;
             host_quoted_str_pos:= 0;
             add_flag := TRUE;
             if new_state = 12 then
                correctBody("HOST " & host_name(1..host_name_pos) & ':', 5 + host_name_pos + 1, host_content(1..host_content_pos), host_content_pos, add_flag, add_flag, correct_content, correct_content, correct_content_pos, correct_content_pos);
                --Put(correct_content(1..correct_content_pos));
                host_set_pos := 0;
                host_content_pos := 0;
             end if;
          elsif state = 25 and new_state = 12 then
             --host_name_pos  := 0;
             --global_key_pos := 0;
             --host_key_pos   := 0;
             --global_str_pos := 0;
             --host_str_pos := 0;
             add_flag := TRUE;
             correctBody("HOST " & host_name(1..host_name_pos) & ':', 5 + host_name_pos + 1, host_content(1..host_content_pos), host_content_pos, add_flag, add_flag, correct_content, correct_content, correct_content_pos, correct_content_pos);
             --Put(correct_content(1..correct_content_pos));
             host_set_pos := 0;
             host_content_pos := 0;
          elsif new_state = 12 then
             --add_flag := TRUE;
             correctBody("GLOBAL:", 7, global_content(1..global_content_pos), global_content_pos, add_flag, add_flag, correct_content, correct_content, correct_content_pos, correct_content_pos);
             --correctBody("HOST " & host_name(1..host_name_pos) & ':', 5 + host_name_pos + 1, host_content(1..host_content_pos), host_content_pos, add_flag, add_flag, correct_content, correct_content, correct_content_pos, correct_content_pos);
             --Put(correct_content(1..correct_content_pos));
             host_set_pos := 0;
             host_content_pos := 0;
          end if;
          state := new_state;
        end if;
        --New_Line;
        --if iter = N then
            --line := line + 1;
        --    findState(state, ASCII.LF, state);
        --end if;
     end loop;
   end loop;

   Close(My_File);
   Put(correct_content(1..(correct_content_pos-1)));

   --for Index in 1..805 loop
   --   Put(States(Index));
   --   Put(Input_Characters(Index));
   --   Put(Next_States(Index));
   --   New_Line;
   --end loop;

end imp3ada;
