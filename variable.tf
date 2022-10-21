variable "name" {
  description = "The name of the diag-setting.."
  type        = string
  default     = "toEventHub"
}

variable "eventhub_name" {
  description = "The type of the policy."
  type        = string
  default     = "subscriptionactivitylog"
}
