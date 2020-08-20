initial_height=$(bitcoin-cli getblockcount);
echo "Auditing Bitcoin supply...";
echo "Running the numbers for block $initial_height";
bitcoin-cli gettxoutsetinfo >> log;

current_height=$initial_height;

difference=0;
while (($difference < 12));
do
  previous_height=$current_height;
  current_height=$(bitcoin-cli getblockcount);

  if (($previous_height != $current_height));
  then
    echo "Running the numbers for block $current_height";
    bitcoin-cli gettxoutsetinfo >> log;
    difference=$(($current_height - $initial_height));
  fi

done;

echo "Don't trust, verify!";
cat log;
