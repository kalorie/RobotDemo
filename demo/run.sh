# Format and verify
python3 -m robot.tidy -l unix -i *.resource
python3 -m robot.tidy -r -f robot -l unix .
python3 -m robot --dryrun .

# Execute
python3 -m robot .
