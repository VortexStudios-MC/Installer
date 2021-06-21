--[[--------------------------------------------------------

    Author: Voidus X
    Date: 6/21/2021

    
                    Vortex Studios © 2020
            All rights are reserved. [MIT License]

]]----------------------------------------------------------

InstallationContent = {
    Name = "Vortex OS",
    Version = 1,
    Description = "An customly made operating system made within the Reinitalized ATM6 server."
    License = [[
    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
            
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

    ]],
    Copyright = {'Year'=2020,'Author'='Voidus X'},
    UpdateCheck = function(SetupType)
        if SetupType == 2 then
         fs.delete("vsys")   
    end,
    RebootFinisher = true
}

local installationConfig = {
    GitUser = 'VortexStudios-MC',
    Repository = 'installer-os',
}

local WarningMsg = 'An unexpected error occured within the fetched installation, the process is automatically terminated safely.'
local ErrorMsg = 'An unexpected error has occured while fetching the installer, please try again later.'
local File = '/vsys/main.lua'
local RepoURL = 'https://raw.githubusercontent.com/'..InstallationConfig.GitUser..'/'..InstallationConfig.Repository..File
local Response, Contents;

local Success, Error = pcall(function() 
    Request = _G.http.get(RepoURL)
    if (not Request) then
        error()
    end
    if (Request.getResponseCode ~= 200) then
        error()
    end
    Response = Request
end)

if (not Success) then
    error(ErrorMsg)
else 
    Contents = Response.readAll()
end

if (not Contents) then
    warn(WarningMsg)
    return
end