provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {}


resource "azurerm_monitor_diagnostic_setting" "diag-setting" {
  name                           = "toEventHub"
  target_resource_id             = data.azurerm_subscription.current.id
  eventhub_name                  = "subscriptionactivitylog"
  eventhub_authorization_rule_id = "/subscriptions/f3d20c9f-3cb5-45df-b6a8-32f7f4e3d1b6/resourceGroups/sample-1/providers/Microsoft.EventHub/namespaces/eventnamespaceankur/authorizationRules/RootManageSharedAccessKey"

  log {
    category = "Administrative"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }

  }
  log {
    category = "Policy"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }

  }
  log {
    category = "Security"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }

  }

}
