DIRECTORY=./test

for i in $DIRECTORY/*.bpl; do
    # Process $i
    python3 bin/lex.py $i
    echo 
done