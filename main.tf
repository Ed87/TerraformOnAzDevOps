provider "azurerm" {
    version =  "2.92.0"
    features {}
}

resource "azurerm_resource_group" "tf_test" {

  name = "terraform"
  location = "Australia East"
}

resource "azurerm_container_group" "tfcg_test" {
  name      = "weatherapi"
  location  = azurerm_resource_group.tf_test.location
  resource_group_name = azurerm_resource_group.tf_test.name

  ip_address_type = "public"
  dns_name_label = "golideapitf"
  os_type = "Linux"

  container {
    name = "weatherapi"
    image = "golide/weatherapii"
    cpu = "1"
    memory = "1"

    ports {
      port = 80
      protocol = "TCP"
    }  
  } 
}
