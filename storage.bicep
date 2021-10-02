@minLength(3)
@maxLength(24)
param stgActName string

@allowed([
  'Standard_LRS'
  'Standard_GRS'
])
param stgActSku string = 'Standard_LRS'

param stgTags object = {
  Environment: 'Lab'
  Dept: 'IT'
}

resource storage 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: stgActName
  sku:{
    name: stgActSku
  } 
  kind: 'StorageV2'
  location: 'centralus'
  tags: stgTags
}
