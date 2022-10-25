provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {}


resource "azurerm_monitor_diagnostic_setting" "diag-setting" {
  name                           = var.name
  target_resource_id             = data.azurerm_subscription.current.id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_rule_id

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
