# https://console.cloud.yandex.ru/cloud?section=overview
# Идентификатор облака
variable "folder_id" {
  description = "Folder ID"
  type        = string
  default     = "b1gpvglfer9lsrg6pc25"
}

# https://console.cloud.yandex.ru/cloud?section=overview
# Идентификатор облака
variable "cloud_id" {
  description = "Cloud ID"
  type        = string
  default     = "b1g8pvtb0smtp1r5kg91"
}

variable "token" {
  description = "Authorization Token"
  type        = string
  default     = "AQAAAA......-aI8U"
}

variable "zone_a" {
  description = "Access zone - a"
  type        = string
  default     = "ru-central1-a"
}