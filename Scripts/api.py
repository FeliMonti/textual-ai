# Functions for communicating with Textual's API

import requests
import json

def create_products(APP_URL, TOKEN):
    with open("Resources/products.json") as f:
        r = requests.post(
            url=f"{APP_URL}/api/v2/product/batch_create",
            headers={"Token": TOKEN, "Content-Type": "application/json"},
            json={"data": json.load(f)},
        )
        r.raise_for_status()

def delete_products(APP_URL, TOKEN):
    r = requests.get(
        url=f"{APP_URL}/api/v2/product",
        headers={"Token": TOKEN, "Content-Type": "application/json"},
        params={"product_labels":"e2e-testing"},
    )
    r.raise_for_status()
    # Note: pagination above 100 results is ignored
    for product in r.json().get("results", []):
        print(f"deleting {product['id']}")
        r = requests.delete(
            url=f"{APP_URL}/api/v2/product/{product['id']}",
            headers={"Token": TOKEN, "Content-Type": "application/json"},
        )
        r.raise_for_status()

