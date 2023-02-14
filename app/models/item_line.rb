class ItemLine < Partitioned::MultiLevel
  serialize :preparation_instructions_json, JSON
  include Filterable

  attr_accessible :store_id, :tenant_id, :barcode, :code, :color, :discount_amount, :discount_id,
  :discount_name, :discount_percent, :discount_type,
  :is_final, :item_desc, :quantity, :sale_id, :size, :unit_price,
  :price_alut, :price_alut_before_discount, :supplier_document_id, :store_item_id, :inventory_quantity,
  :year, :line_date, :original_unit_price,
  :row_number, :is_pickup, :is_present, :buy_promotion_code, :get_promotion_code,
  :discount_approver_emp_id, :salesperson_employee_id, :salesperson_employee_name,
  :sale_discount_percent,:line_revenue,:store_item_color_size_id, :inventory_count_id, :item_id, :price_list_id,
  :is_manual_sale_discount, :shipment_document_id, :parent_item_id, :no_discount, :created_at, :has_vat, :has_compensation, 
  :has_preparation_instructions, :has_weight, :level, :parent_row_number, :price_neto_after_discounts, :selected_preparation_instructions,
  :promotions, :wholesaler_invoice_id, :float_1, :float_2, :float_3, :preparation_instructions_json


  nilify_blanks only: [:promotions]
  belongs_to :store
  belongs_to :tenant
  belongs_to :sale
  belongs_to :supplier_document
  belongs_to :store_item
  belongs_to :store_item_color_size
  belongs_to :item
  belongs_to :inventory_count
  belongs_to :supplier_document
  belongs_to :shipment_document
  counter_culture :store_item, :column_name => 'current_inventory', :delta_column => 'inventory_quantity'
  counter_culture :store_item_color_size, :column_name => 'current_inventory', :delta_column => 'inventory_quantity'

  has_one :flight_leg_sale, through: :sale
  has_one :flight_leg, through: :flight_leg_sale
  has_one :flight, through: :flight_leg

  validate :price_alut_positive, :price_alut_before_discount_positive# , :quantity_positive_in_inventory_count

  scope :sale_lines, -> () { where 'sale_id is not null' }

  def self.from_partition(*partition_key_values)
    tenant_id = partition_key_values.first
    unless tenant_id.nil?
      tenant = Tenant.all.select { |t| t.id == tenant_id }.first
      current_tenant = Tenant.all.select { |t| t.subdomain_name == Apartment::Database.current }.first
      raise "Error: Tenant with id #{tenant_id} does not exist" if tenant.nil?
      raise "Error: Cannot query a different tenant from schema #{Apartment::Database.current}" if current_tenant.nil?
      raise "Error: Cannot query a different tenant from schema #{Apartment::Database.current}" if current_tenant.id != tenant.id
    end
    table_alias_name = partition_table_alias_name(*partition_key_values)
    return ActiveRecord::Relation.new(self, self.arel_table_from_key_values(partition_key_values, table_alias_name))
  end
end