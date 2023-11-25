resource "aws_wafv2_web_acl" "app1_waf_acl" {
  name        = "app1-web-acl"
  description = "Web ACL for app1"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "IPBlockRule"
    priority = 1

    action {
      block {}
    }

    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.ip_block_list.arn
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "IPBlockRule"
      sampled_requests_enabled   = false
    }
  }

  rule {
    name     = "AWSManagedRulesKnownBadInputs"
    priority = 2

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "AWSManagedRulesKnownBadInputs"
      sampled_requests_enabled   = false
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "app1WebACL"
    sampled_requests_enabled   = false
  }

  tags = {
    Name    = "app1-web-acl"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}

resource "aws_wafv2_ip_set" "ip_block_list" {
  name               = "ip-block-list"
  description        = "List of blocked IP addresses"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"

addresses = [
    "1.188.0.0/16",
    "1.80.0.0/16",
    "101.144.0.0/16",
    "101.16.0.0/16"
]

 tags = {
    Name    = "ip-block-list"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}


resource "aws_wafv2_web_acl_association" "app1_waf_alb_association" {
  resource_arn = aws_lb.app1_alb.arn
  web_acl_arn  = aws_wafv2_web_acl.app1_waf_acl.arn
}

#AWS-AWSManagedRulesKnownBadInputsRuleSet
#AWS-AWSManagedRulesAmazonIpReputationList
#AWS-AWSManagedRulesAnonymousIpList
#AWS-AWSManagedRulesCommonRuleSet
#AWS-AWSManagedRulesLinuxRuleSet

