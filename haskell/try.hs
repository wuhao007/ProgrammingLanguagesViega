
grammer = [(1,'a'),
           (1,'b'),
           (1,'c')]
states = [1,2,3]
--findState []   []     state = state
findState rule result state = if rule == []
                                 then -1
                                 else if (head rule) == state
                                      then head result
                                      else findState (tail rule) (tail result) state
--main = print (lookup (1,'a') fac)
main = do let new_state = findState grammer states (2, 'c')
          print new_state
