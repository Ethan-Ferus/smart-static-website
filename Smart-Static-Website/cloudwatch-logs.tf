resource "aws_cloudwatch_log_group" "log-group" {
    name = var.log_group_name

    retention_in_days = var.retention_period
    log_group_class = "STANDARD"

    tags = {
        Enviroment = "Log Group"
    }
}