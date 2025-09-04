# CV Automation - Experience Library Builder
$currentDir = Get-Location

# Ensure we're in the cv-automation directory
if ($currentDir.Path -notlike "*cv-automation") {
    Write-Host "ERROR: Please run this script from your cv-automation folder!" -ForegroundColor Red
    Write-Host "Current location: $currentDir" -ForegroundColor Yellow
    exit
}

$baseDir = "experiences"

Write-Host "Creating experiences in: $currentDir\$baseDir" -ForegroundColor Green
Write-Host "Continue? (Y/N)" -ForegroundColor Yellow
$confirm = Read-Host
if ($confirm -ne 'Y') { exit }

# Create all experience data
$experiences = @{
    "exp-2022-2023-strengholt" = @{
        "bullets-categorized.json" = @'
{
  "categories": {
    "M&A_TRANSACTIONS": [
      {
        "bullet": "Led finance workstream in €45m sale to Venipak, securing 8.2× EBITDA multiple",
        "metrics": ["€45m", "8.2x"],
        "keywords": ["M&A", "sale", "exit", "EBITDA", "multiple"],
        "score_weight": 1.8
      }
    ],
    "CASH_MANAGEMENT": [
      {
        "bullet": "Stabilised cash cycle: built 13-week daily cash-forecast model, cut net working-capital days by 18",
        "metrics": ["13-week", "18 days"],
        "keywords": ["cash", "working capital", "forecast", "liquidity"],
        "score_weight": 1.5
      }
    ],
    "OPERATIONAL_FINANCE": [
      {
        "bullet": "Recovered €0.5m Amazon chargebacks through dispute-resolution overhaul",
        "metrics": ["€0.5m"],
        "keywords": ["recovery", "Amazon", "dispute", "process"],
        "score_weight": 1.3
      }
    ]
  }
}
'@
        "metadata.json" = @'
{
  "role": "Finance Director A.I.",
  "company": "Strengholt Entertainment & Logistics",
  "period": "2022-2023",
  "keywords": ["PE exit", "Amazon", "E-commerce"],
  "industries": ["E-commerce", "Logistics"]
}
'@
    }
    
    "exp-2015-2016-equinix" = @{
        "bullets-categorized.json" = @'
{
  "categories": {
    "OPERATIONAL_EXCELLENCE": [
      {
        "bullet": "Centralized EMEA revenue operations, cutting MRR bill-run errors by 60%",
        "metrics": ["60%"],
        "keywords": ["revenue operations", "MRR", "centralization"],
        "score_weight": 1.4
      }
    ],
    "P&L_MANAGEMENT": [
      {
        "bullet": "Oversaw €250m+ recurring revenues across multiple markets",
        "metrics": ["€250m+"],
        "keywords": ["revenue", "P&L", "recurring"],
        "score_weight": 1.5
      }
    ]
  }
}
'@
        "metadata.json" = @'
{
  "role": "Senior Finance Manager EMEA",
  "company": "Equinix",
  "period": "2015-2016",
  "keywords": ["Revenue Operations", "EMEA"],
  "industries": ["Data Centers"]
}
'@
    }
    
    "exp-2002-2005-pwc" = @{
        "bullets-categorized.json" = @'
{
  "categories": {
    "FOUNDATION": [
      {
        "bullet": "Big-4 trained: IFRS, US GAAP, audit and tax advisory for PE-backed clients",
        "metrics": [],
        "keywords": ["Big-4", "PwC", "IFRS", "US GAAP"],
        "score_weight": 1.2
      }
    ]
  }
}
'@
        "metadata.json" = @'
{
  "role": "Tax Consultant",
  "company": "PricewaterhouseCoopers",
  "period": "2002-2005",
  "keywords": ["Big-4", "Tax", "Audit"],
  "industries": ["Professional Services"]
}
'@
    }
}

# Create all directories and files
foreach ($exp in $experiences.Keys) {
    $expPath = Join-Path $baseDir $exp
    
    # Create directory
    New-Item -ItemType Directory -Force -Path $expPath | Out-Null
    Write-Host "Created: $expPath" -ForegroundColor Green
    
    # Create each file
    foreach ($file in $experiences[$exp].Keys) {
        $filePath = Join-Path $expPath $file
        Set-Content -Path $filePath -Value $experiences[$exp][$file] -Encoding UTF8
        Write-Host "  + $file" -ForegroundColor Cyan
    }
}

Write-Host "All files created successfully!" -ForegroundColor Yellow