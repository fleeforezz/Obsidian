```
proxmox-infrastructure/
├── .gitignore
├── README.md
├── global/
│   ├── providers.tf
│   ├── variables.tf
│   └── terraform.tfvars.example
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   ├── terraform.tfvars.example
│   │   └── outputs.tf
│   ├── staging/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   ├── terraform.tfvars.example
│   │   └── outputs.tf
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       ├── terraform.tfvars.example
│       └── outputs.tf
├── modules/
│   ├── proxmox-vm/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── README.md
│   ├── proxmox-lxc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── README.md
│   └── proxmox-network/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── README.md
├── scripts/
│   ├── deploy.sh
│   ├── destroy.sh
│   └── setup.sh
└── docs/
    ├── architecture.md
    ├── deployment.md
    └── troubleshooting.md
```

## File Contents

### Root Files

#### <mark style="background: #FF5582A6;">.gitignore</mark>

```gitignore
# Terraform
*.tfstate
*.tfstate.*
*.tfvars
!*.tfvars.example
.terraform/
.terraform.lock.hcl
crash.log
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Environment files
.env
.env.local
.env.*.local

# Backups
**/backups/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# SSH Keys
*.pem
*.key
id_rsa*

# Logs
*.log
```

#### <mark style="background: #FF5582A6;">README.md</mark>

``` markdown
# Proxmox Infrastructure Management

This repository contains Terraform configurations for managing Proxmox VE infrastructure across multiple environments.

## Structure
- `global/` - Global configuration and providers
- `environments/` - Environment-specific configurations
- `modules/` - Reusable Terraform modules
- `scripts/` - Deployment and management scripts

## Quick Start
1. Copy terraform.tfvars.example to terraform.tfvars in desired environment
2. Configure your Proxmox credentials and SSH keys
3. Deploy: `./scripts/deploy.sh dev`

## Environments
- **dev** - Development environment (10.0.1.x)
- **staging** - Staging environment (10.0.2.x)  
- **prod** - Production environment (10.0.3.x)

See `docs/` for detailed documentation.
```

### Global Configuration

#### <mark style="background: #FF5582A6;">global/providers.tf</mark>

```hcl
terraform {
  required_version = ">= 1.0"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 3.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.proxmox_api_url
  pm_user         = var.proxmox_user
  pm_password     = var.proxmox_password
  pm_tls_insecure = var.proxmox_tls_insecure
}
```

#### <mark style="background: #FF5582A6;">global/variables.tf</mark>

```hcl
variable "proxmox_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "proxmox_user" {
  description = "Proxmox username"
  type        = string
  default     = "terraform@pve"
}

variable "proxmox_password" {
  description = "Proxmox password"
  type        = string
  sensitive   = true
}

variable "proxmox_tls_insecure" {
  description = "Skip TLS verification"
  type        = bool
  default     = true
}

variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "proxmox-infra"
}
```

#### <mark style="background: #FF5582A6;">global/terraform.tfvars.example</mark>

```hcl
proxmox_api_url      = "https://your-proxmox:8006/api2/json"
proxmox_user         = "terraform@pve"
proxmox_password     = "your-secure-password"
proxmox_tls_insecure = true

ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAA... your-email@example.com"

project_name = "my-project"
```

### Environment Configurations

#### <mark style="background: #FF5582A6;">environments/dev/main.tf</mark>

