# Google Sheets Credentials Setup

This directory should contain your Google Cloud service account credentials JSON file.

## How to Get Your Credentials (Updated 2024)

Google Sheets integration is **optional**. If you don't need it, the application will work without it.

### Step 1: Create a Google Cloud Project

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one

### Step 2: Enable Required APIs

1. In your project, go to **APIs & Services** > **Library**
2. Search for and enable:
   - **Google Sheets API**
   - **Google Drive API**

### Step 3: Create a Service Account

1. Go to **APIs & Services** > **Credentials**
2. Click **Create Credentials** > **Service Account**
3. Fill in the service account details:
   - Name: `informer-bot` (or any name you prefer)
   - Description: `Service account for Informer Telegram bot`
4. Click **Create and Continue**
5. Skip the optional steps and click **Done**

### Step 4: Generate JSON Key

1. In the **Credentials** page, find your newly created service account
2. Click on the service account email
3. Go to the **Keys** tab
4. Click **Add Key** > **Create new key**
5. Select **JSON** as the key type
6. Click **Create**
7. The JSON file will automatically download to your computer

### Step 5: Install the Credentials

1. Rename the downloaded file to `google_credentials.json`
2. Move it to this directory (`app/credentials/`)
3. Ensure the file path in `informer.env` is set correctly:
   ```
   GOOGLE_APPLICATION_CREDENTIALS=credentials/google_credentials.json
   ```

### Step 6: Share Your Google Sheet

1. Create a new Google Sheet or use an existing one
2. Copy the service account email (found in the JSON file under `client_email`)
3. Share the Google Sheet with this email address (give it Editor permissions)
4. Update the sheet name in `informer.env`:
   ```
   GOOGLE_SHEET_NAME=Your Sheet Name Here
   ```

## Troubleshooting

- If you see "google drive api no longer provides json files" - this is outdated information. Google still provides JSON keys through the service account method shown above.
- Make sure the APIs are enabled in your Google Cloud project
- Ensure the service account has access to your Google Sheet
- The application will work without Google Sheets - it will log a message and continue with database-only storage

## Security Note

**Never commit your credentials file to git!** This directory has a `.gitignore` to prevent accidental commits.
