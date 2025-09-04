# CV Automation - Experience Library Builder
$baseDir = "cv-automation/experiences"

# Create all experience data in one script
$experiences = @{
    "exp-2022-2023-strengholt" = @{
        "bullets-raw.md" = @"
# Strengholt Entertainment & Logistics - Finance Director A.I. (2022-2023)

- Stabilised cash cycle: built 13-week daily cash-forecast model (±2% accuracy), cut net working-capital days by 18
- Led finance workstream in €45m sale to Venipak, securing 8.2× EBITDA multiple
- Recovered €0.5m Amazon chargebacks through dispute-resolution overhaul
- Implemented Amazon Direct Fulfilment integration, lifting OTIF from 93% → 99%
- Enhanced reporting: moved month-end close from D+10 → D+5
- Rolled out Power BI margin dashboards for product/category owners
"@
        "bullets-categorized.json" = @"
{
  "categories": {
    "M&A_TRANSACTIONS": [
      {
        "bullet": "Led finance workstream in €45m sale to Venipak, securing 8.2× EBITDA multiple",
        "metrics": ["€45m", "8.2×"],
        "keywords": ["M&A", "sale", "exit", "EBITDA", "multiple", "transaction"],
        "score_weight": 1.8
      }
    ],
    "CASH_MANAGEMENT": [
      {
        "bullet": "Stabilised cash cycle: built 13-week daily cash-forecast model (±2% accuracy), cut net working-capital days by 18",
        "metrics": ["13-week", "2%", "18 days"],
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
      },
      {
        "bullet": "Implemented Amazon Direct Fulfilment integration, lifting OTIF from 93% → 99%",
        "metrics": ["93%", "99%"],
        "keywords": ["Amazon", "fulfilment", "OTIF", "operations"],
        "score_weight": 1.2
      }
    ],
    "REPORTING_ANALYTICS": [
      {
        "bullet": "Enhanced reporting: moved month-end close from D+10 → D+5",
        "metrics": ["D+10", "D+5"],
        "keywords": ["reporting", "month-end", "close", "efficiency"],
        "score_weight": 1.1
      },
      {
        "bullet": "Rolled out Power BI margin dashboards for product/category owners",
        "metrics": [],
        "keywords": ["Power BI", "dashboard", "margin", "analytics"],
        "score_weight": 1.1
      }
    ]
  }
}
"@
        "metadata.json" = @"
{
  "role": "Finance Director A.I.",
  "company": "Strengholt Entertainment & Logistics",
  "period": "2022-2023",
  "duration_months": 14,
  "keywords": ["PE exit", "Amazon", "E-commerce", "Cash management"],
  "industries": ["E-commerce", "Logistics"],
  "achievements": {
    "exit_multiple": "8.2x EBITDA",
    "cash_improvement": "18 days WC reduction",
    "recovery": "€0.5m"
  }
}
"@
    }
    
    "exp-2015-2016-equinix" = @{
        "bullets-raw.md" = @"
# Equinix - Senior Finance Manager EMEA (2015-2016)

- Centralized EMEA revenue operations, cutting MRR bill-run errors by 60%
- Oversaw €250m+ recurring revenues across multiple markets
- Standardized revenue recognition policies across 15 countries
- Built automated billing validation reducing manual checks by 70%
"@
        "bullets-categorized.json" = @"
{
  "categories": {
    "OPERATIONAL_EXCELLENCE": [
      {
        "bullet": "Centralized EMEA revenue operations, cutting MRR bill-run errors by 60%",
        "metrics": ["60%"],
        "keywords": ["revenue operations", "MRR", "centralization", "EMEA"],
        "score_weight": 1.4
      },
      {
        "bullet": "Built automated billing validation reducing manual checks by 70%",
        "metrics": ["70%"],
        "keywords": ["automation", "billing", "validation", "efficiency"],
        "score_weight": 1.3
      }
    ],
    "P&L_MANAGEMENT": [
      {
        "bullet": "Oversaw €250m+ recurring revenues across multiple markets",
        "metrics": ["€250m+"],
        "keywords": ["revenue", "P&L", "recurring", "scale"],
        "score_weight": 1.5
      }
    ],
    "COMPLIANCE": [
      {
        "bullet": "Standardized revenue recognition policies across 15 countries",
        "metrics": ["15"],
        "keywords": ["revenue recognition", "compliance", "standardization"],
        "score_weight": 1.2
      }
    ]
  }
}
"@
        "metadata.json" = @"
{
  "role": "Senior Finance Manager EMEA",
  "company": "Equinix",
  "period": "2015-2016",
  "keywords": ["Revenue Operations", "EMEA", "Scale", "MRR"],
  "industries": ["Data Centers", "Technology Infrastructure"],
  "achievements": {
    "revenue_managed": "€250m+",
    "error_reduction": "60%",
    "countries": "15"
  }
}
"@
    }
    
    "exp-2002-2005-pwc" = @{
        "bullets-raw.md" = @"
# PricewaterhouseCoopers - Tax Consultant (2002-2005)

- Big-4 trained: IFRS, US GAAP, audit and tax advisory for PE-backed clients
- Led tax structuring for €100m+ cross-border M&A transactions
- Delivered transfer pricing studies for multinational corporations
"@
        "bullets-categorized.json" = @"
{
  "categories": {
    "FOUNDATION": [
      {
        "bullet": "Big-4 trained: IFRS, US GAAP, audit and tax advisory for PE-backed clients",
        "metrics": [],
        "keywords": ["Big-4", "PwC", "IFRS", "US GAAP", "audit", "PE"],
        "score_weight": 1.2
      }
    ],
    "TAX_STRUCTURING": [
      {
        "bullet": "Led tax structuring for €100m+ cross-border M&A transactions",
        "metrics": ["€100m+"],
        "keywords": ["tax", "M&A", "cross-border", "structuring"],
        "score_weight": 1.3
      }
    ]
  }
}
"@
        "metadata.json" = @"
{
  "role": "Tax Consultant",
  "company": "PricewaterhouseCoopers",
  "period": "2002-2005",
  "keywords": ["Big-4", "Tax", "Audit", "IFRS", "US GAAP"],
  "industries": ["Professional Services", "Audit", "Tax Advisory"],
  "achievements": {
    "foundation": "Big-4 training",
    "transaction_value": "€100m+"
  }
}
"@
    }
}

# Create all directories and files
foreach ($exp in $experiences.Keys) {
    $expPath = Join-Path $baseDir $exp
    
    # Create directory
    New-Item -ItemType Directory -Force -Path $expPath | Out-Null
    Write-Host "Created folder: $expPath" -ForegroundColor Green
    
    # Create each file
    foreach ($file in $experiences[$exp].Keys) {
        $filePath = Join-Path $expPath $file
        Set-Content -Path $filePath -Value $experiences[$exp][$file] -Encoding UTF8
        Write-Host "  Created file: $file" -ForegroundColor Cyan
    }
}

Write-Host "`nAll experience files created successfully!" -ForegroundColor Yellow
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Run: git add ." -ForegroundColor White
Write-Host "2. Run: git commit -m 'Add all experience library files'" -ForegroundColor White
Write-Host "3. Run: git push origin main" -ForegroundColor White