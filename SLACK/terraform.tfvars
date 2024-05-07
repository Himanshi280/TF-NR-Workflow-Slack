policy-name = "workflow(slack)-policy"
# destination = {
#   name = "email-destination"
#   type = "EMAIL"

#   key   = "email"
#   value = "himanshisoni2805@gmail.com"

# }
notification = {
  name    = "slack-notification-channel"
  type    = "SLACK"
  product = "IINT"


  key = "channelId"
  value = "C071X6N905A"
  
}
workflow = {
  name                  = "workflow_2"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

#   issues_filter = {
    name1 = "Filter-name"
    type = "FILTER"

    # predicate = {
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
    # }
#   }

#   destination = {
    notification_triggers = ["ACTIVATED"]
#   }
}