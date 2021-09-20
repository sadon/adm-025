Homework (_homework1_):
on **day 2**, before **import exercise**:

Make next terraform configuration:

- Create a new S3 bucket (not for state)
with prefix adm-025-luxoft-hw, like adm-025-luxoft-hw-dmitry-dubovitskiy, store prefix in terraform var file
- Your state must be store in the training's (pre-created) AWS S3 bucket
- Put into new bucket object with next content: "This is test file for the training XXX\n Various exercises mix.", using variables
- Use variables for S3 bucket prefix and training name (ADM-025)
- Add validation for training name: all training will be like XXX-111
- In case of failure - type "Wrong training name"
- Setup variable name "ADM-025" in course-name.???.json file
- Run `terraform apply`
- Examine
- Run `terraform destroy`
