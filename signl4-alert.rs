// Send SIGNL4 alert from Rust

// In your Cargo.toml, add the following [dependencies]
// reqwest = { version = "0.11", features = ["json"] }
// serde_json = "1.0"
// tokio = { version = "1", features = ["full"] }

use reqwest::Error;
use serde_json::json;

#[tokio::main]
async fn main() -> Result<(), Error> {
    // Your SIGNL4 webhook URL
    let url = "https://connect.signl4.com/webhook/{team-secret}";

    // Create a JSON object
    let request = json!({
        "Title": "Alert",
        "Message": "SIGNL4 alert from Rust"
    });

    // Send the POST request with the JSON payload
    let client = reqwest::Client::new();
    let res = client.post(url)
        .json(&request)
        .send()
        .await?;

    // Print the response status and body
    println!("Response status: {}", res.status());
    let body = res.text().await?;
    println!("Response body: {}", body);

    Ok(())
}
