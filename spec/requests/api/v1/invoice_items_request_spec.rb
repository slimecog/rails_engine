require "rails_helper"

describe "InvoiceItems API" do
  it "shows list of invoice items" do
    create_list(:invoice_item, 5)

    get "/api/v1/invoice_items.json"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(5)
  end

  it "can show a single invoice item" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}.json"

    expect(response).to be_success

    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["id"]).to eq(invoice_item.id)
  end
end
