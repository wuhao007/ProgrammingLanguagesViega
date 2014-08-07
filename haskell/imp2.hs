import System.IO
grammar = [(1, '\t'), (1, '\n'), (1, ' '), (1, '#'), (2, '\n'), (1, 'g'), (3, 'l'), (4, 'o'), (5, 'b'), (6, 'a'), (7, 'l'), (8, '\t'), (8, '\n'), (8, ' '), (8, '#'), (9, '\n'), (8, '{'), (10,'#'), (11,'\n'), (10,'\t'), (10,'\n'), (10,' '), (10,'a'), (10,'b'), (10,'c'), (10,'d'), (10,'e'), (10,'f'), (10,'g'), (10,'h'), (10,'i'), (10,'j'), (10,'k'), (10,'l'), (10,'m'), (10,'n'), (10,'o'), (10,'p'), (10,'q'), (10,'r'), (10,'s'), (10,'t'), (10,'u'), (10,'v'), (10,'w'), (10,'x'), (10,'y'), (10,'z'), (10,'A'), (10,'B'), (10,'C'), (10,'D'), (10,'E'), (10,'F'), (10,'G'), (10,'H'), (10,'I'), (10,'J'), (10,'K'), (10,'L'), (10,'M'), (10,'N'), (10,'O'), (10,'P'), (10,'Q'), (10,'R'), (10,'S'), (10,'T'), (10,'U'), (10,'V'), (10,'W'), (10,'X'), (10,'Y'), (10,'Z'), (10,'_'), (27,'a'), (27,'b'), (27,'c'), (27,'d'), (27,'e'), (27,'f'), (27,'g'), (27,'h'), (27,'i'), (27,'j'), (27,'k'), (27,'l'), (27,'m'), (27,'n'), (27,'o'), (27,'p'), (27,'q'), (27,'r'), (27,'s'), (27,'t'), (27,'u'), (27,'v'), (27,'w'), (27,'x'), (27,'y'), (27,'z'), (27,'A'), (27,'B'), (27,'C'), (27,'D'), (27,'E'), (27,'F'), (27,'G'), (27,'H'), (27,'I'), (27,'J'), (27,'K'), (27,'L'), (27,'M'), (27,'N'), (27,'O'), (27,'P'), (27,'Q'), (27,'R'), (27,'S'), (27,'T'), (27,'U'), (27,'V'), (27,'W'), (27,'X'), (27,'Y'), (27,'Z'), (27,'0'), (27,'1'), (27,'2'), (27,'3'), (27,'4'), (27,'5'), (27,'6'), (27,'7'), (27,'8'), (27,'9'), (27,'_'), (27,'='), (27,'\t'), (27,' '), (28,'\t'), (28,' '), (28,'='), (29,'\t'), (29,' '), (29,'0'), (29,'1'), (29,'2'), (29,'3'), (29,'4'), (29,'5'), (29,'6'), (29,'7'), (29,'8'), (29,'9'), (29,'+'), (29,'-'), (30,'0'), (30,'1'), (30,'2'), (30,'3'), (30,'4'), (30,'5'), (30,'6'), (30,'7'), (30,'8'), (30,'9'), (30,'.'), (33,'0'), (33,'1'), (33,'2'), (33,'3'), (33,'4'), (33,'5'), (33,'6'), (33,'7'), (33,'8'), (33,'9'), (29,'a'), (29,'b'), (29,'c'), (29,'d'), (29,'e'), (29,'f'), (29,'g'), (29,'h'), (29,'i'), (29,'j'), (29,'k'), (29,'l'), (29,'m'), (29,'n'), (29,'o'), (29,'p'), (29,'q'), (29,'r'), (29,'s'), (29,'t'), (29,'u'), (29,'v'), (29,'w'), (29,'x'), (29,'y'), (29,'z'), (29,'A'), (29,'B'), (29,'C'), (29,'D'), (29,'E'), (29,'F'), (29,'G'), (29,'H'), (29,'I'), (29,'J'), (29,'K'), (29,'L'), (29,'M'), (29,'N'), (29,'O'), (29,'P'), (29,'Q'), (29,'R'), (29,'S'), (29,'T'), (29,'U'), (29,'V'), (29,'W'), (29,'X'), (29,'Y'), (29,'Z'), (29,'/'), (34,'a'), (34,'b'), (34,'c'), (34,'d'), (34,'e'), (34,'f'), (34,'g'), (34,'h'), (34,'i'), (34,'j'), (34,'k'), (34,'l'), (34,'m'), (34,'n'), (34,'o'), (34,'p'), (34,'q'), (34,'r'), (34,'s'), (34,'t'), (34,'u'), (34,'v'), (34,'w'), (34,'x'), (34,'y'), (34,'z'), (34,'A'), (34,'B'), (34,'C'), (34,'D'), (34,'E'), (34,'F'), (34,'G'), (34,'H'), (34,'I'), (34,'J'), (34,'K'), (34,'L'), (34,'M'), (34,'N'), (34,'O'), (34,'P'), (34,'Q'), (34,'R'), (34,'S'), (34,'T'), (34,'U'), (34,'V'), (34,'W'), (34,'X'), (34,'Y'), (34,'Z'), (34,'0'), (34,'1'), (34,'2'), (34,'3'), (34,'4'), (34,'5'), (34,'6'), (34,'7'), (34,'8'), (34,'9'), (34,'/'), (34,'-'), (34,'.'), (34,'_'), (29,'"'), (35,'\\'), (35,'"'), (30,'\n'), (30,'}'), (30,'#'), (30,'\t'), (30,' '), (33,'\n'), (33,'}'), (33,'#'), (33,'\t'), (33,' '), (34,'\n'), (34,'}'), (34,'#'), (34,'\t'), (34,' '), (37,'\n'), (37,'}'), (37,'#'), (37,'\t'), (37,' '), (31,'\t'), (31,' '), (31,'\n'), (31,'}'), (31,'#'), (32,'\n'), (10,'}'), (12,'\t'), (12,'\n'), (12,' '), (12,'#'), (13,'\n'), (12,'h'), (12,';'), (14,'\t'), (14,'\n'), (14,' '), (14,'#'), (15,'\n'), (14,'h'), (16,'o'), (17,'s'), (18,'t'), (19,'\t'), (19,'\n'), (19,' '), (19,'#'), (20,'\t'), (20,'\n'), (20,' '), (20,'#'), (21,'\n'), (20,'a'), (20,'b'), (20,'c'), (20,'d'), (20,'e'), (20,'f'), (20,'g'), (20,'h'), (20,'i'), (20,'j'), (20,'k'), (20,'l'), (20,'m'), (20,'n'), (20,'o'), (20,'p'), (20,'q'), (20,'r'), (20,'s'), (20,'t'), (20,'u'), (20,'v'), (20,'w'), (20,'x'), (20,'y'), (20,'z'), (20,'A'), (20,'B'), (20,'C'), (20,'D'), (20,'E'), (20,'F'), (20,'G'), (20,'H'), (20,'I'), (20,'J'), (20,'K'), (20,'L'), (20,'M'), (20,'N'), (20,'O'), (20,'P'), (20,'Q'), (20,'R'), (20,'S'), (20,'T'), (20,'U'), (20,'V'), (20,'W'), (20,'X'), (20,'Y'), (20,'Z'), (20,'0'), (20,'1'), (20,'2'), (20,'3'), (20,'4'), (20,'5'), (20,'6'), (20,'7'), (20,'8'), (20,'9'), (20,'.'), (20,'_'), (20,'-'), (22,'a'), (22,'b'), (22,'c'), (22,'d'), (22,'e'), (22,'f'), (22,'g'), (22,'h'), (22,'i'), (22,'j'), (22,'k'), (22,'l'), (22,'m'), (22,'n'), (22,'o'), (22,'p'), (22,'q'), (22,'r'), (22,'s'), (22,'t'), (22,'u'), (22,'v'), (22,'w'), (22,'x'), (22,'y'), (22,'z'), (22,'A'), (22,'B'), (22,'C'), (22,'D'), (22,'E'), (22,'F'), (22,'G'), (22,'H'), (22,'I'), (22,'J'), (22,'K'), (22,'L'), (22,'M'), (22,'N'), (22,'O'), (22,'P'), (22,'Q'), (22,'R'), (22,'S'), (22,'T'), (22,'U'), (22,'V'), (22,'W'), (22,'X'), (22,'Y'), (22,'Z'), (22,'0'), (22,'1'), (22,'2'), (22,'3'), (22,'4'), (22,'5'), (22,'6'), (22,'7'), (22,'8'), (22,'9'), (22,'\t'), (22,'\n'), (22,' '), (22,'#'), (22,'{'), (22,'.'), (22,'_'), (22,'-'), (23,'\t'), (23,'\n'), (23,' '), (23,'#'), (24,'\n'), (23,'{'), (25,'\t'), (25,'\n'), (25,' '), (25,'#'), (26,'\n'), (25,'}'), (25,'a'), (25,'b'), (25,'c'), (25,'d'), (25,'e'), (25,'f'), (25,'g'), (25,'h'), (25,'i'), (25,'j'), (25,'k'), (25,'l'), (25,'m'), (25,'n'), (25,'o'), (25,'p'), (25,'q'), (25,'r'), (25,'s'), (25,'t'), (25,'u'), (25,'v'), (25,'w'), (25,'x'), (25,'y'), (25,'z'), (25,'A'), (25,'B'), (25,'C'), (25,'D'), (25,'E'), (25,'F'), (25,'G'), (25,'H'), (25,'I'), (25,'J'), (25,'K'), (25,'L'), (25,'M'), (25,'N'), (25,'O'), (25,'P'), (25,'Q'), (25,'R'), (25,'S'), (25,'T'), (25,'U'), (25,'V'), (25,'W'), (25,'X'), (25,'Y'), (25,'Z'), (25,'_'), (38,'a'), (38,'b'), (38,'c'), (38,'d'), (38,'e'), (38,'f'), (38,'g'), (38,'h'), (38,'i'), (38,'j'), (38,'k'), (38,'l'), (38,'m'), (38,'n'), (38,'o'), (38,'p'), (38,'q'), (38,'r'), (38,'s'), (38,'t'), (38,'u'), (38,'v'), (38,'w'), (38,'x'), (38,'y'), (38,'z'), (38,'A'), (38,'B'), (38,'C'), (38,'D'), (38,'E'), (38,'F'), (38,'G'), (38,'H'), (38,'I'), (38,'J'), (38,'K'), (38,'L'), (38,'M'), (38,'N'), (38,'O'), (38,'P'), (38,'Q'), (38,'R'), (38,'S'), (38,'T'), (38,'U'), (38,'V'), (38,'W'), (38,'X'), (38,'Y'), (38,'Z'), (38,'0'), (38,'1'), (38,'2'), (38,'3'), (38,'4'), (38,'5'), (38,'6'), (38,'7'), (38,'8'), (38,'9'), (38,'_'), (38,'='), (38,'\t'), (38,' '), (39,'\t'), (39,' '), (39,'='), (40,'\t'), (40,' '), (40,'0'), (40,'1'), (40,'2'), (40,'3'), (40,'4'), (40,'5'), (40,'6'), (40,'7'), (40,'8'), (40,'9'), (40,'+'), (40,'-'), (41,'0'), (41,'1'), (41,'2'), (41,'3'), (41,'4'), (41,'5'), (41,'6'), (41,'7'), (41,'8'), (41,'9'), (41,'.'), (44,'0'), (44,'1'), (44,'2'), (44,'3'), (44,'4'), (44,'5'), (44,'6'), (44,'7'), (44,'8'), (44,'9'), (40,'a'), (40,'b'), (40,'c'), (40,'d'), (40,'e'), (40,'f'), (40,'g'), (40,'h'), (40,'i'), (40,'j'), (40,'k'), (40,'l'), (40,'m'), (40,'n'), (40,'o'), (40,'p'), (40,'q'), (40,'r'), (40,'s'), (40,'t'), (40,'u'), (40,'v'), (40,'w'), (40,'x'), (40,'y'), (40,'z'), (40,'A'), (40,'B'), (40,'C'), (40,'D'), (40,'E'), (40,'F'), (40,'G'), (40,'H'), (40,'I'), (40,'J'), (40,'K'), (40,'L'), (40,'M'), (40,'N'), (40,'O'), (40,'P'), (40,'Q'), (40,'R'), (40,'S'), (40,'T'), (40,'U'), (40,'V'), (40,'W'), (40,'X'), (40,'Y'), (40,'Z'), (40,'/'), (45,'a'), (45,'b'), (45,'c'), (45,'d'), (45,'e'), (45,'f'), (45,'g'), (45,'h'), (45,'i'), (45,'j'), (45,'k'), (45,'l'), (45,'m'), (45,'n'), (45,'o'), (45,'p'), (45,'q'), (45,'r'), (45,'s'), (45,'t'), (45,'u'), (45,'v'), (45,'w'), (45,'x'), (45,'y'), (45,'z'), (45,'A'), (45,'B'), (45,'C'), (45,'D'), (45,'E'), (45,'F'), (45,'G'), (45,'H'), (45,'I'), (45,'J'), (45,'K'), (45,'L'), (45,'M'), (45,'N'), (45,'O'), (45,'P'), (45,'Q'), (45,'R'), (45,'S'), (45,'T'), (45,'U'), (45,'V'), (45,'W'), (45,'X'), (45,'Y'), (45,'Z'), (45,'0'), (45,'1'), (45,'2'), (45,'3'), (45,'4'), (45,'5'), (45,'6'), (45,'7'), (45,'8'), (45,'9'), (45,'/'), (45,'-'), (45,'.'), (45,'_'), (40,'"'), (46,'\\'), (46,'"'), (41,'\n'), (41,'}'), (41,'#'), (41,'\t'), (41,' '), (44,'\n'), (44,'}'), (44,'#'), (44,'\t'), (44,' '), (45,'\n'), (45,'}'), (45,'#'), (45,'\t'), (45,' '), (48,'\n'), (48,'}'), (48,'#'), (48,'\t'), (48,' '), (42,'\t'), (42,' '), (42,'\n'), (42,'}'), (42,'#'), (43,'\n')]
states = [1, 1, 1, 2, 1, 3, 4, 5, 6, 7, 8, 8, 8, 8, 9, 8, 10, 11, 10, 10, 10, 10, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 29, 28, 28, 28, 28, 29, 29, 29, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 35, 36, 37, 10, 12, 32, 31, 31, 10, 12, 32, 31, 31, 10, 12, 32, 31, 31, 10, 12, 32, 31, 31, 31, 31, 10, 12, 32, 10, 12, 12, 12, 12, 13, 12, 16, 14, 14, 14, 14, 15, 14, 16, 17, 18, 19, 20, 20, 20, 21, 20, 20, 20, 21, 20, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 24, 25, 22, 22, 22, 23, 23, 23, 24, 23, 25, 25, 25, 25, 26, 25, 12, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 40, 39, 39, 39, 39, 40, 40, 40, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 46, 47, 48, 25, 12, 43, 42, 42, 25, 12, 43, 42, 42, 25, 12, 43, 42, 42, 25, 12, 43, 42, 42, 42, 42, 25, 12, 43, 25]

