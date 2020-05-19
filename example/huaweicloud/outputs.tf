output "ids" {
  value = module.ecs.id
}

output "key_name" {
  description = "List of key names of instances"
  value       = module.ecs.key_name
}

output "availability_zone" {
  value = module.ecs.availability_zone
}

output "nics" {
  value = module.ecs.nics
}

output "security_group_id" {
  value = module.security_group.this_security_group_id
}

output "tags" {
  value = module.ecs.tags
}

