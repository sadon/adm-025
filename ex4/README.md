## Exercise 4 Guide

1) `cd  ./ex3`

2) `terrafrom init` (Terraform will ask)

Move state to remote S3 bucket -> yes

3) `terrafrom state pull > my-test-state.json`

4) Change
   `  length = 10`
   to
   `  length = 15`

5) run `terrafrom state pull > my-new-test-state.json`

6) Compare state files