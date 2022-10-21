provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {}



data "azurerm_eventhub" "barevent" {
  name                = "myeventhubankur"
  resource_group_name = "sample-1"
  namespace_name      = "eventnamespaceankur"
}

data "azurerm_eventhub_namespace_authorization_rule" "bareventauth" {
  name                = "RootManageSharedAccessKey"
  resource_group_name = "sample-1"
  namespace_name      = "eventnamespaceankur"
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