comment = [2,9,11,13,15,21,24,26,32,43]
global_quoted_list = [35,36]
host_quoted_list = [46,47]

findState rule result state = 
  if rule == []
     then fst state
     else if (head rule) == state
          then head result
          else findState (tail rule) (tail result) state

getKeyQuotedStr old_statel old_stater new_statel new_stater orig char quoted_list = 
  if old_statel == old_stater && new_statel == new_stater
     then [char]
     else if elem new_statel quoted_list
          then orig ++ [char]
          else orig

getKeyFloat old_statel old_stater new_statel new_stater orig char base_int = 
  if old_statel == old_stater && new_statel == new_stater
     then base_int ++ [char]
     else if new_statel == new_stater
          then orig ++ [char]
          else orig

getKeyValue old_statel old_stater new_statel new_stater orig char = 
  if old_statel == old_stater && new_statel == new_stater
     then [char]
     else if new_statel == new_stater
          then orig ++ [char]
          else orig

checkOveride key set = 
  if elem key set
     then set
     else set ++ [key]

globalhostBody key value value_type overide =
  if value == ""
     then ""
     else "    " ++ value_type ++ ":" ++ overide ++ ":" ++ key ++ ":" ++ value ++ "\n"

escape_quotestr quotedstr = 
  if quotedstr == ""
     then ""
     else if (head quotedstr) == '\\'
             then if (head (tail quotedstr)) == 'n'
                     then "\n" ++ escape_quotestr(tail (tail quotedstr))
                     else if (head (tail quotedstr) == 'r')
                          then "\r" ++ escape_quotestr(tail (tail quotedstr))
                          else if (head (tail quotedstr) == '\\')
                               then "\\" ++ escape_quotestr(tail (tail quotedstr))
                               else escape_quotestr(tail quotedstr)
             else (head quotedstr) : escape_quotestr(tail quotedstr)

