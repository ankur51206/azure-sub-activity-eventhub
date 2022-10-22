provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {}



data "azurerm_eventhub" "barevent" {
  name                = var.eventhub_name
  resource_group_name = var.resource_group_name
  namespace_name      = var.event_namespace_name
}

data "azurerm_eventhub_namespace_authorization_rule" "bareventauth" {
  name                = var.eventhub_auth_name
  resource_group_name = var.resource_group_name
  namespace_name      = var.event_namespace_name
}


resource "azurerm_monitor_diagnostic_setting" "diag-setting" {
  name                           = var.name
  target_resource_id             = data.azurerm_subscription.current.id
  eventhub_name                  = data.azurerm_eventhub.barevent.name
  eventhub_authorization_rule_id = data.azurerm_eventhub_namespace_authorization_rule.bareventauth.id

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
