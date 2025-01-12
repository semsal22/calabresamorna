-- Correções iniciais antes de carregar a Orion Library
getgenv().gethui = game.CoreGui
print("Erros sendo corrigidos")

-- Carregar Orion Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Estrutura inicial com 10 categorias, cada uma com 3 scripts de exemplo
local scripts = {
    ["Jailbreak"] = {
        { Name = "Auto Rob", Code = "loadstring(game:HttpGet('https://example.com/jailbreak-autorob.lua'))()" },
        { Name = "Infinite Nitro", Code = "loadstring(game:HttpGet('https://example.com/jailbreak-nitro.lua'))()" },
        { Name = "Speed Hack", Code = "loadstring(game:HttpGet('https://example.com/jailbreak-speedhack.lua'))()" }
    },
    ["Arsenal"] = {
        { Name = "sanity.lol - KEY_k7DqBcjp2q", Code = "loadstring(game:HttpGet('https://raw.githubusercontent.com/helldevelopment/RobloxScripts/main/SanityLoader.lua'))()" },
        { Name = "ESP", Code = "loadstring(game:HttpGet('https://example.com/arsenal-esp.lua'))()" },
        { Name = "No Recoil", Code = "loadstring(game:HttpGet('https://example.com/arsenal-norecoil.lua'))()" }
    },
    ["Adopt Me"] = {
        { Name = "Auto Farm", Code = "loadstring(game:HttpGet('https://example.com/adoptme-autofarm.lua'))()" },
        { Name = "Pet Dupe", Code = "loadstring(game:HttpGet('https://example.com/adoptme-petdupe.lua'))()" },
        { Name = "Infinite Money", Code = "loadstring(game:HttpGet('https://example.com/adoptme-money.lua'))()" }
    },
    ["Brookhaven"] = {
        { Name = "Car Speed", Code = "loadstring(game:HttpGet('https://example.com/brookhaven-carspeed.lua'))()" },
        { Name = "Fly Hack", Code = "loadstring(game:HttpGet('https://example.com/brookhaven-fly.lua'))()" },
        { Name = "Teleport", Code = "loadstring(game:HttpGet('https://example.com/brookhaven-teleport.lua'))()" }
    },
    ["Tower of Hell"] = {
        { Name = "Auto Win", Code = "loadstring(game:HttpGet('https://example.com/towerofhell-autowin.lua'))()" },
        { Name = "Anti Kill", Code = "loadstring(game:HttpGet('https://example.com/towerofhell-antifall.lua'))()" },
        { Name = "ESP Players", Code = "loadstring(game:HttpGet('https://example.com/towerofhell-esp.lua'))()" }
    },
    ["MM2"] = {
        { Name = "Murder ESP", Code = "loadstring(game:HttpGet('https://example.com/mm2-esp.lua'))()" },
        { Name = "Knife Reach", Code = "loadstring(game:HttpGet('https://example.com/mm2-knifereach.lua'))()" },
        { Name = "God Mode", Code = "loadstring(game:HttpGet('https://example.com/mm2-godmode.lua'))()" }
    },
    ["Blox Fruits"] = {
        { Name = "Auto Farm", Code = "loadstring(game:HttpGet('https://example.com/bloxfruits-autofarm.lua'))()" },
        { Name = "Teleport NPCs", Code = "loadstring(game:HttpGet('https://example.com/bloxfruits-teleport.lua'))()" },
        { Name = "Devil Fruit ESP", Code = "loadstring(game:HttpGet('https://example.com/bloxfruits-fruites.lua'))()" }
    },
    ["Pet Simulator X"] = {
        { Name = "Auto Hatch", Code = "loadstring(game:HttpGet('https://example.com/petsimx-autohatch.lua'))()" },
        { Name = "Auto Collect", Code = "loadstring(game:HttpGet('https://example.com/petsimx-autocollect.lua'))()" },
        { Name = "Infinite Gems", Code = "loadstring(game:HttpGet('https://example.com/petsimx-gems.lua'))()" }
    },
    ["Shindo Life"] = {
        { Name = "Auto Farm", Code = "loadstring(game:HttpGet('https://example.com/shindolife-autofarm.lua'))()" },
        { Name = "Scroll ESP", Code = "loadstring(game:HttpGet('https://example.com/shindolife-esp.lua'))()" },
        { Name = "Auto Boss", Code = "loadstring(game:HttpGet('https://example.com/shindolife-autoboss.lua'))()" }
    },
    ["Universal"] = {
        { Name = "Fly Hack", Code = "loadstring(game:HttpGet('https://example.com/universal-fly.lua'))()" },
        { Name = "Infinite Jump", Code = "loadstring(game:HttpGet('https://example.com/universal-infinitejump.lua'))()" },
        { Name = "No Clip", Code = "loadstring(game:HttpGet('https://example.com/universal-noclip.lua'))()" }
    }
}

-- Função para criar uma aba de categoria
local function createCategoryTab(window, categoryName, scriptsList)
    local Tab = window:MakeTab({
        Name = categoryName,
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Adiciona os scripts à aba
    for _, script in ipairs(scriptsList) do
        Tab:AddButton({
            Name = script.Name,
            Callback = function()
                local success, errorMessage = pcall(function()
                    loadstring(script.Code)()
                end)
                if success then
                    OrionLib:MakeNotification({
                        Name = "Executado",
                        Content = "Script '" .. script.Name .. "' executado com sucesso!",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                else
                    OrionLib:MakeNotification({
                        Name = "Erro",
                        Content = "Erro ao executar '" .. script.Name .. "': " .. errorMessage,
                        Image = "rbxassetid://4483345753",
                        Time = 5
                    })
                end
            end
        })
    end
end

-- Função para criar a aba de configurações
local function createConfigTab(window)
    local ConfigTab = window:MakeTab({
        Name = "Configurações",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Adiciona configurações (você pode adicionar mais configurações aqui)
    ConfigTab:AddButton({
        Name = "Corrigir Erros",
        Callback = function()
            getgenv().gethui = game.CoreGui
            print("Erros sendo corrigidos")
            OrionLib:MakeNotification({
                Name = "Erros Corrigidos",
                Content = "Erros corrigidos com sucesso!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    })
end

-- Janela principal
local Window = OrionLib:MakeWindow({
    Name = "Scripts Hub", -- Nome do executor
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "ScriptsHubConfigs"
})

-- Criação das categorias
for categoryName, scriptsList in pairs(scripts) do
    createCategoryTab(Window, categoryName, scriptsList)
end

-- Criação da aba de configurações
createConfigTab(Window)

-- Notificação de boas-vindas
OrionLib:MakeNotification({
    Name = "Bem-vindo",
    Content = "Scripts Hub carregado com sucesso!",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- Inicializar a interface
OrionLib:Init()