```hcl
# Include global configuration
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 3.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.proxmox_api_url
  pm_user         = var.proxmox_user
  pm_password     = var.proxmox_password
  pm_tls_insecure = var.proxmox_tls_insecure
}

locals {
  environment = "dev"
  network_base = "10.0.1"
  
  common_tags = {
    Environment = local.environment
    ManagedBy   = "terraform"
    Project     = var.project_name
  }
}

# Cockpit Management Server
module "cockpit_server" {
  source = "../../modules/proxmox-vm"
  
  vm_name         = "cockpit-${local.environment}"
  target_node     = var.proxmox_node
  clone_template  = var.vm_template
  
  cpu_cores       = 2
  memory_mb       = 4096
  disk_size_gb    = 20
  storage_pool    = var.storage_pool
  
  network_bridge  = var.network_bridge
  ip_address      = "${local.network_base}.10/24"
  gateway         = "${local.network_base}.1"
  nameserver      = var.nameserver
  
  ssh_public_key  = var.ssh_public_key
  tags            = "management,cockpit,${local.environment}"
  
  description     = "Cockpit Management Server - ${local.environment}"
}

# Web Servers
module "web_servers" {
  source = "../../modules/proxmox-vm"
  count  = var.web_server_count
  
  vm_name         = "web-${count.index + 1}-${local.environment}"
  target_node     = var.proxmox_node
  clone_template  = var.vm_template
  
  cpu_cores       = 1
  memory_mb       = 2048
  disk_size_gb    = 15
  storage_pool    = var.storage_pool
  
  network_bridge  = var.network_bridge
  ip_address      = "${local.network_base}.${20 + count.index}/24"
  gateway         = "${local.network_base}.1"
  nameserver      = var.nameserver
  
  ssh_public_key  = var.ssh_public_key
  tags            = "web,nginx,${local.environment}"
  
  description     = "Web Server ${count.index + 1} - ${local.environment}"
}

# Database Server
module "database_server" {
  source = "../../modules/proxmox-vm"
  count  = var.enable_database ? 1 : 0
  
  vm_name         = "db-${local.environment}"
  target_node     = var.proxmox_node
  clone_template  = var.vm_template
  
  cpu_cores       = 2
  memory_mb       = 4096
  disk_size_gb    = 50
  storage_pool    = var.storage_pool
  
  network_bridge  = var.network_bridge
  ip_address      = "${local.network_base}.30/24"
  gateway         = "${local.network_base}.1"
  nameserver      = var.nameserver
  
  ssh_public_key  = var.ssh_public_key
  tags            = "database,mysql,${local.environment}"
  
  description     = "Database Server - ${local.environment}"
}

# Development Container (LXC)
module "dev_container" {
  source = "../../modules/proxmox-lxc"
  count  = var.enable_dev_container ? 1 : 0
  
  container_name  = "dev-tools-${local.environment}"
  target_node     = var.proxmox_node
  template        = var.lxc_template
  
  cpu_cores       = 1
  memory_mb       = 1024
  disk_size_gb    = 10
  storage_pool    = var.storage_pool
  
  network_bridge  = var.network_bridge
  ip_address      = "${local.network_base}.40/24"
  gateway         = "${local.network_base}.1"
  nameserver      = var.nameserver
  
  ssh_public_key  = var.ssh_public_key
  
  description     = "Development Tools Container - ${local.environment}"
}
```

#### <mark style="background: #FF5582A6;">environments/dev/variables.tf</mark>

```hcl
# Proxmox Configuration
variable "proxmox_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "proxmox_user" {
  description = "Proxmox username"
  type        = string
  default     = "terraform@pve"
}

variable "proxmox_password" {
  description = "Proxmox password"
  type        = string
  sensitive   = true
}

variable "proxmox_tls_insecure" {
  description = "Skip TLS verification"
  type        = bool
  default     = true
}

variable "proxmox_node" {
  description = "Proxmox node name"
  type        = string
  default     = "pve1"
}

# VM Configuration
variable "vm_template" {
  description = "VM template to clone from"
  type        = string
  default     = "ubn-temp-1"
}

variable "lxc_template" {
  description = "LXC template"
  type        = string
  default     = "ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

variable "storage_pool" {
  description = "Storage pool name"
  type        = string
  default     = "Fast500G"
}

variable "network_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr1"
}

variable "nameserver" {
  description = "DNS servers"
  type        = string
  default     = "1.1.1.1,1.0.0.1"
}

# SSH Configuration
variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
  sensitive   = true
}

# Project Configuration
variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "dev-project"
}

# Resource Counts
variable "web_server_count" {
  description = "Number of web servers to create"
  type        = number
  default     = 2
}

variable "enable_database" {
  description = "Enable database server"
  type        = bool
  default     = true
}

variable "enable_dev_container" {
  description = "Enable development container"
  type        = bool
  default     = true
}
```

#### <mark style="background: #FF5582A6;">environments/dev/terraform.tfvars.example</mark>

