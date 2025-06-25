#Terraform studies

This is a simple workspace that contains Terraform platform automation scripts for DevOps/SRE tasks.

AWS folder contains TF scripts to create a fresh instance of Jenkins on EC2, configure security groups, VPC and set up S3 bucket automatically.
OCI folder contains TF scripts to create OCI instances and perform some functions such as for loops, and usage of variables etc.

`fmt` flag - this is handy for making the code look readable.

```
Terraform command usage:
Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid  
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure
  
All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  metadata      Metadata related commands
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
```

Terraform works by creating an execution plan by first creating an execution plan that compares the deried infrastructure state (defined in config file) with the current state of the infrastructure. The plan outlines the necessary changes - creates, updates, deletes to reach the desired state. Then optionally review and approve the plan before Terraform applies it. 

It makes use of a state file to store the current configuration of the infrastructure.

You can use the terraform plan command to review the execution plan before applying it. This allows you to check for unintended changes and ensure that the plan aligns with your expectations. 

If you're satisfied with the plan, you can use the terraform apply command to execute it and make the changes to your infrastructure. Terraform will then interact with the infrastructure providers (e.g., AWS, Azure, Google Cloud) through their APIs to provision, update, or destroy resources. 
