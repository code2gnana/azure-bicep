param location string = 'eastus'

@minLength(3)
@maxLength(24)  

param storageAccountName string = 'gbstorageaccount2021' // must be globally unique
var storageSku = 'Standard_LRS'

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageAccountName
  location: location
  kind: 'Storage'
  sku: {
    name: storageSku
  }
}