```hcl
# Proxmox Configuration
proxmox_api_url      = "https://your-proxmox:8006/api2/json"
proxmox_user         = "terraform@pve"
proxmox_password     = "your-secure-password"
proxmox_tls_insecure = true
proxmox_node         = "pve1"

# VM Configuration
vm_template      = "ubn-temp-1"
storage_pool     = "Fast500G"
network_bridge   = "vmbr1"
nameserver       = "1.1.1.1,1.0.0.1"

# SSH Configuration
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAA... your-email@example.com"

# Project Configuration
project_name = "my-dev-project"

# Resource Configuration
web_server_count      = 2
enable_database       = true
enable_dev_container  = true
```

#### <mark style="background: #FF5582A6;">environments/dev/outputs.tf</mark>

```hcl
output "cockpit_server" {
  description = "Cockpit server information"
  value = {
    name       = module.cockpit_server.vm_name
    ip_address = module.cockpit_server.ip_address
    vm_id      = module.cockpit_server.vm_id
  }
}

output "web_servers" {
  description = "Web servers information"
  value = [
    for server in module.web_servers : {
      name       = server.vm_name
      ip_address = server.ip_address
      vm_id      = server.vm_id
    }
  ]
}

output "database_server" {
  description = "Database server information"
  value = var.enable_database ? {
    name       = module.database_server[0].vm_name
    ip_address = module.database_server[0].ip_address
    vm_id      = module.database_server[0].vm_id
  } : null
}

output "dev_container" {
  description = "Development container information"
  value = var.enable_dev_container ? {
    name       = module.dev_container[0].container_name
    ip_address = module.dev_container[0].ip_address
    container_id = module.dev_container[0].container_id
  } : null
}

output "environment_summary" {
  description = "Environment summary"
  value = {
    environment      = "dev"
    total_vms        = var.web_server_count + 1 + (var.enable_database ? 1 : 0)
    total_containers = var.enable_dev_container ? 1 : 0
    network_range    = "10.0.1.0/24"
  }
}
```

### Staging Environment (Similar structure with different IPs)

#### <mark style="background: #FF5582A6;">environments/staging/main.tf</mark>

```hcl
# Similar to dev but with staging-specific values
locals {
  environment = "staging"
  network_base = "10.0.2"  # Different network for staging
  
  common_tags = {
    Environment = local.environment
    ManagedBy   = "terraform"
    Project     = var.project_name
  }
}

# Same modules but with staging configuration
# ... (similar structure with staging-specific values)
```

### Production Environment

#### <mark style="background: #FF5582A6;">environments/prod/main.tf</mark>

```hcl
# Similar to dev but with production-specific values
locals {
  environment = "prod"
  network_base = "10.0.3"  # Different network for production
  
  common_tags = {
    Environment = local.environment
    ManagedBy   = "terraform"
    Project     = var.project_name
  }
}

# Production has higher resources and no dev container
# ... (similar structure with production-specific values)
```

### VM Module

#### <mark style="background: #FF5582A6;">modules/proxmox-vm/main.tf</mark>

```hcl
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 3.0"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  name   = var.vm_name
  agent  = 1
  onboot = var.onboot
  desc   = var.description
  tags   = var.tags

  # OS
  clone       = var.clone_template
  full_clone  = true
  target_node = var.target_node
  os_type     = "cloud-init"
  bios        = var.bios

  # Disk
  disks {
    ide {
      ide2 {
        cloudinit {
          storage = var.storage_pool
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = var.storage_pool
          size    = var.disk_size_gb
        }
      }
    }
  }
  boot     = "order=scsi0;net0"
  bootdisk = "scsi0"

  # CPU
  cpu {
    cores = var.cpu_cores
    type  = var.cpu_type
  }

  # Memory
  memory = var.memory_mb

  # Network
  network {
    bridge   = var.network_bridge
    firewall = var.enable_firewall
    model    = var.network_model
  }

  # Cloud-init
  ipconfig0  = "ip=${var.ip_address},gw=${var.gateway}"
  nameserver = var.nameserver
  sshkeys    = var.ssh_public_key

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
```

#### <mark style="background: #FF5582A6;">modules/proxmox-vm/variables.tf</mark>

