@description('Specifies the name of teh storage account. Lenght must be between 3 and 24 charachters and all characters in lower-case.')
@metadata({
  addedOn: '2021-04-11'
})
@minLength(3)
@maxLength(24)

param namePrefix string ='stg'

@description('Specifies the storage account tier. Default value is Hot.')
@allowed([
  'Hot'
  'Cool'
])
param accessTier string = 'Hot'

var location = resourceGroup().location
var storageAccountName = '${namePrefix}${uniqueString(resourceGroup().id)}'

resource sa 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageAccountName
  location: location
  sku:{
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: accessTier
  }
}

output StorageID string = sa.id
