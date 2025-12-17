local nxml = dofile_once("mods/better_cjk_pixel_font/files/libs/nxml.lua")

local CJKLocal = {
    "zh-cn",
    "jp",
    "ko",
}

local CJKFont = "data/fonts/generated/fusion-pixel-12px_%s_font_48.bin"
local CJKHugeFontPath = "data/fonts/generated/fusion-pixel-12px_huge_%s_font_48.bin"
local CSVPath = "data/translations/%s.xml"

for _, v in ipairs(CJKLocal) do
    local ThisCsvPath = string.format(CSVPath, v)
    local fontXml = nxml.parse(ModTextFileGetContent(ThisCsvPath))
    local HugeFont = string.format(CJKHugeFontPath, v)
    local NormalFont = string.format(CJKFont, v)
    fontXml.attr.font_default = NormalFont
    fontXml.attr.font_inventory_title = NormalFont
    fontXml.attr.font_important_message_title = HugeFont
    fontXml.attr.font_world_space_message = NormalFont
    fontXml.attr.fonts_utf8 = "1"
    ModTextFileSetContent(ThisCsvPath, tostring(fontXml))
end