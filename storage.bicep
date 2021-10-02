@minLength(3)
@maxLength(19)
param stgActPrefix string

@allowed([
  'Standard_LRS'
  'Standard_GRS'
])
param stgActSku string = 'Standard_LRS'

param stgTags object = {
  Environment: 'Lab'
  Dept: 'IT'
}

param location string = resourceGroup().location

// var uniqueId = uniqueString(resourceGroup().id, deployment().name)
// var uniqueIdShort = take(uniqueId, 5)
// var stgActName = '${stgActPrefix}${uniqueIdShort}'
// OR this one liner:

var stgActName = '${stgActPrefix}${take (uniqueString(resourceGroup().id, deployment().name),5)}'

// var location = resourceGroup().location

resource storage 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: stgActName
  sku:{
    name: stgActSku
  } 
  kind: 'StorageV2'
  location: location
  tags: stgTags
}
