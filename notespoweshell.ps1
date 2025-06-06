Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# GitHub repository URL
$repoURL = "https://raw.githubusercontent.com/Mrkweb15/notes/main/notes"

# File paths in the repository
$notePad1Path = "$repoURL/note1.txt"
$notePad2Path = "$repoURL/note2.txt"

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = "mr.K Notes"
$form.Size = New-Object System.Drawing.Size(800, 600)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedSingle'
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::Black

# Create a label for the title
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "mr.K Notes"
$titleLabel.ForeColor = [System.Drawing.Color]::White
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 20, [System.Drawing.FontStyle]::Bold)
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(20, 20)

# Create a text box to display the note pad content
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Multiline = $true
$textBox.ScrollBars = 'Both'
$textBox.Size = New-Object System.Drawing.Size(750, 400)
$textBox.Location = New-Object System.Drawing.Point(20, 80)
$textBox.Anchor = 'Top, Left, Right, Bottom'
$textBox.BackColor = [System.Drawing.Color]::Black
$textBox.ForeColor = [System.Drawing.Color]::White
$textBox.Font = New-Object System.Drawing.Font("Consolas", 12)

# Function to fetch and display the content of the online note pad
function Display-NotePad {
    param (
        [string]$fileURL
    )
    
    $response = Invoke-WebRequest -Uri $fileURL
    if ($response.StatusCode -eq 200) {
        $content = $response.Content
        $textBox.Text = $content
    } else {
        $textBox.Text = "Failed to fetch content."
    }
}

# Add event handlers for the buttons
$button1 = New-Object System.Windows.Forms.Button
$button1.Text = "PROMPS"
$button1.Size = New-Object System.Drawing.Size(150, 40)
$button1.Location = New-Object System.Drawing.Point(20, 500)
$button1.Anchor = 'Bottom, Left'
$button1.FlatStyle = 'Flat'
$button1.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$button1.ForeColor = [System.Drawing.Color]::White
$button1.Font = New-Object System.Drawing.Font("Segoe UI", 12)
$button1.Add_Click({ Display-NotePad -fileURL $notePad1Path })

# Neon border effect for button 1
$button1.Add_MouseEnter({
    $this.FlatAppearance.BorderSize = 2  # Adjust border width for neon effect
})
$button1.Add_MouseLeave({
    $this.FlatAppearance.BorderSize = 0  # Remove border on mouse leave
})

# Create a button for WEB3
$button2 = New-Object System.Windows.Forms.Button
$button2.Text = "EYE"
$button2.Size = New-Object System.Drawing.Size(150, 40)
$button2.Location = New-Object System.Drawing.Point(200, 500)
$button2.Anchor = 'Bottom, Left'
$button2.FlatStyle = 'Flat'
$button2.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$button2.ForeColor = [System.Drawing.Color]::White
$button2.Font = New-Object System.Drawing.Font("Segoe UI", 12)
$button2.Add_Click({ Display-NotePad -fileURL $notePad2Path })

# Neon border effect for button 2
$button2.Add_MouseEnter({
    $this.FlatAppearance.BorderSize = 2  # Adjust border width for neon effect
})
$button2.Add_MouseLeave({
    $this.FlatAppearance.BorderSize = 0  # Remove border on mouse leave
})

# Add controls to the form
$form.Controls.Add($titleLabel)
$form.Controls.Add($button1)
$form.Controls.Add($button2)
$form.Controls.Add($textBox)

# Show the form
$form.Add_Shown({ $form.Activate() })
[void]$form.ShowDialog()