```hcl
variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "target_node" {
  description = "Proxmox node to deploy to"
  type        = string
}

variable "clone_template" {
  description = "Template to clone from"
  type        = string
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 1
}

variable "cpu_type" {
  description = "CPU type"
  type        = string
  default     = "x86-64-v2-AES"
}

variable "memory_mb" {
  description = "Memory in MB"
  type        = number
  default     = 1024
}

variable "disk_size_gb" {
  description = "Disk size in GB"
  type        = number
  default     = 10
}

variable "storage_pool" {
  description = "Storage pool name"
  type        = string
  default     = "local-lvm"
}

variable "network_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "network_model" {
  description = "Network model"
  type        = string
  default     = "virtio"
}

variable "enable_firewall" {
  description = "Enable firewall"
  type        = bool
  default     = true
}

variable "ip_address" {
  description = "IP address with CIDR"
  type        = string
}

variable "gateway" {
  description = "Gateway IP"
  type        = string
}

variable "nameserver" {
  description = "DNS servers"
  type        = string
  default     = "1.1.1.1"
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
}

variable "tags" {
  description = "VM tags"
  type        = string
  default     = ""
}

variable "description" {
  description = "VM description"
  type        = string
  default     = "Managed by Terraform"
}

variable "onboot" {
  description = "Start VM on boot"
  type        = bool
  default     = true
}

variable "bios" {
  description = "BIOS type"
  type        = string
  default     = "seabios"
}
```

#### <mark style="background: #FF5582A6;">modules/proxmox-vm/outputs.tf</mark>

```hcl
output "vm_id" {
  description = "VM ID"
  value       = proxmox_vm_qemu.vm.vmid
}

output "vm_name" {
  description = "VM name"
  value       = proxmox_vm_qemu.vm.name
}

output "ip_address" {
  description = "VM IP address"
  value       = split("/", var.ip_address)[0]
}

output "ssh_connection" {
  description = "SSH connection string"
  value       = "ssh root@${split("/", var.ip_address)[0]}"
}
```

### LXC Module

#### <mark style="background: #FF5582A6;">modules/proxmox-lxc/main.tf</mark>

```hcl
resource "proxmox_lxc" "container" {
  target_node  = var.target_node
  hostname     = var.container_name
  ostemplate   = "${var.storage_pool}:vztmpl/${var.template}"
  password     = var.root_password
  unprivileged = var.unprivileged
  onboot       = var.onboot
  start        = var.start_on_create
  description  = var.description

  # Resources
  cores  = var.cpu_cores
  memory = var.memory_mb

  # Root filesystem
  rootfs {
    storage = var.storage_pool
    size    = "${var.disk_size_gb}G"
  }

  # Network
  network {
    name   = "eth0"
    bridge = var.network_bridge
    ip     = var.ip_address
    gw     = var.gateway
  }

  # SSH Keys
  ssh_public_keys = var.ssh_public_key

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
```

### Usage Commands

```bash 
# Development
cd environments/dev
terraform init
terraform plan
terraform apply

# Using scripts
./scripts/deploy.sh dev
./scripts/deploy.sh staging --plan-only
./scripts/deploy.sh prod

./scripts/destroy.sh dev --target module.web_servers[0]
```

This structure provides:

- **Environment isolation**: Separate state and configuration per environment
- **Code reusability**: Shared modules across environments
- **Scalability**: Easy to add new environments or services
- **Security**: Environment-specific credentials and network isolation
- **Maintainability**: Clear separation of concerns
- **Documentation**: Comprehensive docs and examples


## Here are the deployment scripts for your Terraform Proxmox infrastructure:
#### <mark style="background: #FF5582A6;">deploy.sh</mark>

