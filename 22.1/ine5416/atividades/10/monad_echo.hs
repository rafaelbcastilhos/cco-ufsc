echoDo :: IO ()
echoDo = do
    l <- getLine
    putStr l

echo :: IO ()
echo = getLine >>= putStr

main = do
    echo
    print()
    echoDo