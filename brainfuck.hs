import Data.Char (chr, ord)

data State = State
    { tape :: [Int]
    , pointer :: Int
    , code :: String
    , pc :: Int -- pc = programCounter
    }

initialState :: String -> State
initialState code =
    State
        { tape = replicate 30000 0
        , pointer = 0
        , code = code
        , pc = 0
        }

run :: State -> IO ()
run state = do
    execute state $ (length . code) state
  where
    execute st len
        | pc st >= len = return ()
        | otherwise = do
            newState <- next st
            execute newState len

next :: State -> IO State
next state = case currentInstr of
    '>' -> return state{pointer = pointer state + 1, pc = pc state + 1}
    '<' -> return state{pointer = pointer state - 1, pc = pc state + 1}
    '+' -> return state{tape = updateTape (+ 1), pc = pc state + 1}
    '-' -> return state{tape = updateTape (subtract 1), pc = pc state + 1}
    '.' -> do
        putChar . chr $ tape state !! pointer state
        return state{pc = pc state + 1}
    ',' -> do
        input <- getChar
        return state{tape = writeTape (ord input), pc = pc state + 1}
    '[' ->
        if tape state !! pointer state == 0
            then return state{pc = findMatchingBrace (pc state) 1}
            else return state{pc = pc state + 1}
    ']' ->
        if tape state !! pointer state /= 0
            then return state{pc = findMatchingBrace (pc state) (-1)}
            else return state{pc = pc state + 1}
    _ -> return state{pc = pc state + 1}
  where
    currentInstr = code state !! pc state

    updateTape f =
        let (h, ht : t) = splitAt (pointer state) (tape state)
         in h ++ (f ht : t)

    writeTape value =
        let (h, _ : t) = splitAt (pointer state) (tape state)
         in h ++ (value : t)

    findMatchingBrace idx level
        | level == 0 = idx + 1
        | otherwise =
            let nextIdx = idx + level
             in findMatchingBrace nextIdx (level + delta nextIdx)

    delta idx
        | code state !! idx == '[' = 1
        | code state !! idx == ']' = -1
        | otherwise = 0

helloWorld = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."

main :: IO ()
main = do
    run (initialState helloWorld)
