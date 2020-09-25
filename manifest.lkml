project_name: "block-keboola-finance_essentials"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-keboola-finance_essentials-config"
  export: override_required
}

constant: CONNECTION {
  value: "keboola_block_xero"
  export: override_required
}

constant: SCHEMA_NAME {
  value: "WORKSPACE_566152295"
  export: override_required
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: SCHEMA_NAME {
    value: "@{SCHEMA_NAME}"
  }
}
