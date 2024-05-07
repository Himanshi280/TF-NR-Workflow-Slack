resource "newrelic_alert_policy" "policy" {

  name = var.policy-name
}

# import {
#   to = newrelic_notification_destination.slack_channel
#   id = "e493088a-ea54-4e88-8000-5da42aaaef2b"

# }

# resource "newrelic_notification_destination" "slack_channel" {
#   # lifecycle {
#   #   ignore_changes = [auth_token]
#   # }
#   name       = "Slack Channel"
#   type       = "SLACK"
#   # # auth_token {
#   # #   prefix = "Bearer"

#   # # }
  
#   property  {
#                 display_value= ""
#                 key= "teamname"
#                 label =  ""
#                 value="xyz"
#               }
            
# }

# resource "newrelic_notification_destination" "foo" {
#   name = var.destination.name
#   type = var.destination.type

#   property {
#     key   = var.destination.key
#     value = var.destination.value
#   }
# }
resource "newrelic_notification_channel" "foo" {

  name           = var.notification.name
  type           = var.notification.type
  destination_id = "3f004470-011f-46d3-a981-69c178d618e4"
  product        = var.notification.product

  property {
    key   = var.notification.key
    value = var.notification.value
  }


}
resource "newrelic_workflow" "workflow" {
  name                  = var.workflow.name
  muting_rules_handling = var.workflow.muting_rules_handling

  issues_filter {
    name = var.workflow.name1
    type = var.workflow.type

    predicate {
      attribute = var.workflow.attribute
      operator  = var.workflow.operator
      values    = [newrelic_alert_policy.policy.id]
    }
  }

  destination {
    channel_id            = newrelic_notification_channel.foo.id
    notification_triggers = var.workflow.notification_triggers
  }
}
