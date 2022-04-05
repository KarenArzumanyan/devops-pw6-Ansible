# https://console.cloud.yandex.ru/cloud?section=overview
# Идентификатор облака
variable "folder_id" {
    description = "Выбранный ID каталога"
    type = string
    default = "b1gpvglfer9lsrg6pc25"  
}

# https://console.cloud.yandex.ru/cloud?section=overview
# Идентификатор облака
variable "cloud_id" {
    description = "Выбранный ID обалка"
    type = string
    default = "b1g8pvtb0smtp1r5kg91"  
}

variable "token" {
    description = "Token авторизации"
    type = string
    default = "....." 
}

variable "zone" {
    description = "Выбранная зона"
    type = string
    default = "ru-central1-a"
}