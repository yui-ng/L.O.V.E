# 🐾 L.O.V.E. install.ps1 — Windows 入口
# Windows 上无法直接跑 install.sh，本脚本负责带路：
#   ① 确保 WSL 可用（有发行版） ② 把 Windows 路径转成 /mnt/c/... ③ 交棒给 WSL 里的 bash
# 用法: powershell -ExecutionPolicy Bypass -File install.ps1
$ErrorActionPreference = "Stop"

Write-Host "🐾 L.O.V.E. install — Windows 入口"

# ---------- 1. 检查 wsl.exe ----------
$wsl = Get-Command wsl.exe -ErrorAction SilentlyContinue
if (-not $wsl) {
  Write-Host "❌ 未检测到 WSL。"
  Write-Host "   请以管理员身份在 PowerShell 里运行: wsl --install"
  Write-Host "   重启后再跑一次本脚本。"
  exit 1
}

# ---------- 2. 检查 WSL 发行版 ----------
$distros = (& wsl.exe -l -q 2>$null | Where-Object { $_ -match '\S' })
if (-not $distros) {
  Write-Host "❌ WSL 已装但没有发行版。"
  Write-Host "   运行: wsl --install -d Ubuntu"
  exit 1
}

# ---------- 3. Windows 路径 → WSL 挂载路径 ----------
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Drive = $ScriptDir.Substring(0, 1).ToLower()
$Rest  = $ScriptDir.Substring(2).Replace('\', '/')
$WslDir = "/mnt/$Drive$Rest"
Write-Host "📂 脚本在 WSL 中的路径: $WslDir"

# ---------- 4. 交棒给 WSL 里的 bash ----------
Write-Host "🚀 交棒给 WSL，执行 install.sh ..."
Write-Host ""
& wsl.exe bash "$WslDir/install.sh" @args
if ($LASTEXITCODE -ne 0) {
  Write-Host "❌ install.sh 执行失败（退出码 $LASTEXITCODE）"
  exit $LASTEXITCODE
}

Write-Host ""
Write-Host "🎉 装好了！"
Write-Host "   💡 家默认放在 WSL 的 ~/.love（Windows 侧路径: \\wsl$\Ubuntu\home\你的用户\.love）"
Write-Host "   💡 想换位置: wsl bash -c 'LOVE_HOME=/mnt/c/Users/你/.love bash /mnt/.../install.sh'"
