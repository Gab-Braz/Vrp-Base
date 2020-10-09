ui_page "nui/ui.html"

files {
    "nui/ui.html",
    "nui/ui.js",
    "nui/img/agua.png",
    "nui/img/espaguete.png",
    "nui/img/leite.png",
    "nui/img/limonada.png",
    "nui/img/pao.png",
    "nui/img/pipoca.png",
    "nui/img/pizza.png",
    "nui/img/rosquinha.png",
    "nui/img/suco.png",
    "nui/img/vinho.png",
    "nui/img/vodka.png",
    "nui/img/gps.png",
    "nui/fonte/gta-fonte.ttf"
}
client_script {
    "client.lua",
}

server_script {
    "@vrp/lib/utils.lua",
    "server.lua",
}