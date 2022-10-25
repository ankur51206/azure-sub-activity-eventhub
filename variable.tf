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




variable "eventhub_rule_id" {
  type        = map
  default     = {
		eastus2 = {
			cloudops = "/subscriptions/f3d20c9f-3cb5-45df-b6a8-32f7f4e3d1b6/resourceGroups/sample-1/providers/Microsoft.EventHub/namespaces/myeventusankur/authorizationRules/RootManageSharedAccessKey"
			}
		eastus = {
			cloudops = "/subscriptions/f3d20c9f-3cb5-45df-b6a8-32f7f4e3d1b6/resourceGroups/sample-1/providers/Microsoft.EventHub/namespaces/eventnamespaceankur/authorizationRules/RootManageSharedAccessKey"
			}
	}
}
