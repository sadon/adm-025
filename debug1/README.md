1. Observe resources in **resources.tf** file
   
2. Enable debug with `export TF_LOG=TRACE` command
   
3. Terrafrom will print output info to
Run `terraform init` command
   
4. There are many ways to find out http requests,
 - first you have to remove STDERR out of output, like this:
    
`terraform plan 2>&1 >/dev/null`

 - second, filter output by _amazonaws.com_ keyword:

`
terraform plan 2>&1 >/dev/null | grep amazonaws.com
`
 - So, you see some more debug info: 
<pre> 
Host: sts.amazonaws.com
2021-08-19T17:46:21.451+0300 [INFO]  provider.terraform-provider-aws_v3.54.0_x5: 2021/08/19 17:46:21 [DEBUG] [aws-sdk-go] <GetCallerIdentityResponse xmlns="https://sts.amazonaws.com/doc/2011-06-15/">
Host: sts.amazonaws.com
2021-08-19T17:46:21.959+0300 [INFO]  provider.terraform-provider-aws_v3.54.0_x5: 2021/08/19 17:46:21 [DEBUG] [aws-sdk-go] <GetCallerIdentityResponse xmlns="https://sts.amazonaws.com/doc/2011-06-15/">
Host: ec2.eu-central-1.amazonaws.com
<DescribeAccountAttributesResponse xmlns="http://ec2.amazonaws.com/doc/2016-11-15/">
</pre>

5. Create clear output
````
terraform plan 2>&1 >/dev/null | grep "Host: .*amazonaws.com" | uniq | sort
>Host: ec2.eu-central-1.amazonaws.com
>Host: sts.amazonaws.com
````

