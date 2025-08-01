resource "aws_wafv2_web_acl" "example" {
  provider = aws.us_east_1 
  name = "my-web-acl"
  scope = "CLOUDFRONT"

  default_action {
    allow {}
  }

  rule {
    name = "rule-1"
    priority = 1

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"

        rule_action_override {
          action_to_use {
            count {}
          }

          name = "SizeRestrictions_QUERYSTRING"
        }

        rule_action_override {
          action_to_use {
            count {}
          }

          name = "NoUserAgent_HEADER"
        }

        scope_down_statement {
          geo_match_statement {
            country_codes = ["ZA"]
          }
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name = "friendly-rule-metric-name"
      sampled_requests_enabled = false
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name = "friendly-metric-name"
    sampled_requests_enabled = true
  }
}