```bash
#!/bin/bash

# Terraform Proxmox Deployment Script
# Usage: ./scripts/deploy.sh [environment] [options]

set -e  # Exit on any error

# Default values
ENVIRONMENT="dev"
AUTO_APPROVE=false
PLAN_ONLY=false
VERBOSE=false
WORKING_DIR=""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to show usage
show_usage() {
    cat << EOF
Usage: $0 [ENVIRONMENT] [OPTIONS]

ENVIRONMENT:
    dev         Deploy to development environment (default)
    staging     Deploy to staging environment
    prod        Deploy to production environment

OPTIONS:
    -a, --auto-approve    Auto approve the apply (skip confirmation)
    -p, --plan-only       Only run terraform plan
    -v, --verbose         Enable verbose output
    -w, --working-dir     Specify working directory (default: environments/ENVIRONMENT)
    -h, --help           Show this help message

Examples:
    $0                          # Deploy to dev environment
    $0 prod                     # Deploy to production
    $0 staging --plan-only      # Only plan staging deployment
    $0 prod --auto-approve      # Deploy to prod without confirmation
EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        dev|staging|prod)
            ENVIRONMENT="$1"
            shift
            ;;
        -a|--auto-approve)
            AUTO_APPROVE=true
            shift
            ;;
        -p|--plan-only)
            PLAN_ONLY=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -w|--working-dir)
            WORKING_DIR="$2"
            shift 2
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac
done

# Set working directory if not specified
if [[ -z "$WORKING_DIR" ]]; then
    WORKING_DIR="environments/$ENVIRONMENT"
fi

# Check if working directory exists
if [[ ! -d "$WORKING_DIR" ]]; then
    print_error "Working directory '$WORKING_DIR' does not exist"
    exit 1
fi

# Check if terraform.tfvars exists
if [[ ! -f "$WORKING_DIR/terraform.tfvars" ]]; then
    print_warning "terraform.tfvars not found in $WORKING_DIR"
    if [[ -f "$WORKING_DIR/terraform.tfvars.example" ]]; then
        print_warning "Found terraform.tfvars.example. Please copy and configure it:"
        print_warning "cp $WORKING_DIR/terraform.tfvars.example $WORKING_DIR/terraform.tfvars"
        exit 1
    fi
fi

# Function to run terraform command with proper error handling
run_terraform() {
    local cmd="$1"
    print_status "Running: terraform $cmd"
    
    if [[ "$VERBOSE" == "true" ]]; then
        terraform $cmd
    else
        terraform $cmd > /tmp/terraform_output.log 2>&1 || {
            print_error "Terraform command failed. Output:"
            cat /tmp/terraform_output.log
            exit 1
        }
    fi
}

# Function to validate environment for production
validate_production() {
    if [[ "$ENVIRONMENT" == "prod" ]]; then
        print_warning "You are about to deploy to PRODUCTION environment!"
        echo -n "Are you sure you want to continue? (type 'yes' to confirm): "
        read -r confirmation
        if [[ "$confirmation" != "yes" ]]; then
            print_status "Deployment cancelled"
            exit 0
        fi
    fi
}

# Function to check prerequisites
check_prerequisites() {
    print_status "Checking prerequisites..."
    
    # Check if terraform is installed
    if ! command -v terraform &> /dev/null; then
        print_error "Terraform is not installed or not in PATH"
        exit 1
    fi
    
    # Check terraform version
    TERRAFORM_VERSION=$(terraform version -json | jq -r '.terraform_version')
    print_status "Using Terraform version: $TERRAFORM_VERSION"
    
    # Check if required files exist
    local required_files=("$WORKING_DIR/main.tf" "$WORKING_DIR/variables.tf")
    for file in "${required_files[@]}"; do
        if [[ ! -f "$file" ]]; then
            print_error "Required file not found: $file"
            exit 1
        fi
    done
    
    print_success "Prerequisites check passed"
}

# Function to backup current state
backup_state() {
    if [[ -f "$WORKING_DIR/terraform.tfstate" ]]; then
        local backup_dir="$WORKING_DIR/backups"
        local timestamp=$(date +"%Y%m%d_%H%M%S")
        local backup_file="$backup_dir/terraform.tfstate.backup.$timestamp"
        
        mkdir -p "$backup_dir"
        cp "$WORKING_DIR/terraform.tfstate" "$backup_file"
        print_status "State backed up to: $backup_file"
    fi
}

# Main deployment function
main() {
    print_status "Starting Terraform deployment for environment: $ENVIRONMENT"
    print_status "Working directory: $WORKING_DIR"
    
    # Change to working directory
    cd "$WORKING_DIR"
    
    # Run checks
    check_prerequisites
    validate_production
    
    # Initialize Terraform
    print_status "Initializing Terraform..."
    run_terraform "init -upgrade"
    print_success "Terraform initialized"
    
    # Validate configuration
    print_status "Validating Terraform configuration..."
    run_terraform "validate"
    print_success "Configuration is valid"
    
    # Format check
    print_status "Checking Terraform formatting..."
    if ! terraform fmt -check=true -diff=true; then
        print_warning "Code formatting issues found. Run 'terraform fmt -recursive' to fix."
    fi
    
    # Create and show plan
    print_status "Creating deployment plan..."
    if [[ "$VERBOSE" == "true" ]]; then
        terraform plan -out=tfplan
    else
        terraform plan -out=tfplan > /tmp/terraform_plan.log 2>&1
        echo "Plan created successfully. Use -v flag to see full output."
    fi
    
    # If plan-only mode, stop here
    if [[ "$PLAN_ONLY" == "true" ]]; then
        print_success "Plan-only mode completed"
        if [[ "$VERBOSE" != "true" ]]; then
            print_status "Plan details:"
            cat /tmp/terraform_plan.log
        fi
        exit 0
    fi
    
    # Backup state before applying
    backup_state
    
    # Apply the plan
    if [[ "$AUTO_APPROVE" == "true" ]]; then
        print_status "Auto-applying deployment plan..."
        run_terraform "apply tfplan"
    else
        print_status "Applying deployment plan..."
        terraform apply tfplan
    fi
    
    # Clean up plan file
    rm -f tfplan
    
    print_success "Deployment completed successfully!"
    
    # Show outputs
    print_status "Deployment outputs:"
    terraform output
}

# Trap to clean up on exit
trap 'rm -f tfplan /tmp/terraform_*.log' EXIT

# Run main function
main
```

