package test

import (
  "testing"
  "github.com/gruntwork-io/terratest/modules/terraform"
)

func TestVpc(t *testing.T) {
  opts := &terraform.Options{
    TerraformDir: "../",
    Vars: map[string]interface{}{"environment": "ci"},
    NoColor: true,
  }

  terraform.InitAndPlan(t, opts)
}
