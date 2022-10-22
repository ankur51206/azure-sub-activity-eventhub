variable "name" {
  description = "The name of the diag-setting.."
  type        = string
  default     = "toEventHub"
}

variable "eventhub_name" {
  description = "The type of the eventhub."
  type        = string
  default     = "myeventhubankur"
}

variable "resource_group_name" {
  description = "The type of the rg."
  type        = string
  default     = "sample-1"
}

variable "event_namespace_name" {
  description = "The type of the eventhub namespace."
  type        = string
  default     = "eventnamespaceankur"
}

variable "eventhub_auth_name" {
  description = "The type of the eventhub."
  type        = string
  default     = "RootManageSharedAccessKey"
}