globalhostQuotedBody key value value_type overide =
  if value == ""
     then ""
     else "    " ++ value_type ++ ":" ++ overide ++ ":" ++ key ++ ":\"\"" ++ escape_quotestr(value) ++ "\"\"\"\n"

putcfg [] state host_name global_key host_key global_int host_int global_float host_float global_str host_str global_quoted_str host_quoted_str global_set global_content host_set host_content host_name_set line = 
  do if state == 12 || state == 14
     then putStr ("GLOBAL:\n" ++ global_content ++ host_content)
     --then putStr correct_content
     --else putStr (correct_content ++ "ERR:P:" ++ (show line) ++ "\n")
     else if state == 50
             then putStr ("ERR:P:" ++ (show line) ++ "\n")
             else putStr ("GLOBAL:\n" ++ global_content ++ "ERR:P:" ++ (show line) ++ "\n")
putcfg string state host_name global_key host_key global_int host_int global_float host_float global_str host_str global_quoted_str host_quoted_str global_set global_content host_set host_content host_name_set pre_line =
  do let charactor = (head string)
         line = if charactor == '\n'
                   then if length string == 1
                        then pre_line
                        else pre_line + 1
                   else pre_line
     --putChar charactor
     --putStrLn (show (state, charactor))
     --print (lookup (state, charactor) grammar)
     --let new_state = lookup (state, charactor) grammar
     if elem (state, charactor) grammar
        then let new_state = findState grammar states (state, charactor)
                 new_host_name = getKeyValue state 20 new_state 22 host_name charactor 
                 new_global_key = getKeyValue state 10 new_state 27 global_key charactor 
                 new_host_key = getKeyValue state 25 new_state 38 host_key charactor 
                 new_global_float = getKeyFloat state 30 new_state 33 global_float charactor global_int
                 new_host_float = getKeyFloat state 41 new_state 44 host_float charactor host_int
                 new_global_int = if new_global_float == ""
                                     then getKeyValue state 29 new_state 30 global_int charactor 
                                     else ""
                 new_host_int = if new_host_float == ""
                                   then getKeyValue state 40 new_state 41 host_int charactor 
                                   else ""
                 new_global_str = getKeyValue state 29 new_state 34 global_str charactor 
                 new_host_str = getKeyValue state 40 new_state 45 host_str charactor 
                 new_global_quoted_str = getKeyQuotedStr state 29 new_state 35 global_quoted_str charactor global_quoted_list
                 new_host_quoted_str = getKeyQuotedStr state 40 new_state 46 host_quoted_str charactor host_quoted_list
             in if ((state > 26) && (state < 38)) && ((new_state == 10) || (new_state == 12))
                    then let new_global_set = checkOveride new_global_key global_set
                             overide = if (length global_set) == (length new_global_set)
                                       then "O"
                                       else ""
                             output_global_int = globalhostBody new_global_key new_global_int "I" overide
                             output_global_float = globalhostBody new_global_key new_global_float "F" overide 
                             output_global_str = globalhostBody new_global_key new_global_str "S" overide
                             output_global_quoted_str = globalhostQuotedBody new_global_key new_global_quoted_str "Q" overide
                             --new_correct_content = if new_state == 12
                             --                         then ("GLOBAL:\n" ++ global_content ++ output_global_int ++ output_global_float ++ output_global_str ++ output_global_quoted_str)
                             --                         else correct_content
                         in putcfg (tail string) new_state "" "" "" "" "" "" "" "" "" "" "" new_global_set (global_content ++ output_global_int ++ output_global_float ++ output_global_str ++ output_global_quoted_str) [] host_content host_name_set line --new_correct_content
                    --else if ((state == 22 || state == 23 ) || ((state > 37) && (state < 49))) && ((new_state == 25) || (new_state == 12))
                    else if ((state > 37) && (state < 49)) && ((new_state == 25) || (new_state == 12))
                         then let tmp_set = checkOveride new_host_key global_set
                                  new_host_name_set = if elem host_name host_name_set
                                                         then host_name_set
                                                         else host_name_set ++ [host_name]
                                  new_global_content = if (length host_name_set) == (length new_host_name_set)
                                                          then global_content 
                                                          else global_content ++ host_content
                                  new_host_content = if (length host_name_set) == (length new_host_name_set)
                                                        then host_content
                                                        else "HOST " ++ host_name ++ ":\n"
                                  new_host_set = checkOveride new_host_key host_set
                                  host_overide = if (length global_set) == (length tmp_set)
                                                 then "O"
                                                 else if (length host_set) == (length new_host_set)
                                                      then "O"
                                                      else ""
                                  output_host_int = globalhostBody new_host_key new_host_int "I" host_overide
                                  output_host_float = globalhostBody new_host_key new_host_float "F" host_overide 
                                  output_host_str = globalhostBody new_host_key new_host_str "S" host_overide
                                  output_host_quoted_str = globalhostQuotedBody new_host_key new_host_quoted_str "Q" host_overide
                                  clear_host_set = if new_state == 12
                                                      then []
                                                      else new_host_set
                                  --output_correct_content = if (new_state == 12)
                                  --                            then (correct_content ++ new_host_content ++ output_host_int ++ output_host_float ++ output_host_str ++ output_host_quoted_str)
                                  --                            else correct_content
                              in putcfg (tail string) new_state new_host_name "" "" "" "" "" "" "" "" "" "" global_set new_global_content clear_host_set (new_host_content ++ output_host_int ++ output_host_float ++ output_host_str ++ output_host_quoted_str) new_host_name_set line --output_correct_content
                    else if (state == 25 && new_state == 12)
                         then let tmp_set = checkOveride new_host_key global_set
                                  new_host_name_set = if elem host_name host_name_set
                                                         then host_name_set
                                                         else host_name_set ++ [host_name]
                                  new_global_content = if (length host_name_set) == (length new_host_name_set)
                                                          then global_content 
                                                          else global_content ++ host_content
                                  new_host_content = if (length host_name_set) == (length new_host_name_set)
                                                        then host_content
                                                        else "HOST " ++ host_name ++ ":\n"
                                  clear_host_set = if new_state == 12
                                                      then []
                                                      else host_set
                              in putcfg (tail string) new_state new_host_name "" "" "" "" "" "" "" "" "" "" global_set new_global_content clear_host_set new_host_content new_host_name_set line --output_correct_content

                    else if new_state == 12
                         then putcfg (tail string) new_state new_host_name new_global_key new_host_key new_global_int new_host_int new_global_float new_host_float new_global_str new_host_str new_global_quoted_str new_host_quoted_str global_set global_content [] host_content host_name_set line --correct_content
                    else putcfg (tail string) new_state new_host_name new_global_key new_host_key new_global_int new_host_int new_global_float new_host_float new_global_str new_host_str new_global_quoted_str new_host_quoted_str global_set global_content host_set host_content host_name_set line --correct_content
        else if elem state comment
             then putcfg (tail string) state host_name global_key host_key global_int host_int global_float host_float global_str host_str global_quoted_str host_quoted_str global_set global_content host_set host_content host_name_set line --correct_content
        else if elem state global_quoted_list
             then if state == 36 
                     then putcfg (tail string) 35 host_name global_key host_key global_int host_int global_float host_float global_str host_str (global_quoted_str ++ [charactor]) host_quoted_str global_set global_content host_set host_content host_name_set line --correct_content
                     else if (charactor == '\n')
                             then putcfg (tail string) 58 host_name global_key host_key global_int host_int global_float host_float global_str host_str (global_quoted_str ++ [charactor]) host_quoted_str global_set global_content host_set host_content host_name_set (if (length string == 1) then line else (line - 1)) --correct_content
                     else putcfg (tail string) state host_name global_key host_key global_int host_int global_float host_float global_str host_str (global_quoted_str ++ [charactor]) host_quoted_str global_set global_content host_set host_content host_name_set line --correct_content
        else if elem state host_quoted_list
             then if state == 47
                     then putcfg (tail string) 46 host_name global_key host_key global_int host_int global_float host_float global_str host_str global_quoted_str (host_quoted_str ++ [charactor]) global_set global_content host_set host_content host_name_set line --correct_content
                     else if (charactor == '\n')
                             then putcfg (tail string) 58 host_name global_key host_key global_int host_int global_float host_float global_str host_str global_quoted_str (host_quoted_str ++ [charactor]) global_set global_content host_set host_content host_name_set (if (length string == 1) then line else (line - 1)) --correct_content
                     else putcfg (tail string) state host_name global_key host_key global_int host_int global_float host_float global_str host_str global_quoted_str (host_quoted_str ++ [charactor]) global_set global_content host_set host_content host_name_set line --correct_content
        else if (state < 12 || ((state > 26) && (state < 38)))
                then putcfg [] 50 host_name global_key host_key global_int host_int global_float host_float global_str host_str global_quoted_str host_quoted_str global_set global_content host_set host_content host_name_set line --correct_content
                else if charactor == '\n'
                     then putcfg [] 58 host_name global_key host_key global_int host_int global_float host_float global_str host_str global_quoted_str host_quoted_str global_set (global_content ++ host_content) host_set host_content host_name_set (line-1) --correct_content
                else putcfg [] 58 host_name global_key host_key global_int host_int global_float host_float global_str host_str global_quoted_str host_quoted_str global_set (global_content ++ host_content) host_set host_content host_name_set line --correct_content