#### <mark style="background: #FF5582A6;">destroy.sh</mark>

```bash
#!/bin/bash

# Terraform Proxmox Destroy Script
# Usage: ./scripts/destroy.sh [environment] [options]

set -e  # Exit on any error

# Default values
ENVIRONMENT="dev"
AUTO_APPROVE=false
TARGET=""
PLAN_ONLY=false
VERBOSE=false
WORKING_DIR=""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to show usage
show_usage() {
    cat << EOF
Usage: $0 [ENVIRONMENT] [OPTIONS]

ENVIRONMENT:
    dev         Destroy development environment (default)
    staging     Destroy staging environment
    prod        Destroy production environment

OPTIONS:
    -a, --auto-approve      Auto approve the destroy (skip confirmation)
    -t, --target RESOURCE   Destroy only specific resource (e.g., module.web_servers[0])
    -p, --plan-only         Only run terraform plan -destroy
    -v, --verbose           Enable verbose output
    -w, --working-dir       Specify working directory (default: environments/ENVIRONMENT)
    -h, --help             Show this help message

Examples:
    $0                                    # Destroy dev environment
    $0 staging                           # Destroy staging environment
    $0 prod --plan-only                  # Only plan prod destruction
    $0 dev --target module.web_servers   # Destroy only web servers
    $0 prod --auto-approve               # Destroy prod without confirmation

WARNING: This script will DESTROY infrastructure. Use with caution!
EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        dev|staging|prod)
            ENVIRONMENT="$1"
            shift
            ;;
        -a|--auto-approve)
            AUTO_APPROVE=true
            shift
            ;;
        -t|--target)
            TARGET="$2"
            shift 2
            ;;
        -p|--plan-only)
            PLAN_ONLY=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -w|--working-dir)
            WORKING_DIR="$2"
            shift 2
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac
done

# Set working directory if not specified
if [[ -z "$WORKING_DIR" ]]; then
    WORKING_DIR="environments/$ENVIRONMENT"
fi

# Check if working directory exists
if [[ ! -d "$WORKING_DIR" ]]; then
    print_error "Working directory '$WORKING_DIR' does not exist"
    exit 1
fi

# Function to run terraform command with proper error handling
run_terraform() {
    local cmd="$1"
    print_status "Running: terraform $cmd"
    
    if [[ "$VERBOSE" == "true" ]]; then
        terraform $cmd
    else
        terraform $cmd > /tmp/terraform_destroy_output.log 2>&1 || {
            print_error "Terraform command failed. Output:"
            cat /tmp/terraform_destroy_output.log
            exit 1
        }
    fi
}

# Function to validate environment for production
validate_production() {
    if [[ "$ENVIRONMENT" == "prod" ]]; then
        print_error "⚠️  DANGER: You are about to DESTROY PRODUCTION infrastructure! ⚠️"
        echo ""
        print_warning "This action will permanently delete all resources in the production environment."
        print_warning "This includes VMs, networks, and all data stored on them."
        echo ""
        echo -n "Type 'DESTROY PRODUCTION' (exactly) to confirm: "
        read -r confirmation
        if [[ "$confirmation" != "DESTROY PRODUCTION" ]]; then
            print_status "Destruction cancelled"
            exit 0
        fi
        
        echo ""
        echo -n "Are you absolutely sure? Type 'yes' one more time: "
        read -r final_confirmation
        if [[ "$final_confirmation" != "yes" ]]; then
            print_status "Destruction cancelled"
            exit 0
        fi
    else
        print_warning "You are about to DESTROY the $ENVIRONMENT environment!"
        if [[ -n "$TARGET" ]]; then
            print_warning "Target resource: $TARGET"
        else
            print_warning "This will destroy ALL resources in this environment."
        fi
        echo -n "Are you sure you want to continue? (type 'yes' to confirm): "
        read -r confirmation
        if [[ "$confirmation" != "yes" ]]; then
            print_status "Destruction cancelled"
            exit 0
        fi
    fi
}

# Function to check prerequisites
check_prerequisites() {
    print_status "Checking prerequisites..."
    
    # Check if terraform is installed
    if ! command -v terraform &> /dev/null; then
        print_error "Terraform is not installed or not in PATH"
        exit 1
    fi
    
    # Check if terraform state exists
    if [[ ! -f "$WORKING_DIR/terraform.tfstate" ]] && [[ ! -f "$WORKING_DIR/.terraform/terraform.tfstate" ]]; then
        print_warning "No terraform state found. Nothing to destroy."
        exit 0
    fi
    
    print_success "Prerequisites check passed"
}

# Function to backup current state
backup_state() {
    if [[ -f "$WORKING_DIR/terraform.tfstate" ]]; then
        local backup_dir="$WORKING_DIR/backups"
        local timestamp=$(date +"%Y%m%d_%H%M%S")
        local backup_file="$backup_dir/terraform.tfstate.backup.destroy.$timestamp"
        
        mkdir -p "$backup_dir"
        cp "$WORKING_DIR/terraform.tfstate" "$backup_file"
        print_status "State backed up to: $backup_file"
    fi
}

# Function to show current resources
show_current_resources() {
    print_status "Current resources in $ENVIRONMENT environment:"
    if terraform state list > /tmp/terraform_resources.log 2>/dev/null; then
        if [[ -s /tmp/terraform_resources.log ]]; then
            cat /tmp/terraform_resources.log | sed 's/^/  - /'
            echo ""
            print_status "Total resources: $(wc -l < /tmp/terraform_resources.log)"
        else
            print_status "No resources found in state"
            exit 0
        fi
    else
        print_warning "Could not list resources"
    fi
}

# Function to create destroy plan
create_destroy_plan() {
    print_status "Creating destruction plan..."
    
    local plan_cmd="plan -destroy"
    if [[ -n "$TARGET" ]]; then
        plan_cmd="$plan_cmd -target=$TARGET"
    fi
    plan_cmd="$plan_cmd -out=destroy.tfplan"
    
    if [[ "$VERBOSE" == "true" ]]; then
        terraform $plan_cmd
    else
        terraform $plan_cmd > /tmp/terraform_destroy_plan.log 2>&1
        print_status "Destroy plan created. Use -v flag to see full output."
    fi
}

# Function to apply destroy plan
apply_destroy_plan() {
    if [[ "$AUTO_APPROVE" == "true" ]]; then
        print_status "Auto-applying destruction plan..."
        run_terraform "apply destroy.tfplan"
    else
        print_status "Applying destruction plan..."
        terraform apply destroy.tfplan
    fi
}

# Function to cleanup after destroy
cleanup_after_destroy() {
    # Remove plan file
    rm -f destroy.tfplan
    
    # Check if any resources remain
    if terraform state list > /tmp/remaining_resources.log 2>/dev/null; then
        if [[ -s /tmp/remaining_resources.log ]]; then
            print_warning "Some resources may still exist:"
            cat /tmp/remaining_resources.log | sed 's/^/  - /'
        else
            print_success "All resources have been destroyed"
        fi
    fi
}

# Main destroy function
main() {
    if [[ -n "$TARGET" ]]; then
        print_status "Starting targeted destruction of '$TARGET' in environment: $ENVIRONMENT"
    else
        print_status "Starting complete destruction of environment: $ENVIRONMENT"
    fi
    print_status "Working directory: $WORKING_DIR"
    
    # Change to working directory
    cd "$WORKING_DIR"
    
    # Run checks
    check_prerequisites
    
    # Initialize Terraform (in case modules have changed)
    print_status "Initializing Terraform..."
    run_terraform "init"
    
    # Show current resources
    show_current_resources
    
    # Validate and confirm destruction
    validate_production
    
    # Backup state before destroying
    backup_state
    
    # Create destroy plan
    create_destroy_plan
    
    # If plan-only mode, stop here
    if [[ "$PLAN_ONLY" == "true" ]]; then
        print_success "Plan-only mode completed"
        if [[ "$VERBOSE" != "true" ]]; then
            print_status "Destroy plan details:"
            cat /tmp/terraform_destroy_plan.log
        fi
        rm -f destroy.tfplan
        exit 0
    fi
    
    # Apply the destroy plan
    apply_destroy_plan
    
    # Cleanup and final status
    cleanup_after_destroy
    
    if [[ -n "$TARGET" ]]; then
        print_success "Target resource '$TARGET' destroyed successfully!"
    else
        print_success "Environment '$ENVIRONMENT' destroyed successfully!"
    fi
}

# Trap to clean up on exit
trap 'rm -f destroy.tfplan /tmp/terraform_*.log' EXIT

# Run main function
main
```

