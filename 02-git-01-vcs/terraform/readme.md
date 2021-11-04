# игнорирование локальных скрытых дирректроий .terraform
**/.terraform/*

# игнорирование файлов с расширением .tfstate

*.tfstate
игнорирование файлов с частью имени .tfstate.
*.tfstate.*

# игнорирование файлов crash.log
crash.log

# игнорирование файлов с расширением .tfvars
*.tfvars


# Игнорирование файлов override.tf override.tf.json
override.tf
override.tf.json

#игнорирование файлов заканчивающихся на _override.tf,_override.tf.json
*_override.tf
*_override.tf.json

# Include override files you do wish to add to version control using negated pattern
#
# !example_override.tf

# Include tfplan files to ignore the plan output of command: terraform plan -out=tfplan
# example: *tfplan*

# Ignore CLI configuration files
# игнорирование файлов .terraformrc, terraform.rc
.terraformrc
terraform.rc

