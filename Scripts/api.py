# Functions for communicating with Textual's API

import requests
import json

def create_products(APP_URL, TOKEN):
    with open("Resources/products.json") as f:
        product_ids = {}  # SKU -> UUID
        for product in json.load(f):
            # Convert parent SKU to UUID
            if product.get('_parent_external_id'):
                parent_id = product_ids.get(product.get('_parent_external_id'))
                if parent_id:
                    product['parent'] = parent_id
                product.pop('_parent_external_id')

            # Create product
            r = requests.post(
                url=f"{APP_URL}/api/v2/product",
                headers={"Token": TOKEN, "Content-Type": "application/json"},
                json=product,
            )
            r.raise_for_status()

            # Save UUID
            prod_ret = r.json()
            product_ids[prod_ret.get('id')] = prod_ret.get('external_id')

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