Now create the scripts directory and make the files executable:
```bash
# Create the scripts directory
mkdir -p scripts

# Create the deploy.sh file
cat > scripts/deploy.sh << 'EOF'
[Copy the deploy.sh content from the artifact above]
EOF

# Create the destroy.sh file
cat > scripts/destroy.sh << 'EOF'
[Copy the destroy.sh content from the artifact above]
EOF

# Make scripts executable
chmod +x scripts/deploy.sh
chmod +x scripts/destroy.sh
```

## Usage Examples

### Deploy Script

```bash
# Deploy to development (default)
./scripts/deploy.sh

# Deploy to production with confirmation
./scripts/deploy.sh prod

# Only create a plan for staging
./scripts/deploy.sh staging --plan-only

# Deploy to production with auto-approval (dangerous!)
./scripts/deploy.sh prod --auto-approve

# Verbose deployment to see all output
./scripts/deploy.sh dev --verbose
```

### Destroy Script

```bash
# Destroy development environment
./scripts/destroy.sh

# Destroy specific resource
./scripts/destroy.sh dev --target module.web_servers[0]

# Only plan destruction
./scripts/destroy.sh staging --plan-only

# Destroy production (requires special confirmation)
./scripts/destroy.sh prod
```

## Features of These Scripts

### Deploy Script Features:

- ✅ **Environment validation** - Ensures you're deploying to the right environment
- ✅ **Prerequisites check** - Validates Terraform installation and required files
- ✅ **State backup** - Automatically backs up state before deployment
- ✅ **Plan review** - Creates and optionally shows deployment plan
- ✅ **Auto-approve option** - For CI/CD pipelines
- ✅ **Colored output** - Easy to read status messages
- ✅ **Error handling** - Proper error handling and cleanup

### Destroy Script Features:

- ✅ **Extra safety** - Multiple confirmations for production
- ✅ **Resource listing** - Shows what will be destroyed
- ✅ **Targeted destruction** - Can destroy specific resources
- ✅ **Plan-only mode** - Review destruction plan without applying
- ✅ **State backup** - Backs up state before destruction
- ✅ **Post-destroy verification** - Confirms what was actually destroyed

### Security Features:

- 🔒 **Production protection** - Special confirmation required for prod
- 🔒 **State backups** - Automatic backups before major operations
- 🔒 **Error handling** - Fails fast on errors
- 🔒 **Resource verification** - Shows exactly what will be affected