--main = print (lookup (1,'g') grammar)
main = do 
       handle <- openFile "test.cfg" ReadMode
       contents <- hGetContents handle
--       putStrLn ("There are " ++ (show (length (lines contents)) ++ "words."))
--       putStrLn (show contents)
--       putStrLn contents
       putcfg contents 1 "" "" "" "" "" "" "" "" "" "" "" [] "" [] "" [] 1 --""
       hClose handle

--host_content = {}
--host_tree = {}
--global_keys = []
--global_set = set([])
--host_set = set([])
--global_content = {}
--line = 1
--state = 1
--display_flag = False
--
--def escapde_quotestr(quotedstr):
--  escapedstr = ''
--  i = 0
--  while (i < len(quotedstr)):
--    if (quotedstr[i] == '\\'):
--      if (quotedstr[i+1] == 'n'):
--        escapedstr += '\n'
--        i += 1
--      elif (quotedstr[i+1] == 'r'):
--        escapedstr += '\r'
--        i += 1
--      elif (quotedstr[i+1] == '\\'):
--        escapedstr += '\\'
--        i += 1
--    else:
--      escapedstr += quotedstr[i]
--    i += 1
--  return escapedstr
--
--def display():
--  if state >= 12:
--    print 'GLOBAL:'
--    for globalkey in global_keys:
--      print globalkey + ':' + global_content[globalkey]
--  for hostname in hosts:
--    print 'HOST ' + hostname + ':'
--    for hostkey in host_content[hostname]:
--      print hostkey + ':' + host_tree[hostname][hostkey]
--
--with open('test.cfg', 'r') as fin:
--  cfg = fin.read()
--  host_name = ''
--  global_key = ''
--  host_key = ''
--  global_int = ''
--  host_int = ''
--  global_float = ''
--  host_float = ''
--  global_str = ''
--  host_str = ''
--  global_quoted_str = ''
--  host_quoted_str = ''
--  for char_num in range(len(cfg)):
--    charactor = cfg[char_num]
--    old_state = state
--    #print state, charactor
--    if (state, charactor) in grammar:
--      state = grammar[(state, charactor)]
--      if old_state == 20 and state == 22:
--        host_name = charactor
--      elif state == 22:
--        host_name += charactor
--
--      if old_state == 10 and state == 27: 
--        global_key = charactor
--      elif state == 27:
--        global_key += charactor
--
--      if old_state == 25 and state == 38: 
--        host_key = charactor
--      elif state == 38:
--        host_key += charactor
--
--      if old_state == 29 and state == 30: 
--        global_int = charactor
--      elif state == 30:
--        global_int += charactor
--
--      if old_state == 40 and state == 41: 
--        host_int = charactor
--      elif state == 41:
--        host_int += charactor
--
--      if old_state == 30 and state == 33: 
--        global_float = global_int + charactor
--        global_int = ''
--      elif state == 33:
--        global_float += charactor
--
--      if old_state == 41 and state == 44: 
--        host_float = host_int + charactor
--        host_int = ''
--      elif state == 44:
--        host_float += charactor
--
--      if old_state == 29 and state == 34: 
--        global_str = charactor
--      elif state == 34:
--        global_str += charactor
--
--      if old_state == 40 and state == 45: 
--        host_str = charactor
--      elif state == 45:
--        host_str += charactor
--
--      if old_state == 29 and state == 35: 
--        global_quoted_str = charactor
--      elif state in global_quoted_list:
--        global_quoted_str += charactor
--
--      if old_state == 40 and state == 46: 
--        host_quoted_str = charactor
--      elif state in host_quoted_list:
--        host_quoted_str += charactor
--
--      if old_state < 25 and state == 25:
--        host_content[host_name] = []
--        hosts += [host_name]
--
--      if (old_state > 26 and old_state < 38) and (state == 10 or state == 12):
--
--        O = ''
--        if global_key in global_set:
--          O = 'O'
--        else:
--          global_set.add(global_key)
--
--        if global_int != '':
--          global_key = '    I:' + O + ':' + global_key
--          global_content[global_key] = global_int
--          global_keys += [global_key]
--          global_int = ''
--
--        if global_float != '':
--          global_key = '    F:' + O + ':' + global_key
--          global_content[global_key] = global_float
--          global_keys += [global_key]
--          global_float = ''
--
--        if global_str != '':
--          global_key = '    S:' + O + ':' + global_key
--          global_content[global_key] = global_str
--          global_keys += [global_key]
--          global_str = ''
--
--        if global_quoted_str != '':
--          global_key = '    Q:' + O + ':' + global_key
--          global_content[global_key] = '""' + escapde_quotestr(global_quoted_str) + '"""'
--          global_keys += [global_key]
--          global_quoted_str = ''
--
--        #if state == 12:
--        #  print 'GLOBAL:'
--        #  for globalkey in global_keys:
--        #    print globalkey + ':' + global_content[globalkey]
--
--
--      if (old_state > 37 and old_state < 49) and (state == 25 or state == 12):
--
--        if host_name not in host_tree:
--          host_tree[host_name] = {}
--
--        O = ''
--        if host_key in global_set:
--          O = 'O'
--
--        if host_key in host_set:
--          O = 'O'
--        else:
--          host_set.add(host_key)
--
--        if host_int != '':
--          host_key = '    I:' + O + ':' + host_key
--          host_content[host_name] += [host_key]
--          host_tree[host_name][host_key] = host_int
--          host_int = ''
--
--        if host_float != '':
--          host_key = '    F:' + O + ':' + host_key
--          host_content[host_name] += [host_key]
--          host_tree[host_name][host_key] = host_float
--          host_float = ''
--
--        if host_str != '':
--          host_key = '    S:' + O + ':' + host_key
--          host_content[host_name] += [host_key]
--          host_tree[host_name][host_key] = host_str
--          host_str = ''
--
--        if host_quoted_str != '':
--          host_key = '    Q:' + O + ':' + host_key
--          host_content[host_name] += [host_key]
--          host_tree[host_name][host_key] = '""' + escapde_quotestr(host_quoted_str) + '"""'
--          host_quoted_str = ''
--
--      if state == 12:
--        host_set.clear()
--        #if state == 12:
--        #  for hostname in hosts:
--        #    print 'HOST ' + hostname + ':'
--        #    for hostkey in host_content[hostname]:
--        #      print hostkey + ':' + host_tree[hostname][hostkey]
--        #  hosts.clear()
--
--    elif state in comment:
--      continue
--    elif state in global_quoted_list:
--      if state == 36:
--        state = 35
--      if charactor == '\n':
--        print 'ERR:L:'+str(line)
--        state = 0
--        break
--      global_quoted_str += charactor
--      continue
--    elif state in host_quoted_list:
--      if state == 47:
--        state = 46
--      if charactor == '\n':
--        display_flag = True
--        hosts.remove(host_name)
--        display()
--        print 'ERR:L:'+str(line)
--        state = 0
--        break
--      host_quoted_str += charactor
--      continue
--    else:
--      display_flag = True
--      if (old_state > 26 and old_state < 38):
--        print 'ERR:P:'+str(line)
--        state = 0
--        break
--      if (state > 22 and state <= 26) or (old_state > 37 and old_state < 49):
--        hosts.remove(host_name)
--      display()
--      print 'ERR:P:'+str(line)
--      state = 0
--      break
--
--    if charactor == '\n' and (char_num != len(cfg) - 1):
--      line += 1
--
--if display_flag == False:
--  if state in [12, 14]:
--    print 'GLOBAL:'
--    for globalkey in global_keys:
--      print globalkey + ':' + global_content[globalkey]
--    for hostname in hosts:
--      print 'HOST ' + hostname + ':'
--      for hostkey in host_content[hostname]:
--        print hostkey + ':' + host_tree[hostname][hostkey]
--  else:
--    if (old_state > 26 and old_state < 38):
--      print 'ERR:P:'+str(line)
--    elif (state > 22 and state <= 26) or (old_state > 37 and old_state < 49):
--      hosts.remove(host_name)
--    display()
--    print 'ERR:P:'+str(line)
