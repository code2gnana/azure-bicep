param location string = resourceGroup().location
param namePrefix string ='stg'

var storageSku = 'Standard_LRS' // declare variable and assign value
var storageAccountName = '${namePrefix}${uniqueString(resourceGroup().id)}'
 
//param storageAccountName string = 'gbstorageaccount2021' // must be globally unique

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  //name: uniqueString(resourceGroup().id) //generates unique name based on resource group ID
  name: storageAccountName
  location: location
  kind: 'Storage'
  sku: {
    name: storageSku //assign variable
  }
}

output storageID string =stg.id


