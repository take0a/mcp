CREATE TABLE sales_plan (
	planned_year_month	char(6),
	sales_dept_code	char(8),
	sales_emp_code	char(8),
	item_code	char(8),
	planned_quantity	decimal(18),
	planned_amount	decimal(18),
	result_quantity	decimal(18),
	result_amount	decimal(18),
	marginal_proft	decimal(18),
	PRIMARY KEY (planned_year_month sales_dept_code sales_emp_code item_code)
);

COMMENT ON TABLE sales_plan IS '販売計画';
COMMENT ON COLUMN sales_plan.planned_year_month IS '計画年月';
COMMENT ON COLUMN sales_plan.sales_dept_code IS '営業部門コード';
COMMENT ON COLUMN sales_plan.sales_emp_code IS '営業担当者コード';
COMMENT ON COLUMN sales_plan.item_code IS '品目コード';
COMMENT ON COLUMN sales_plan.planned_quantity IS '計画数量';
COMMENT ON COLUMN sales_plan.planned_amount IS '計画金額';
COMMENT ON COLUMN sales_plan.result_quantity IS '実績数量';
COMMENT ON COLUMN sales_plan.result_amount IS '実績金額';
COMMENT ON COLUMN sales_plan.marginal_proft IS '限界利益';

CREATE TABLE production_plan (
	planned_year_month	char(6),
	item_code	char(8),
	planned_quantity	decimal(18),
	planned_amount	decimal(18),
	result_quantity	decimal(18),
	result_amount	decimal(18),
	PRIMARY KEY (planned_year_month item_code)
);

COMMENT ON TABLE production_plan IS '生産計画';
COMMENT ON COLUMN production_plan.planned_year_month IS '計画年月';
COMMENT ON COLUMN production_plan.item_code IS '品目コード';
COMMENT ON COLUMN production_plan.planned_quantity IS '計画数量';
COMMENT ON COLUMN production_plan.planned_amount IS '計画金額';
COMMENT ON COLUMN production_plan.result_quantity IS '実績数量';
COMMENT ON COLUMN production_plan.result_amount IS '実績金額';

CREATE TABLE m_event (
	event_code	char(8),
	event_name	varchar(64),
	PRIMARY KEY (event_code)
);

COMMENT ON TABLE m_event IS '行事マスタ';
COMMENT ON COLUMN m_event.event_code IS '行事コード';
COMMENT ON COLUMN m_event.event_name IS '行事名';

CREATE TABLE m_exec_class (
	exec_class_code	char(8),
	exec_class_name	varchar(64),
	PRIMARY KEY (exec_class_code)
);

COMMENT ON TABLE m_exec_class IS '実行区分マスタ';
COMMENT ON COLUMN m_exec_class.exec_class_code IS '実行区分コード';
COMMENT ON COLUMN m_exec_class.exec_class_name IS '実行区分名';

CREATE TABLE sales_action (
	sales_action_number	decimal(18),
	sales_emp_code	char(8),
	action_date	date,
	action_time	timestamp,
	event_code	char(8),
	exec_class_code	char(8),
	customer_code	char(8),
	prospective_customer_name	varchar(64),
	travel_expense	decimal(18),
	PRIMARY KEY (sales_action_number)
);

COMMENT ON TABLE sales_action IS '販売活動';
COMMENT ON COLUMN sales_action.sales_action_number IS '販売活動番号';
COMMENT ON COLUMN sales_action.sales_emp_code IS '営業担当者コード';
COMMENT ON COLUMN sales_action.action_date IS '日付';
COMMENT ON COLUMN sales_action.action_time IS '時間帯';
COMMENT ON COLUMN sales_action.event_code IS '行事コード';
COMMENT ON COLUMN sales_action.exec_class_code IS '実行区分コード';
COMMENT ON COLUMN sales_action.customer_code IS '訪問先コード';
COMMENT ON COLUMN sales_action.prospective_customer_name IS '見込顧客名';
COMMENT ON COLUMN sales_action.travel_expense IS '所要交通費';

CREATE TABLE m_quote_order_class (
	quote_order_class_code	char(8),
	quote_order_class_name	varchar(64),
	PRIMARY KEY (quote_order_class_code)
);

COMMENT ON TABLE m_quote_order_class IS '見積・受注区分マスタ';
COMMENT ON COLUMN m_quote_order_class.quote_order_class_code IS '見積・受注区分コード';
COMMENT ON COLUMN m_quote_order_class.quote_order_class_name IS '見積・受注区分名';

CREATE TABLE m_unit (
	unit_code	char(8),
	unit_name	varchar(64),
	PRIMARY KEY (unit_code)
);

COMMENT ON TABLE m_unit IS '単位マスタ';
COMMENT ON COLUMN m_unit.unit_code IS '単位コード';
COMMENT ON COLUMN m_unit.unit_name IS '単位名';

CREATE TABLE quote_order (
	sales_emp_code	char(8),
	customer_code	char(8),
	prospective_customer_name	varchar(64),
	quote_number	char(16),
	quote_order_class_code	char(8),
	quote_order_date	date,
	quote_order_total_amount	decimal(18),
	delivery_customer_code	char(8),
	destination_name	varchar(64),
	zip_code	char(7),
	address	varchar(128),
	phone_number	varchar(16),
	purpose	varchar(256),
	quote_condition	varchar(256),
	PRIMARY KEY (quote_number)
);

COMMENT ON TABLE quote_order IS '見積・受注基本';
COMMENT ON COLUMN quote_order.sales_emp_code IS '営業担当者コード';
COMMENT ON COLUMN quote_order.customer_code IS '訪問先コード';
COMMENT ON COLUMN quote_order.prospective_customer_name IS '見込顧客名';
COMMENT ON COLUMN quote_order.quote_number IS '見積番号';
COMMENT ON COLUMN quote_order.quote_order_class_code IS '見積・受注区分コード';
COMMENT ON COLUMN quote_order.quote_order_date IS '見積・受注日';
COMMENT ON COLUMN quote_order.quote_order_total_amount IS '見積・受注総額';
COMMENT ON COLUMN quote_order.delivery_customer_code IS '納入先コード';
COMMENT ON COLUMN quote_order.destination_name IS '納入先名';
COMMENT ON COLUMN quote_order.zip_code IS '郵便番号';
COMMENT ON COLUMN quote_order.address IS '住所';
COMMENT ON COLUMN quote_order.phone_number IS '電話番号';
COMMENT ON COLUMN quote_order.purpose IS '用途';
COMMENT ON COLUMN quote_order.quote_condition IS '見積条件';

CREATE TABLE quote_order_line (
	sales_emp_code	char(8),
	quote_number	char(16),
	line_number	decimal(4),
	quote_order_date	date,
	serial_number	char(16),
	item_code	char(8),
	quote_order_quantity	decimal(18),
	unit_code	char(8),
	quote_order_unit_price	decimal(18),
	PRIMARY KEY (quote_number line_number)
);

COMMENT ON TABLE quote_order_line IS '見積・受注明細';
COMMENT ON COLUMN quote_order_line.sales_emp_code IS '営業担当者コード';
COMMENT ON COLUMN quote_order_line.quote_number IS '見積番号';
COMMENT ON COLUMN quote_order_line.line_number IS '明細No';
COMMENT ON COLUMN quote_order_line.quote_order_date IS '見積・受注日';
COMMENT ON COLUMN quote_order_line.serial_number IS '追順No';
COMMENT ON COLUMN quote_order_line.item_code IS '品目コード';
COMMENT ON COLUMN quote_order_line.quote_order_quantity IS '見積・受注数量';
COMMENT ON COLUMN quote_order_line.unit_code IS '単位コード';
COMMENT ON COLUMN quote_order_line.quote_order_unit_price IS '見積・受注単価';

CREATE TABLE m_order_type (
	order_type_code	char(8),
	order_type_name	varchar(64),
	PRIMARY KEY (order_type_code)
);

COMMENT ON TABLE m_order_type IS '受注種別マスタ';
COMMENT ON COLUMN m_order_type.order_type_code IS '受注種別コード';
COMMENT ON COLUMN m_order_type.order_type_name IS '受注種別名';

CREATE TABLE m_order_ship_class (
	order_ship_class_code	char(8),
	order_ship_class_name	varchar(64),
	PRIMARY KEY (order_ship_class_code)
);

COMMENT ON TABLE m_order_ship_class IS '受注・出荷区分マスタ';
COMMENT ON COLUMN m_order_ship_class.order_ship_class_code IS '受注・出荷区分コード';
COMMENT ON COLUMN m_order_ship_class.order_ship_class_name IS '受注・出荷区分名';

CREATE TABLE order (
	order_number	char(16),
	branch_number	char(16),
	sales_emp_code	char(8),
	customer_code	char(8),
	invoice_customer_code	char(8),
	delivery_customer_code	char(8),
	delivery_customer_name	varchar(64),
	zip_code	char(7),
	address	varchar(128),
	phone_number	varchar(16),
	customer_purchase_order_number	char(16),
	order_type_code	char(8),
	order_ship_class_code	char(8),
	purpose	varchar(256),
	order_basic_spec	varchar(256),
	order_total_amount	decimal(18),
	quote_number	char(16),
	quote_total_cost	decimal(18),
	quote_variable_cost	decimal(18),
	order_date	date,
	delivery_date	date,
	pre_compensation_order_number	char(16),
	order_oem_flag	char(1),
	rebate_payment_flag	char(1),
	transport_cost_burden_flag	char(1),
	cash_amount	decimal(18),
	bill_total_amount	decimal(18),
	complete_flag	char(1),
	PRIMARY KEY (order_number)
);

COMMENT ON TABLE order IS '受注基本';
COMMENT ON COLUMN order.order_number IS '受注番号';
COMMENT ON COLUMN order.branch_number IS '変更番号';
COMMENT ON COLUMN order.sales_emp_code IS '営業担当者コード';
COMMENT ON COLUMN order.customer_code IS '得意先コード';
COMMENT ON COLUMN order.invoice_customer_code IS '請求先コード';
COMMENT ON COLUMN order.delivery_customer_code IS '納入先コード';
COMMENT ON COLUMN order.delivery_customer_name IS '納入先名';
COMMENT ON COLUMN order.zip_code IS '郵便番号';
COMMENT ON COLUMN order.address IS '住所';
COMMENT ON COLUMN order.phone_number IS '電話番号';
COMMENT ON COLUMN order.customer_purchase_order_number IS '得意先発注番号';
COMMENT ON COLUMN order.order_type_code IS '受注種別コード';
COMMENT ON COLUMN order.order_ship_class_code IS '受注・出荷区分コード';
COMMENT ON COLUMN order.purpose IS '用途';
COMMENT ON COLUMN order.order_basic_spec IS 'オーダー基本仕様';
COMMENT ON COLUMN order.order_total_amount IS '受注総額';
COMMENT ON COLUMN order.quote_number IS '見積番号';
COMMENT ON COLUMN order.quote_total_cost IS '見積原価総額';
COMMENT ON COLUMN order.quote_variable_cost IS '見積変動費';
COMMENT ON COLUMN order.order_date IS '受注日';
COMMENT ON COLUMN order.delivery_date IS '納期';
COMMENT ON COLUMN order.pre_compensation_order_number IS '補償前受注番号';
COMMENT ON COLUMN order.order_oem_flag IS '受注OEMフラグ';
COMMENT ON COLUMN order.rebate_payment_flag IS 'リベート支払フラグ';
COMMENT ON COLUMN order.transport_cost_burden_flag IS '運送費負担フラグ';
COMMENT ON COLUMN order.cash_amount IS '契約・現金支払金額';
COMMENT ON COLUMN order.bill_total_amount IS '契約・手形支払合計金額';
COMMENT ON COLUMN order.complete_flag IS 'オーダー完納フラグ';

CREATE TABLE order_spec_change (
	order_number	char(16),
	spec_change_date	date,
	PRIMARY KEY (order_number spec_change_date)
);

COMMENT ON TABLE order_spec_change IS '受注基本・仕様変更';
COMMENT ON COLUMN order_spec_change.order_number IS '受注番号';
COMMENT ON COLUMN order_spec_change.spec_change_date IS '仕様変更日';

CREATE TABLE order_bill_payment (
	order_number	char(16),
	line_number	decimal(4),
	bill_amount	decimal(18),
	bill_site	decimal(3),
	PRIMARY KEY (order_number line_number)
);

COMMENT ON TABLE order_bill_payment IS '受注基本・手形支払';
COMMENT ON COLUMN order_bill_payment.order_number IS '受注番号';
COMMENT ON COLUMN order_bill_payment.line_number IS '明細No';
COMMENT ON COLUMN order_bill_payment.bill_amount IS '契約・手形支払金額';
COMMENT ON COLUMN order_bill_payment.bill_site IS '契約・手形サイト';

CREATE TABLE m_order_line_class (
	order_line_class_code	char(8),
	order_line_class_name	varchar(64),
	PRIMARY KEY (order_line_class_code)
);

COMMENT ON TABLE m_order_line_class IS '受注明細区分マスタ';
COMMENT ON COLUMN m_order_line_class.order_line_class_code IS '受注明細区分コード';
COMMENT ON COLUMN m_order_line_class.order_line_class_name IS '受注明細区分名';

CREATE TABLE m_customer_receive_class (
	customer_receive_class_code	char(8),
	customer_receive_class_name	varchar(64),
	PRIMARY KEY (customer_receive_class_code)
);

COMMENT ON TABLE m_customer_receive_class IS '顧客受領区分マスタ';
COMMENT ON COLUMN m_customer_receive_class.customer_receive_class_code IS '顧客受領区分コード';
COMMENT ON COLUMN m_customer_receive_class.customer_receive_class_name IS '顧客受領区分名';

CREATE TABLE order_line (
	order_number	char(16),
	line_number	decimal(4),
	order_line_class_code	char(8),
	standard_special_class_code	char(8),
	item_code	char(8),
	partner_item_code	char(8),
	line_spec	varchar(256),
	order_quantity	decimal(18),
	unit_code	char(8),
	unit_price	decimal(18),
	amount	decimal(18),
	quote_cost	decimal(18),
	quote_variable_cost	decimal(18),
	customer_receive_class_code	char(8),
	inv_reserve_quantity	decimal(18),
	reserve_warehouse_code	char(8),
	inv_reserve_date	date,
	design_order_date	date,
	material_order_date	date,
	assemble_order_date	date,
	ship_order_date	date,
	ship_total_quantity	decimal(18),
	last_ship_date	date,
	correct_ship_date	date,
	original_ship_number	char(16),
	sales_recording_date	date,
	PRIMARY KEY (order_number line_number)
);

COMMENT ON TABLE order_line IS '受注明細';
COMMENT ON COLUMN order_line.order_number IS '受注番号';
COMMENT ON COLUMN order_line.line_number IS '明細No';
COMMENT ON COLUMN order_line.order_line_class_code IS '受注明細区分コード';
COMMENT ON COLUMN order_line.standard_special_class_code IS '標準・特殊区分コード';
COMMENT ON COLUMN order_line.item_code IS '品目コード';
COMMENT ON COLUMN order_line.partner_item_code IS '他社品目コード';
COMMENT ON COLUMN order_line.line_spec IS '明細仕様';
COMMENT ON COLUMN order_line.order_quantity IS '受注数量';
COMMENT ON COLUMN order_line.unit_code IS '単位コード';
COMMENT ON COLUMN order_line.unit_price IS '単価';
COMMENT ON COLUMN order_line.amount IS '金額';
COMMENT ON COLUMN order_line.quote_cost IS '見積原価';
COMMENT ON COLUMN order_line.quote_variable_cost IS '見積変動費';
COMMENT ON COLUMN order_line.customer_receive_class_code IS '顧客受領区分コード';
COMMENT ON COLUMN order_line.inv_reserve_quantity IS '在庫引当数';
COMMENT ON COLUMN order_line.reserve_warehouse_code IS '引当倉庫コード';
COMMENT ON COLUMN order_line.inv_reserve_date IS '在庫引当日';
COMMENT ON COLUMN order_line.design_order_date IS '設計手配日';
COMMENT ON COLUMN order_line.material_order_date IS '部材手配日';
COMMENT ON COLUMN order_line.assemble_order_date IS '組立手配日';
COMMENT ON COLUMN order_line.ship_order_date IS '出荷手配日';
COMMENT ON COLUMN order_line.ship_total_quantity IS '出荷累計数';
COMMENT ON COLUMN order_line.last_ship_date IS '最新出荷日';
COMMENT ON COLUMN order_line.correct_ship_date IS '訂正出荷日';
COMMENT ON COLUMN order_line.original_ship_number IS '訂正前出荷番号';
COMMENT ON COLUMN order_line.sales_recording_date IS '売上計上日';

CREATE TABLE actual_demand (
	start_date	date,
	end_date	date,
	sales_dept_code	char(8),
	item_code	char(8),
	actual_demand_quantity	decimal(18),
	PRIMARY KEY (start_date sales_dept_code item_code)
);

COMMENT ON TABLE actual_demand IS '実需情報';
COMMENT ON COLUMN actual_demand.start_date IS '期間開始日';
COMMENT ON COLUMN actual_demand.end_date IS '期間終了日';
COMMENT ON COLUMN actual_demand.sales_dept_code IS '営業部門コード';
COMMENT ON COLUMN actual_demand.item_code IS '品目コード';
COMMENT ON COLUMN actual_demand.actual_demand_quantity IS '実需数量';

CREATE TABLE make_to_stock_order (
	start_date	date,
	end_date	date,
	item_code	char(8),
	instructed_quantity	decimal(18),
	PRIMARY KEY (start_date item_code)
);

COMMENT ON TABLE make_to_stock_order IS '見込品指示';
COMMENT ON COLUMN make_to_stock_order.start_date IS '期間開始日';
COMMENT ON COLUMN make_to_stock_order.end_date IS '期間終了日';
COMMENT ON COLUMN make_to_stock_order.item_code IS '品目コード';
COMMENT ON COLUMN make_to_stock_order.instructed_quantity IS '指示数量';

CREATE TABLE m_quote_calc_class (
	quote_calc_class_code	char(8),
	quote_calc_class_name	varchar(64),
	PRIMARY KEY (quote_calc_class_code)
);

COMMENT ON TABLE m_quote_calc_class IS '見積計算区分マスタ';
COMMENT ON COLUMN m_quote_calc_class.quote_calc_class_code IS '見積計算区分コード';
COMMENT ON COLUMN m_quote_calc_class.quote_calc_class_name IS '見積計算区分名';

CREATE TABLE quote (
	quote_number	char(16),
	quote_emp_code	char(8),
	quote_calc_class_code	char(8),
	similar_quote_number	char(16),
	similar_order_number	char(16),
	customer_code	char(8),
	sales_emp_code	char(8),
	purpose	varchar(256),
	quote_total_amount	decimal(18),
	quote_cost	decimal(18),
	quote_variable_cost	decimal(18),
	mgmt_cost	decimal(18),
	main_unit_total_amount	decimal(18),
	design_man_hour	decimal(4),
	design_cost	decimal(18),
	assembly_man_hour	decimal(4),
	assembly_cost	decimal(18),
	proc_cost	decimal(18),
	material_cost	decimal(18),
	outsource_cost	decimal(18),
	additional_total_amount	decimal(18),
	accompany_machine_cost	decimal(18),
	inspect_cost	decimal(18),
	packing_transport_cost	decimal(18),
	on_site_construct_cost	decimal(18),
	other_cost	decimal(18),
	delivery_date	date,
	quote_date	date,
	order_number	char(16),
	PRIMARY KEY (quote_number)
);

COMMENT ON TABLE quote IS '見積基本';
COMMENT ON COLUMN quote.quote_number IS '見積番号';
COMMENT ON COLUMN quote.quote_emp_code IS '見積担当者コード';
COMMENT ON COLUMN quote.quote_calc_class_code IS '見積計算区分コード';
COMMENT ON COLUMN quote.similar_quote_number IS '前例・類似見積番号';
COMMENT ON COLUMN quote.similar_order_number IS '前例・類似受注番号';
COMMENT ON COLUMN quote.customer_code IS '見積先コード';
COMMENT ON COLUMN quote.sales_emp_code IS '営業担当者コード';
COMMENT ON COLUMN quote.purpose IS '用途';
COMMENT ON COLUMN quote.quote_total_amount IS '見積総額';
COMMENT ON COLUMN quote.quote_cost IS '見積原価';
COMMENT ON COLUMN quote.quote_variable_cost IS '見積変動費';
COMMENT ON COLUMN quote.mgmt_cost IS '管理費';
COMMENT ON COLUMN quote.main_unit_total_amount IS '本体価格合計';
COMMENT ON COLUMN quote.design_man_hour IS '設計工数';
COMMENT ON COLUMN quote.design_cost IS '設計費';
COMMENT ON COLUMN quote.assembly_man_hour IS '組立工数';
COMMENT ON COLUMN quote.assembly_cost IS '組立費';
COMMENT ON COLUMN quote.proc_cost IS '加工費';
COMMENT ON COLUMN quote.material_cost IS '材料費';
COMMENT ON COLUMN quote.outsource_cost IS '外注加工費';
COMMENT ON COLUMN quote.additional_total_amount IS '付帯価格合計';
COMMENT ON COLUMN quote.accompany_machine_cost IS '付属機械費';
COMMENT ON COLUMN quote.inspect_cost IS '支払検査料';
COMMENT ON COLUMN quote.packing_transport_cost IS '荷造運送費';
COMMENT ON COLUMN quote.on_site_construct_cost IS '現地工事費';
COMMENT ON COLUMN quote.other_cost IS 'その他経費';
COMMENT ON COLUMN quote.delivery_date IS '納期';
COMMENT ON COLUMN quote.quote_date IS '見積日';
COMMENT ON COLUMN quote.order_number IS '確定受注番号';

CREATE TABLE quote_req (
	quote_number	char(16),
	quote_req_number	decimal(4),
	quote_req	varchar(256),
	PRIMARY KEY (quote_number quote_req_number)
);

COMMENT ON TABLE quote_req IS '見積要件';
COMMENT ON COLUMN quote_req.quote_number IS '見積番号';
COMMENT ON COLUMN quote_req.quote_req_number IS '見積要件No';
COMMENT ON COLUMN quote_req.quote_req IS '見積要件';

CREATE TABLE m_material (
	material_code	char(8),
	material_name	varchar(64),
	PRIMARY KEY (material_code)
);

COMMENT ON TABLE m_material IS '材質マスタ';
COMMENT ON COLUMN m_material.material_code IS '材質コード';
COMMENT ON COLUMN m_material.material_name IS '材質名';

CREATE TABLE m_parts_rank (
	parts_rank_code	char(8),
	parts_rank_name	varchar(64),
	PRIMARY KEY (parts_rank_code)
);

COMMENT ON TABLE m_parts_rank IS '部品ランクマスタ';
COMMENT ON COLUMN m_parts_rank.parts_rank_code IS '部品ランクコード';
COMMENT ON COLUMN m_parts_rank.parts_rank_name IS '部品ランク名';

CREATE TABLE quote_line (
	quote_number	char(16),
	line_number	decimal(4),
	item_code	char(8),
	material_code	char(8),
	parts_rank_code	char(8),
	quote_quantity	decimal(18),
	material_alone_weight	decimal(18),
	material_cost	decimal(18),
	purchase_cost	decimal(18),
	proc_total_cost	decimal(18),
	outsource_total_cost	decimal(18),
	other_material_total_cost	decimal(18),
	other_proc_total_cost	decimal(18),
	other_outsource_total_cost	decimal(18),
	PRIMARY KEY (quote_number line_number)
);

COMMENT ON TABLE quote_line IS '見積明細';
COMMENT ON COLUMN quote_line.quote_number IS '見積番号';
COMMENT ON COLUMN quote_line.line_number IS '見積明細No';
COMMENT ON COLUMN quote_line.item_code IS '品目コード';
COMMENT ON COLUMN quote_line.material_code IS '材質コード';
COMMENT ON COLUMN quote_line.parts_rank_code IS '部品ランクコード';
COMMENT ON COLUMN quote_line.quote_quantity IS '見積数量';
COMMENT ON COLUMN quote_line.material_alone_weight IS '素材単重';
COMMENT ON COLUMN quote_line.material_cost IS '材料費';
COMMENT ON COLUMN quote_line.purchase_cost IS '仕入費';
COMMENT ON COLUMN quote_line.proc_total_cost IS '工程別加工費合計';
COMMENT ON COLUMN quote_line.outsource_total_cost IS '工程別外注加工費合計';
COMMENT ON COLUMN quote_line.other_material_total_cost IS 'その他部品・材料費合計';
COMMENT ON COLUMN quote_line.other_proc_total_cost IS 'その他部品加工費合計';
COMMENT ON COLUMN quote_line.other_outsource_total_cost IS 'その他部品外注加工費合計';

CREATE TABLE quote_line_proc (
	quote_number	char(16),
	line_number	decimal(4),
	major_proc_code	char(8),
	setup_time	decimal(18),
	unit_proc_time	decimal(18),
	proc_cost	decimal(18),
	outsource_cost	decimal(18),
	PRIMARY KEY (quote_number line_number major_proc_code)
);

COMMENT ON TABLE quote_line_proc IS '見積明細・工程';
COMMENT ON COLUMN quote_line_proc.quote_number IS '見積番号';
COMMENT ON COLUMN quote_line_proc.line_number IS '見積明細No';
COMMENT ON COLUMN quote_line_proc.major_proc_code IS '主要工程コード';
COMMENT ON COLUMN quote_line_proc.setup_time IS '段取時間';
COMMENT ON COLUMN quote_line_proc.unit_proc_time IS '単位加工時間';
COMMENT ON COLUMN quote_line_proc.proc_cost IS '加工費';
COMMENT ON COLUMN quote_line_proc.outsource_cost IS '外注加工費';

CREATE TABLE m_basis_value (
	product_code	char(8),
	part_code	char(8),
	proc_code	char(8),
	material_alone_weight	decimal(18),
	finished_unit_weight	decimal(18),
	procure_period	decimal(4),
	basis_man_hour	decimal(4),
	setup_time	decimal(18),
	unit_proc_time	decimal(18),
	PRIMARY KEY (product_code part_code proc_code)
);

COMMENT ON TABLE m_basis_value IS '基準値マスタ';
COMMENT ON COLUMN m_basis_value.product_code IS '製品コード';
COMMENT ON COLUMN m_basis_value.part_code IS '部品コード';
COMMENT ON COLUMN m_basis_value.proc_code IS '工程コード';
COMMENT ON COLUMN m_basis_value.material_alone_weight IS '素材単重';
COMMENT ON COLUMN m_basis_value.finished_unit_weight IS '完成単重';
COMMENT ON COLUMN m_basis_value.procure_period IS '調達期間';
COMMENT ON COLUMN m_basis_value.basis_man_hour IS '基準工数';
COMMENT ON COLUMN m_basis_value.setup_time IS '段取時間';
COMMENT ON COLUMN m_basis_value.unit_proc_time IS '単位加工時間';

CREATE TABLE m_item_class (
	item_class_code	char(8),
	item_class_name	varchar(64),
	PRIMARY KEY (item_class_code)
);

COMMENT ON TABLE m_item_class IS '品目区分マスタ';
COMMENT ON COLUMN m_item_class.item_class_code IS '品目区分コード';
COMMENT ON COLUMN m_item_class.item_class_name IS '品目区分名';

CREATE TABLE m_standard_special_class (
	standard_special_class_code	char(8),
	standard_special_class_name	varchar(64),
	PRIMARY KEY (standard_special_class_code)
);

COMMENT ON TABLE m_standard_special_class IS '標準・特殊区分マスタ';
COMMENT ON COLUMN m_standard_special_class.standard_special_class_code IS '標準・特殊区分コード';
COMMENT ON COLUMN m_standard_special_class.standard_special_class_name IS '標準・特殊区分名';

CREATE TABLE m_quality_standard_size (
	quality_standard_size_code	char(8),
	quality_standard_size_name	varchar(64),
	PRIMARY KEY (quality_standard_size_code)
);

COMMENT ON TABLE m_quality_standard_size IS '品質・規格・寸法マスタ';
COMMENT ON COLUMN m_quality_standard_size.quality_standard_size_code IS '品質・規格・寸法コード';
COMMENT ON COLUMN m_quality_standard_size.quality_standard_size_name IS '品質・規格・寸法名';

CREATE TABLE m_item (
	item_code	char(8),
	item_index_kana	varchar(128),
	item_name	varchar(64),
	item_abbr	varchar(32),
	item_class_code	char(8),
	standard_special_class_code	char(8),
	parts_rank_code	char(8),
	material_code	char(8),
	quality_standard_size_code	char(8),
	common_part_flag	char(1),
	part_expansion_flag	char(1),
	top_level_item_code	char(8),
	final_proc_code	char(8),
	cook_keep_flag	char(1),
	schedule_display_flag	char(1),
	transfer_slip_flag	char(1),
	procure_unit_code	char(8),
	incoming_unit_code	char(8),
	incoming_convert_factor	decimal(5,2),
	ship_package	varchar(64),
	PRIMARY KEY (item_code)
);

COMMENT ON TABLE m_item IS '品目マスタ';
COMMENT ON COLUMN m_item.item_code IS '品目コード';
COMMENT ON COLUMN m_item.item_index_kana IS '品目索引カナ文字';
COMMENT ON COLUMN m_item.item_name IS '品目名';
COMMENT ON COLUMN m_item.item_abbr IS '品目略称名';
COMMENT ON COLUMN m_item.item_class_code IS '品目区分コード';
COMMENT ON COLUMN m_item.standard_special_class_code IS '標準・特殊区分コード';
COMMENT ON COLUMN m_item.parts_rank_code IS '部品ランクコード';
COMMENT ON COLUMN m_item.material_code IS '材質コード';
COMMENT ON COLUMN m_item.quality_standard_size_code IS '品質・規格・寸法コード';
COMMENT ON COLUMN m_item.common_part_flag IS '共通部品フラグ';
COMMENT ON COLUMN m_item.part_expansion_flag IS '部品展開要否フラグ';
COMMENT ON COLUMN m_item.top_level_item_code IS '最上位部品コード';
COMMENT ON COLUMN m_item.final_proc_code IS '最終工程コード';
COMMENT ON COLUMN m_item.cook_keep_flag IS 'コック預かりフラグ';
COMMENT ON COLUMN m_item.schedule_display_flag IS '日程表表示フラグ';
COMMENT ON COLUMN m_item.transfer_slip_flag IS '移動票要否フラグ';
COMMENT ON COLUMN m_item.procure_unit_code IS '調達単位コード';
COMMENT ON COLUMN m_item.incoming_unit_code IS '入庫単位コード';
COMMENT ON COLUMN m_item.incoming_convert_factor IS '入庫換算係数';
COMMENT ON COLUMN m_item.ship_package IS '出荷時荷姿';

CREATE TABLE m_design_type (
	design_type_code	char(8),
	design_type_name	varchar(64),
	PRIMARY KEY (design_type_code)
);

COMMENT ON TABLE m_design_type IS '設計種別マスタ';
COMMENT ON COLUMN m_design_type.design_type_code IS '設計種別コード';
COMMENT ON COLUMN m_design_type.design_type_name IS '設計種別名';

CREATE TABLE design_man_hour (
	order_number	char(16),
	item_code	char(8),
	procure_period	decimal(4),
	design_basis_man_hour	decimal(4),
	design_type_code	char(8),
	design_man_hour_change_rate	decimal(5,2),
	start_date	date,
	end_date	date,
	basic_design_total_result_time	decimal(18),
	parts_design_total_result_time	decimal(18),
	other_total_result_time	decimal(18),
	total_design_cost	decimal(18),
	PRIMARY KEY (order_number item_code)
);

COMMENT ON TABLE design_man_hour IS '設計工数';
COMMENT ON COLUMN design_man_hour.order_number IS 'オーダー番号';
COMMENT ON COLUMN design_man_hour.item_code IS '品目コード';
COMMENT ON COLUMN design_man_hour.procure_period IS '調達期間';
COMMENT ON COLUMN design_man_hour.design_basis_man_hour IS '設計基準工数';
COMMENT ON COLUMN design_man_hour.design_type_code IS '設計種別コード';
COMMENT ON COLUMN design_man_hour.design_man_hour_change_rate IS '設計工数変更率';
COMMENT ON COLUMN design_man_hour.start_date IS '設計開始日';
COMMENT ON COLUMN design_man_hour.end_date IS '設計終了日';
COMMENT ON COLUMN design_man_hour.basic_design_total_result_time IS '基本設計実績時間累計';
COMMENT ON COLUMN design_man_hour.parts_design_total_result_time IS '部品設計実績時間累計';
COMMENT ON COLUMN design_man_hour.other_total_result_time IS 'その他実績時間累計';
COMMENT ON COLUMN design_man_hour.total_design_cost IS '設計費累計';

CREATE TABLE m_design_work_class (
	design_work_class_code	char(8),
	design_work_class_name	varchar(64),
	PRIMARY KEY (design_work_class_code)
);

COMMENT ON TABLE m_design_work_class IS '設計作業区分マスタ';
COMMENT ON COLUMN m_design_work_class.design_work_class_code IS '設計作業区分コード';
COMMENT ON COLUMN m_design_work_class.design_work_class_name IS '設計作業区分名';

CREATE TABLE design_work (
	order_number	char(16),
	design_emp_code	char(8),
	start_date	date,
	design_work_class_code	char(8),
	result_time	decimal(18),
	PRIMARY KEY (order_number design_emp_code start_date)
);

COMMENT ON TABLE design_work IS '設計作業';
COMMENT ON COLUMN design_work.order_number IS 'オーダー番号';
COMMENT ON COLUMN design_work.design_emp_code IS '設計担当者コード';
COMMENT ON COLUMN design_work.start_date IS '週間開始日';
COMMENT ON COLUMN design_work.design_work_class_code IS '設計作業区分コード';
COMMENT ON COLUMN design_work.result_time IS '実績時間';

CREATE TABLE forecast_plan (
	plan_order_date	date,
	lot_number	char(16),
	item_code	char(8),
	sales_order_quantity	decimal(18),
	order_quantity	decimal(18),
	plan_delivery_date	date,
	PRIMARY KEY (plan_order_date lot_number item_code)
);

COMMENT ON TABLE forecast_plan IS '見込計画';
COMMENT ON COLUMN forecast_plan.plan_order_date IS '計画手配日';
COMMENT ON COLUMN forecast_plan.lot_number IS 'ロット番号';
COMMENT ON COLUMN forecast_plan.item_code IS '品目コード';
COMMENT ON COLUMN forecast_plan.sales_order_quantity IS '営業指示数量';
COMMENT ON COLUMN forecast_plan.order_quantity IS '手配実数量';
COMMENT ON COLUMN forecast_plan.plan_delivery_date IS '計画納期';

CREATE TABLE m_proc_rank (
	proc_rank_code	char(8),
	proc_rank_name	varchar(64),
	PRIMARY KEY (proc_rank_code)
);

COMMENT ON TABLE m_proc_rank IS '工程ランクマスタ';
COMMENT ON COLUMN m_proc_rank.proc_rank_code IS '工程ランクコード';
COMMENT ON COLUMN m_proc_rank.proc_rank_name IS '工程ランク名';

CREATE TABLE m_work_unit (
	work_unit_code	char(8),
	work_unit_name	varchar(64),
	PRIMARY KEY (work_unit_code)
);

COMMENT ON TABLE m_work_unit IS '作業単位マスタ';
COMMENT ON COLUMN m_work_unit.work_unit_code IS '作業単位コード';
COMMENT ON COLUMN m_work_unit.work_unit_name IS '作業単位名';

CREATE TABLE m_purchase_type (
	purchase_type_code	char(8),
	purchase_type_name	varchar(64),
	PRIMARY KEY (purchase_type_code)
);

COMMENT ON TABLE m_purchase_type IS '購買種別マスタ';
COMMENT ON COLUMN m_purchase_type.purchase_type_code IS '購買種別コード';
COMMENT ON COLUMN m_purchase_type.purchase_type_name IS '購買種別名';

CREATE TABLE m_proc_supply_class (
	proc_supply_class_code	char(8),
	proc_supply_class_name	varchar(64),
	PRIMARY KEY (proc_supply_class_code)
);

COMMENT ON TABLE m_proc_supply_class IS '加工支給区分マスタ';
COMMENT ON COLUMN m_proc_supply_class.proc_supply_class_code IS '加工支給区分コード';
COMMENT ON COLUMN m_proc_supply_class.proc_supply_class_name IS '加工支給区分名';

CREATE TABLE m_material_outgoing_class (
	material_outgoing_class_code	char(8),
	material_outgoing_class_name	varchar(64),
	PRIMARY KEY (material_outgoing_class_code)
);

COMMENT ON TABLE m_material_outgoing_class IS '部材出庫区分マスタ';
COMMENT ON COLUMN m_material_outgoing_class.material_outgoing_class_code IS '部材出庫区分コード';
COMMENT ON COLUMN m_material_outgoing_class.material_outgoing_class_name IS '部材出庫区分名';

CREATE TABLE m_inspect_accept_class (
	inspect_accept_class_code	char(8),
	inspect_accept_class_name	varchar(64),
	PRIMARY KEY (inspect_accept_class_code)
);

COMMENT ON TABLE m_inspect_accept_class IS '検査・検収区分マスタ';
COMMENT ON COLUMN m_inspect_accept_class.inspect_accept_class_code IS '検査・検収区分コード';
COMMENT ON COLUMN m_inspect_accept_class.inspect_accept_class_name IS '検査・検収区分名';

CREATE TABLE m_delivery_location (
	delivery_location_code	char(8),
	delivery_location_name	varchar(64),
	PRIMARY KEY (delivery_location_code)
);

COMMENT ON TABLE m_delivery_location IS '納入場所マスタ';
COMMENT ON COLUMN m_delivery_location.delivery_location_code IS '納入場所コード';
COMMENT ON COLUMN m_delivery_location.delivery_location_name IS '納入場所名';

CREATE TABLE m_proc_procedure (
	item_code	char(8),
	proc_seq_number	decimal(4),
	proc_code	char(8),
	proc_name	varchar(64),
	proc_rank_code	char(8),
	product_order_spec	varchar(256),
	blueprint_number	char(16),
	in_house_external_class_code	char(8),
	proc_partner_code	char(8),
	work_unit_code	char(8),
	purchase_type_code	char(8),
	proc_supply_class_code	char(8),
	material_outgoing_class_code	char(8),
	inspect_accept_class_code	char(8),
	product_tag_flag	char(1),
	delivery_location_code	char(8),
	PRIMARY KEY (item_code proc_seq_number)
);

COMMENT ON TABLE m_proc_procedure IS '工程手順マスタ';
COMMENT ON COLUMN m_proc_procedure.item_code IS '品目コード';
COMMENT ON COLUMN m_proc_procedure.proc_seq_number IS '工程順No';
COMMENT ON COLUMN m_proc_procedure.proc_code IS '工程コード';
COMMENT ON COLUMN m_proc_procedure.proc_name IS '工程名';
COMMENT ON COLUMN m_proc_procedure.proc_rank_code IS '工程ランクコード';
COMMENT ON COLUMN m_proc_procedure.product_order_spec IS '製作・発注仕様';
COMMENT ON COLUMN m_proc_procedure.blueprint_number IS '図面番号';
COMMENT ON COLUMN m_proc_procedure.in_house_external_class_code IS '内外作区分コード';
COMMENT ON COLUMN m_proc_procedure.proc_partner_code IS '加工・発注先コード';
COMMENT ON COLUMN m_proc_procedure.work_unit_code IS '作業単位コード';
COMMENT ON COLUMN m_proc_procedure.purchase_type_code IS '購買種別コード';
COMMENT ON COLUMN m_proc_procedure.proc_supply_class_code IS '加工支給区分コード';
COMMENT ON COLUMN m_proc_procedure.material_outgoing_class_code IS '部材出庫区分コード';
COMMENT ON COLUMN m_proc_procedure.inspect_accept_class_code IS '検査・検収区分コード';
COMMENT ON COLUMN m_proc_procedure.product_tag_flag IS '現品票要否フラグ';
COMMENT ON COLUMN m_proc_procedure.delivery_location_code IS '納入場所コード';

CREATE TABLE m_parts_cost_agg_class (
	parts_cost_agg_class_code	char(8),
	parts_cost_agg_class_name	varchar(64),
	PRIMARY KEY (parts_cost_agg_class_code)
);

COMMENT ON TABLE m_parts_cost_agg_class IS '部品原価集約区分マスタ';
COMMENT ON COLUMN m_parts_cost_agg_class.parts_cost_agg_class_code IS '部品原価集約区分コード';
COMMENT ON COLUMN m_parts_cost_agg_class.parts_cost_agg_class_name IS '部品原価集約区分名';

CREATE TABLE m_production_proc (
	item_code	char(8),
	higher_item_code	char(8),
	lower_item_code	char(8),
	higher_parts_cost_agg_class_code	char(8),
	lower_material_unit_quantity	decimal(18),
	lower_material_outgoing_class_code	char(8),
	lower_yield_rate	decimal(5,2),
	PRIMARY KEY (item_code)
);

COMMENT ON TABLE m_production_proc IS '製品工程マスタ';
COMMENT ON COLUMN m_production_proc.item_code IS '品目コード';
COMMENT ON COLUMN m_production_proc.higher_item_code IS '上位品目コード';
COMMENT ON COLUMN m_production_proc.lower_item_code IS '下位品目コード';
COMMENT ON COLUMN m_production_proc.higher_parts_cost_agg_class_code IS '上位・部品原価集約区分コード';
COMMENT ON COLUMN m_production_proc.lower_material_unit_quantity IS '下位原単位数';
COMMENT ON COLUMN m_production_proc.lower_material_outgoing_class_code IS '下位・部材出庫区分コード';
COMMENT ON COLUMN m_production_proc.lower_yield_rate IS '下位・歩留り率';

CREATE TABLE m_expansion_purpose_class (
	expansion_purpose_class_code	char(8),
	expansion_purpose_class_name	varchar(64),
	PRIMARY KEY (expansion_purpose_class_code)
);

COMMENT ON TABLE m_expansion_purpose_class IS '展開目的区分マスタ';
COMMENT ON COLUMN m_expansion_purpose_class.expansion_purpose_class_code IS '展開目的区分コード';
COMMENT ON COLUMN m_expansion_purpose_class.expansion_purpose_class_name IS '展開目的区分名';

CREATE TABLE m_procure_order_type (
	procure_order_type_code	char(8),
	procure_order_type_name	varchar(64),
	PRIMARY KEY (procure_order_type_code)
);

COMMENT ON TABLE m_procure_order_type IS '調達手配種別マスタ';
COMMENT ON COLUMN m_procure_order_type.procure_order_type_code IS '調達手配種別コード';
COMMENT ON COLUMN m_procure_order_type.procure_order_type_name IS '調達手配種別名';

CREATE TABLE required_amount (
	order_lot_number	char(16),
	item_code	char(8),
	expansion_purpose_class_code	char(8),
	expansion_flag	char(1),
	before_expand_quantity	decimal(18),
	expanded_item_code	char(8),
	procure_order_type_code	char(8),
	required_quantity	decimal(18),
	PRIMARY KEY (order_lot_number item_code)
);

COMMENT ON TABLE required_amount IS '所要量';
COMMENT ON COLUMN required_amount.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN required_amount.item_code IS '品目コード';
COMMENT ON COLUMN required_amount.expansion_purpose_class_code IS '展開目的区分コード';
COMMENT ON COLUMN required_amount.expansion_flag IS '展開要否フラグ';
COMMENT ON COLUMN required_amount.before_expand_quantity IS '展開前数量';
COMMENT ON COLUMN required_amount.expanded_item_code IS '展開後品目コード';
COMMENT ON COLUMN required_amount.procure_order_type_code IS '調達手配種別コード';
COMMENT ON COLUMN required_amount.required_quantity IS '所要数量';

CREATE TABLE m_in_house_external_class (
	in_house_external_class_code	char(8),
	in_house_external_class_name	varchar(64),
	PRIMARY KEY (in_house_external_class_code)
);

COMMENT ON TABLE m_in_house_external_class IS '内外作区分マスタ';
COMMENT ON COLUMN m_in_house_external_class.in_house_external_class_code IS '内外作区分コード';
COMMENT ON COLUMN m_in_house_external_class.in_house_external_class_name IS '内外作区分名';

CREATE TABLE m_general_proc (
	proc_code	char(8),
	proc_name	varchar(64),
	proc_rank_code	char(8),
	in_house_external_class_code	char(8),
	product_tag_flag	char(1),
	delivery_location_code	char(8),
	PRIMARY KEY (proc_code)
);

COMMENT ON TABLE m_general_proc IS '汎用工程マスタ';
COMMENT ON COLUMN m_general_proc.proc_code IS '工程コード';
COMMENT ON COLUMN m_general_proc.proc_name IS '工程名';
COMMENT ON COLUMN m_general_proc.proc_rank_code IS '工程ランクコード';
COMMENT ON COLUMN m_general_proc.in_house_external_class_code IS '内外作区分コード';
COMMENT ON COLUMN m_general_proc.product_tag_flag IS '現品票要否フラグ';
COMMENT ON COLUMN m_general_proc.delivery_location_code IS '納入場所コード';

CREATE TABLE material_outgoing (
	order_lot_number	char(16),
	higher_item_code	char(8),
	proc_seq_number	decimal(4),
	proc_code	char(8),
	required_quantity	decimal(18),
	in_house_external_class_code	char(8),
	material_outgoing_class_code	char(8),
	purchase_order_number	char(16),
	outgoing_partner_code	char(8),
	outgoing_warehouse_code	char(8),
	outgoing_item_code	char(8),
	outgoing_quantity	decimal(18),
	unit_code	char(8),
	outgoing_unit_price	decimal(18),
	outgoing_date	date,
	PRIMARY KEY (order_lot_number proc_seq_number)
);

COMMENT ON TABLE material_outgoing IS '部材出庫';
COMMENT ON COLUMN material_outgoing.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN material_outgoing.higher_item_code IS '上位部品コード';
COMMENT ON COLUMN material_outgoing.proc_seq_number IS '工程順No';
COMMENT ON COLUMN material_outgoing.proc_code IS '工程コード';
COMMENT ON COLUMN material_outgoing.required_quantity IS '所要量';
COMMENT ON COLUMN material_outgoing.in_house_external_class_code IS '内外作区分コード';
COMMENT ON COLUMN material_outgoing.material_outgoing_class_code IS '部材出庫区分コード';
COMMENT ON COLUMN material_outgoing.purchase_order_number IS '発注番号';
COMMENT ON COLUMN material_outgoing.outgoing_partner_code IS '払出先コード';
COMMENT ON COLUMN material_outgoing.outgoing_warehouse_code IS '出庫倉庫コード';
COMMENT ON COLUMN material_outgoing.outgoing_item_code IS '出庫・品目コード';
COMMENT ON COLUMN material_outgoing.outgoing_quantity IS '出庫数量';
COMMENT ON COLUMN material_outgoing.unit_code IS '単位コード';
COMMENT ON COLUMN material_outgoing.outgoing_unit_price IS '出庫単価';
COMMENT ON COLUMN material_outgoing.outgoing_date IS '出庫日';

CREATE TABLE m_production_order_class (
	production_order_class_code	char(8),
	production_order_class_name	varchar(64),
	PRIMARY KEY (production_order_class_code)
);

COMMENT ON TABLE m_production_order_class IS '生産手配区分マスタ';
COMMENT ON COLUMN m_production_order_class.production_order_class_code IS '生産手配区分コード';
COMMENT ON COLUMN m_production_order_class.production_order_class_name IS '生産手配区分名';

CREATE TABLE m_proc_material_supply_class (
	proc_material_supply_class_code	char(8),
	proc_material_supply_class_name	varchar(64),
	PRIMARY KEY (proc_material_supply_class_code)
);

COMMENT ON TABLE m_proc_material_supply_class IS '加工材支給区分マスタ';
COMMENT ON COLUMN m_proc_material_supply_class.proc_material_supply_class_code IS '加工材支給区分コード';
COMMENT ON COLUMN m_proc_material_supply_class.proc_material_supply_class_name IS '加工材支給区分名';

CREATE TABLE schedule_proc (
	order_lot_number	char(16),
	production_order_class_code	char(8),
	item_code	char(8),
	parts_rank_code	char(8),
	proc_seq_number	decimal(4),
	proc_code	char(8),
	proc_rank_code	char(8),
	product_order_spec	varchar(256),
	blueprint_number	char(16),
	procure_order_type_code	char(8),
	required_quantity	decimal(18),
	in_house_external_class_code	char(8),
	proc_partner_code	char(8),
	work_unit_code	char(8),
	purchase_type_code	char(8),
	proc_material_supply_class_code	char(8),
	material_outgoing_class_code	char(8),
	product_tag_flag	char(1),
	proc_procure_period	decimal(4),
	start_paln_date	date,
	complete_plan_date	date,
	instruct_purchase_date	date,
	start_construct_plan_date	date,
	start_construct_seq_number	decimal(4),
	setup_time	decimal(18),
	proc_time_per_unit	decimal(4),
	expected_purchase_unit_price	decimal(18),
	inspect_accept_class_code	char(8),
	complete_delivery_date	date,
	inspect_accept_date	date,
	delivery_location_code	char(8),
	PRIMARY KEY (order_lot_number item_code proc_seq_number)
);

COMMENT ON TABLE schedule_proc IS '日程・工程';
COMMENT ON COLUMN schedule_proc.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN schedule_proc.production_order_class_code IS '生産手配区分コード';
COMMENT ON COLUMN schedule_proc.item_code IS '品目コード';
COMMENT ON COLUMN schedule_proc.parts_rank_code IS '部品ランクコード';
COMMENT ON COLUMN schedule_proc.proc_seq_number IS '工程順No';
COMMENT ON COLUMN schedule_proc.proc_code IS '工程コード';
COMMENT ON COLUMN schedule_proc.proc_rank_code IS '工程ランクコード';
COMMENT ON COLUMN schedule_proc.product_order_spec IS '製作・発注仕様';
COMMENT ON COLUMN schedule_proc.blueprint_number IS '図面番号';
COMMENT ON COLUMN schedule_proc.procure_order_type_code IS '調達手配種別コード';
COMMENT ON COLUMN schedule_proc.required_quantity IS '所要数量';
COMMENT ON COLUMN schedule_proc.in_house_external_class_code IS '内外作区分コード';
COMMENT ON COLUMN schedule_proc.proc_partner_code IS '加工・発注先コード';
COMMENT ON COLUMN schedule_proc.work_unit_code IS '作業単位コード';
COMMENT ON COLUMN schedule_proc.purchase_type_code IS '購買種別コード';
COMMENT ON COLUMN schedule_proc.proc_material_supply_class_code IS '加工材支給区分コード';
COMMENT ON COLUMN schedule_proc.material_outgoing_class_code IS '部材出庫区分コード';
COMMENT ON COLUMN schedule_proc.product_tag_flag IS '現品票要否フラグ';
COMMENT ON COLUMN schedule_proc.proc_procure_period IS '工程調達期間';
COMMENT ON COLUMN schedule_proc.start_paln_date IS '開始予定日';
COMMENT ON COLUMN schedule_proc.complete_plan_date IS '完了予定日';
COMMENT ON COLUMN schedule_proc.instruct_purchase_date IS '指示・発注日';
COMMENT ON COLUMN schedule_proc.start_construct_plan_date IS '着工予定日';
COMMENT ON COLUMN schedule_proc.start_construct_seq_number IS '着工順No';
COMMENT ON COLUMN schedule_proc.setup_time IS '段取時間';
COMMENT ON COLUMN schedule_proc.proc_time_per_unit IS '単位当り加工時間';
COMMENT ON COLUMN schedule_proc.expected_purchase_unit_price IS '購買予定単価';
COMMENT ON COLUMN schedule_proc.inspect_accept_class_code IS '検査・検収区分コード';
COMMENT ON COLUMN schedule_proc.complete_delivery_date IS '完了・納入日';
COMMENT ON COLUMN schedule_proc.inspect_accept_date IS '検査・検収日';
COMMENT ON COLUMN schedule_proc.delivery_location_code IS '納入場所コード';

CREATE TABLE procure_order (
	order_lot_number	char(16),
	production_order_class_code	char(8),
	item_code	char(8),
	parts_rank_code	char(8),
	proc_seq_number	decimal(4),
	proc_code	char(8),
	proc_rank_code	char(8),
	product_order_spec	varchar(256),
	blueprint_number	char(16),
	procure_order_type_code	char(8),
	required_quantity	decimal(18),
	in_house_external_class_code	char(8),
	proc_partner_code	char(8),
	work_unit_code	char(8),
	purchase_type_code	char(8),
	proc_material_supply_class_code	char(8),
	material_outgoing_class_code	char(8),
	product_tag_flag	char(1),
	proc_procure_period	decimal(4),
	start_paln_date	date,
	complete_plan_date	date,
	instruct_purchase_date	date,
	start_construct_plan_date	date,
	start_construct_seq_number	decimal(4),
	setup_time	decimal(18),
	proc_time_per_unit	decimal(4),
	expected_purchase_unit_price	decimal(18),
	inspect_accept_class_code	char(8),
	complete_delivery_date	date,
	inspect_accept_date	date,
	delivery_location_code	char(8),
	purchase_order_number	char(16),
	purchase_emp_code	char(8),
	accept_emp_code	char(8),
	result_quantity	decimal(18),
	proc_result_time	decimal(18),
	proc_cost	decimal(18),
	purchase_unit_price	decimal(18),
	passed_quantity	decimal(18),
	rejected_quantity	decimal(18),
	barely_passed_quantity	decimal(18),
	barely_passed_unit_price	decimal(18),
	discount_amount	decimal(18),
	accept_total_amount	decimal(18),
	cook_keep_flag	char(1),
	PRIMARY KEY (order_lot_number item_code proc_seq_number)
);

COMMENT ON TABLE procure_order IS '調達手配';
COMMENT ON COLUMN procure_order.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN procure_order.production_order_class_code IS '生産手配区分コード';
COMMENT ON COLUMN procure_order.item_code IS '品目コード';
COMMENT ON COLUMN procure_order.parts_rank_code IS '部品ランクコード';
COMMENT ON COLUMN procure_order.proc_seq_number IS '工程順No';
COMMENT ON COLUMN procure_order.proc_code IS '工程コード';
COMMENT ON COLUMN procure_order.proc_rank_code IS '工程ランクコード';
COMMENT ON COLUMN procure_order.product_order_spec IS '製作・発注仕様';
COMMENT ON COLUMN procure_order.blueprint_number IS '図面番号';
COMMENT ON COLUMN procure_order.procure_order_type_code IS '調達手配種別コード';
COMMENT ON COLUMN procure_order.required_quantity IS '所要数量';
COMMENT ON COLUMN procure_order.in_house_external_class_code IS '内外作区分コード';
COMMENT ON COLUMN procure_order.proc_partner_code IS '加工・発注先コード';
COMMENT ON COLUMN procure_order.work_unit_code IS '作業単位コード';
COMMENT ON COLUMN procure_order.purchase_type_code IS '購買種別コード';
COMMENT ON COLUMN procure_order.proc_material_supply_class_code IS '加工材支給区分コード';
COMMENT ON COLUMN procure_order.material_outgoing_class_code IS '部材出庫区分コード';
COMMENT ON COLUMN procure_order.product_tag_flag IS '現品票要否フラグ';
COMMENT ON COLUMN procure_order.proc_procure_period IS '工程調達期間';
COMMENT ON COLUMN procure_order.start_paln_date IS '開始予定日';
COMMENT ON COLUMN procure_order.complete_plan_date IS '完了予定日';
COMMENT ON COLUMN procure_order.instruct_purchase_date IS '指示・発注日';
COMMENT ON COLUMN procure_order.start_construct_plan_date IS '着工予定日';
COMMENT ON COLUMN procure_order.start_construct_seq_number IS '着工順No';
COMMENT ON COLUMN procure_order.setup_time IS '段取時間';
COMMENT ON COLUMN procure_order.proc_time_per_unit IS '単位当り加工時間';
COMMENT ON COLUMN procure_order.expected_purchase_unit_price IS '購買予定単価';
COMMENT ON COLUMN procure_order.inspect_accept_class_code IS '検査・検収区分コード';
COMMENT ON COLUMN procure_order.complete_delivery_date IS '完了・納入日';
COMMENT ON COLUMN procure_order.inspect_accept_date IS '検査・検収日';
COMMENT ON COLUMN procure_order.delivery_location_code IS '納入場所コード';
COMMENT ON COLUMN procure_order.purchase_order_number IS '発注番号';
COMMENT ON COLUMN procure_order.purchase_emp_code IS '購買担当者コード';
COMMENT ON COLUMN procure_order.accept_emp_code IS '検収担当者コード';
COMMENT ON COLUMN procure_order.result_quantity IS '実績数量';
COMMENT ON COLUMN procure_order.proc_result_time IS '加工実績時間';
COMMENT ON COLUMN procure_order.proc_cost IS '加工費';
COMMENT ON COLUMN procure_order.purchase_unit_price IS '発注単価';
COMMENT ON COLUMN procure_order.passed_quantity IS '合格数量';
COMMENT ON COLUMN procure_order.rejected_quantity IS '不合格数量';
COMMENT ON COLUMN procure_order.barely_passed_quantity IS '特採数量';
COMMENT ON COLUMN procure_order.barely_passed_unit_price IS '特採単価';
COMMENT ON COLUMN procure_order.discount_amount IS '値引額';
COMMENT ON COLUMN procure_order.accept_total_amount IS '検収合計金額';
COMMENT ON COLUMN procure_order.cook_keep_flag IS 'コック預かりフラグ';

CREATE TABLE m_plan_period_class (
	plan_period_class_code	char(8),
	plan_period_class_name	varchar(64),
	PRIMARY KEY (plan_period_class_code)
);

COMMENT ON TABLE m_plan_period_class IS '計画期間区分マスタ';
COMMENT ON COLUMN m_plan_period_class.plan_period_class_code IS '計画期間区分コード';
COMMENT ON COLUMN m_plan_period_class.plan_period_class_name IS '計画期間区分名';

CREATE TABLE m_uptime_class (
	uptime_class_code	char(8),
	uptime_class_name	varchar(64),
	PRIMARY KEY (uptime_class_code)
);

COMMENT ON TABLE m_uptime_class IS '稼働時間区分マスタ';
COMMENT ON COLUMN m_uptime_class.uptime_class_code IS '稼働時間区分コード';
COMMENT ON COLUMN m_uptime_class.uptime_class_name IS '稼働時間区分名';

CREATE TABLE m_unit_time_type (
	unit_time_type_code	char(8),
	unit_time_type_name	varchar(64),
	PRIMARY KEY (unit_time_type_code)
);

COMMENT ON TABLE m_unit_time_type IS '単位時間種別マスタ';
COMMENT ON COLUMN m_unit_time_type.unit_time_type_code IS '単位時間種別コード';
COMMENT ON COLUMN m_unit_time_type.unit_time_type_name IS '単位時間種別名';

CREATE TABLE m_charge (
	charge_code	char(8),
	charge_name	varchar(64),
	PRIMARY KEY (charge_code)
);

COMMENT ON TABLE m_charge IS 'チャージマスタ';
COMMENT ON COLUMN m_charge.charge_code IS 'チャージコード';
COMMENT ON COLUMN m_charge.charge_name IS 'チャージ名';

CREATE TABLE m_work_slip_type (
	work_slip_type_code	char(8),
	work_slip_type_name	varchar(64),
	PRIMARY KEY (work_slip_type_code)
);

COMMENT ON TABLE m_work_slip_type IS '作業伝票種別マスタ';
COMMENT ON COLUMN m_work_slip_type.work_slip_type_code IS '作業伝票種別コード';
COMMENT ON COLUMN m_work_slip_type.work_slip_type_name IS '作業伝票種別名';

CREATE TABLE m_capacity (
	dept_code	char(8),
	work_unit_code	char(8),
	work_unit_name	varchar(64),
	plan_period_class_code	char(8),
	uptime_class_code	char(8),
	unit_time_type_code	char(8),
	charge_code	char(8),
	work_slip_type_code	char(8),
	warehouse_slack_rate	decimal(5,2),
	start_date	date,
	end_date	date,
	PRIMARY KEY (dept_code work_unit_code)
);

COMMENT ON TABLE m_capacity IS '能力マスタ';
COMMENT ON COLUMN m_capacity.dept_code IS '現場部門コード';
COMMENT ON COLUMN m_capacity.work_unit_code IS '作業単位コード';
COMMENT ON COLUMN m_capacity.work_unit_name IS '作業単位名';
COMMENT ON COLUMN m_capacity.plan_period_class_code IS '計画期間区分コード';
COMMENT ON COLUMN m_capacity.uptime_class_code IS '稼働時間区分コード';
COMMENT ON COLUMN m_capacity.unit_time_type_code IS '単位時間種別コード';
COMMENT ON COLUMN m_capacity.charge_code IS 'チャージコード';
COMMENT ON COLUMN m_capacity.work_slip_type_code IS '作業伝票種別コード';
COMMENT ON COLUMN m_capacity.warehouse_slack_rate IS '倉庫余裕率';
COMMENT ON COLUMN m_capacity.start_date IS '稼働計画開始日';
COMMENT ON COLUMN m_capacity.end_date IS '稼働計画終了日';

CREATE TABLE operation_plan (
	dept_code	char(8),
	work_unit_code	char(8),
	plan_date	date,
	day_of_week	char(1),
	operation_plan_period	decimal(4),
	number_of_work_group_people	decimal(4),
	max_load_capacity	decimal(18),
	PRIMARY KEY (dept_code work_unit_code)
);

COMMENT ON TABLE operation_plan IS '稼働計画';
COMMENT ON COLUMN operation_plan.dept_code IS '現場部門コード';
COMMENT ON COLUMN operation_plan.work_unit_code IS '作業単位コード';
COMMENT ON COLUMN operation_plan.plan_date IS '日付';
COMMENT ON COLUMN operation_plan.day_of_week IS '曜日';
COMMENT ON COLUMN operation_plan.operation_plan_period IS '稼働予定期間';
COMMENT ON COLUMN operation_plan.number_of_work_group_people IS '作業グループ人数';
COMMENT ON COLUMN operation_plan.max_load_capacity IS '負荷最大許容量';

CREATE TABLE work_result (
	item_code	char(8),
	standard_special_class_code	char(8),
	proc_code	char(8),
	work_unit_code	char(8),
	work_complete_date	date,
	result_quantity	decimal(18),
	setup_time	decimal(18),
	target_proc_time_per_unit	decimal(4),
	result_time	decimal(18),
	result_time_per_unit	decimal(4),
	procure_period	decimal(4),
	actual_procure_days	decimal(4),
	order_lot_number	char(16),
	PRIMARY KEY (item_code proc_code work_unit_code)
);

COMMENT ON TABLE work_result IS '作業実績';
COMMENT ON COLUMN work_result.item_code IS '品目コード';
COMMENT ON COLUMN work_result.standard_special_class_code IS '標準・特殊区分コード';
COMMENT ON COLUMN work_result.proc_code IS '工程コード';
COMMENT ON COLUMN work_result.work_unit_code IS '作業単位コード';
COMMENT ON COLUMN work_result.work_complete_date IS '作業完了日';
COMMENT ON COLUMN work_result.result_quantity IS '実績数量';
COMMENT ON COLUMN work_result.setup_time IS '段取時間';
COMMENT ON COLUMN work_result.target_proc_time_per_unit IS '単位当り目標加工時間';
COMMENT ON COLUMN work_result.result_time IS '実績時間';
COMMENT ON COLUMN work_result.result_time_per_unit IS '単位当り実績時間';
COMMENT ON COLUMN work_result.procure_period IS '調達期間';
COMMENT ON COLUMN work_result.actual_procure_days IS '実調達日数';
COMMENT ON COLUMN work_result.order_lot_number IS '受注ロット番号';

CREATE TABLE work_eval (
	proc_code	char(8),
	work_unit_code	char(8),
	work_year_month	char(6),
	total_target_time	decimal(18),
	total_result_time	decimal(18),
	required_total_quantity	decimal(18),
	result_total_quantity	decimal(18),
	PRIMARY KEY (proc_code work_unit_code work_year_month)
);

COMMENT ON TABLE work_eval IS '作業評価';
COMMENT ON COLUMN work_eval.proc_code IS '工程コード';
COMMENT ON COLUMN work_eval.work_unit_code IS '作業単位コード';
COMMENT ON COLUMN work_eval.work_year_month IS '作業年月度';
COMMENT ON COLUMN work_eval.total_target_time IS '目標時間累計';
COMMENT ON COLUMN work_eval.total_result_time IS '実績時間累計';
COMMENT ON COLUMN work_eval.required_total_quantity IS '所要数量累計';
COMMENT ON COLUMN work_eval.result_total_quantity IS '実績数量累計';

CREATE TABLE purchase_result (
	item_code	char(8),
	standard_special_class_code	char(8),
	purchase_type_code	char(8),
	purchase_date	date,
	order_quantity	decimal(18),
	accept_quantity	decimal(18),
	budget_unit_price	decimal(18),
	purchase_unit_price	decimal(18),
	procure_period	decimal(4),
	actual_procure_days	decimal(4),
	purchase_order_number	char(16),
	supplier_code	char(8),
	PRIMARY KEY (item_code purchase_type_code purchase_date)
);

COMMENT ON TABLE purchase_result IS '購買実績';
COMMENT ON COLUMN purchase_result.item_code IS '品目コード';
COMMENT ON COLUMN purchase_result.standard_special_class_code IS '標準・特殊区分コード';
COMMENT ON COLUMN purchase_result.purchase_type_code IS '購買種別コード';
COMMENT ON COLUMN purchase_result.purchase_date IS '発注日';
COMMENT ON COLUMN purchase_result.order_quantity IS '発注数量';
COMMENT ON COLUMN purchase_result.accept_quantity IS '検収数量';
COMMENT ON COLUMN purchase_result.budget_unit_price IS '予算単価';
COMMENT ON COLUMN purchase_result.purchase_unit_price IS '発注単価';
COMMENT ON COLUMN purchase_result.procure_period IS '調達期間';
COMMENT ON COLUMN purchase_result.actual_procure_days IS '実調達日数';
COMMENT ON COLUMN purchase_result.purchase_order_number IS '発注番号';
COMMENT ON COLUMN purchase_result.supplier_code IS '発注先コード';

CREATE TABLE purchase_eval (
	purchase_type_code	char(8),
	purchase_emp_code	char(8),
	eval_year_month	char(6),
	purchase_plan_total_amount	decimal(18),
	purchase_total_amount	decimal(18),
	purchase_total_quantity	decimal(18),
	accept_total_quantity	decimal(18),
	PRIMARY KEY (purchase_type_code purchase_emp_code eval_year_month)
);

COMMENT ON TABLE purchase_eval IS '購買評価';
COMMENT ON COLUMN purchase_eval.purchase_type_code IS '購買種別コード';
COMMENT ON COLUMN purchase_eval.purchase_emp_code IS '購買担当者コード';
COMMENT ON COLUMN purchase_eval.eval_year_month IS '評価年月度';
COMMENT ON COLUMN purchase_eval.purchase_plan_total_amount IS '購買予算累計';
COMMENT ON COLUMN purchase_eval.purchase_total_amount IS '発注金額累計';
COMMENT ON COLUMN purchase_eval.purchase_total_quantity IS '発注数量累計';
COMMENT ON COLUMN purchase_eval.accept_total_quantity IS '検収数量累計';

CREATE TABLE m_inspect_type (
	inspect_type_code	char(8),
	inspect_type_name	varchar(64),
	PRIMARY KEY (inspect_type_code)
);

COMMENT ON TABLE m_inspect_type IS '検査種別マスタ';
COMMENT ON COLUMN m_inspect_type.inspect_type_code IS '検査種別コード';
COMMENT ON COLUMN m_inspect_type.inspect_type_name IS '検査種別名';

CREATE TABLE m_meas_part (
	meas_part_code	char(8),
	meas_part_name	varchar(64),
	PRIMARY KEY (meas_part_code)
);

COMMENT ON TABLE m_meas_part IS '測定部位マスタ';
COMMENT ON COLUMN m_meas_part.meas_part_code IS '測定部位コード';
COMMENT ON COLUMN m_meas_part.meas_part_name IS '測定部位名';

CREATE TABLE m_inspect_basis (
	item_code	char(8),
	proc_code	char(8),
	purchase_type_code	char(8),
	inspect_type_code	char(8),
	inspec_method	varchar(64),
	inspect_accept_class_code	char(8),
	inspect_item	varchar(64),
	meas_device_tool	varchar(64),
	meas_part_code	char(8),
	PRIMARY KEY (item_code proc_code)
);

COMMENT ON TABLE m_inspect_basis IS '検査基準マスタ';
COMMENT ON COLUMN m_inspect_basis.item_code IS '品目コード';
COMMENT ON COLUMN m_inspect_basis.proc_code IS '工程コード';
COMMENT ON COLUMN m_inspect_basis.purchase_type_code IS '購買種別コード';
COMMENT ON COLUMN m_inspect_basis.inspect_type_code IS '検査種別コード';
COMMENT ON COLUMN m_inspect_basis.inspec_method IS '検査方法';
COMMENT ON COLUMN m_inspect_basis.inspect_accept_class_code IS '検査・検収区分コード';
COMMENT ON COLUMN m_inspect_basis.inspect_item IS '検査項目';
COMMENT ON COLUMN m_inspect_basis.meas_device_tool IS '測定装置・器具';
COMMENT ON COLUMN m_inspect_basis.meas_part_code IS '測定部位コード';

CREATE TABLE inspect (
	order_lot_number	char(16),
	item_code	char(8),
	proc_code	char(8),
	in_house_external_class_code	char(8),
	proc_partner_code	char(8),
	work_unit_code	char(8),
	purchase_order_number	char(16),
	inspect_type_code	char(8),
	inspec_method	varchar(64),
	inspect_accept_class_code	char(8),
	inspect_item	varchar(64),
	meas_device_tool	varchar(64),
	meas_part_code	char(8),
	sampling_quantity	decimal(18),
	lot_accept_basis_quantity	decimal(18),
	passed_quantity	decimal(18),
	rework_quantity	decimal(18),
	barely_passed_quantity	decimal(18),
	inspect_number	char(16),
	inspect_emp_code	char(8),
	inspect_date	date,
	PRIMARY KEY (inspect_number)
);

COMMENT ON TABLE inspect IS '検査基本';
COMMENT ON COLUMN inspect.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN inspect.item_code IS '品目コード';
COMMENT ON COLUMN inspect.proc_code IS '工程コード';
COMMENT ON COLUMN inspect.in_house_external_class_code IS '内外作区分コード';
COMMENT ON COLUMN inspect.proc_partner_code IS '加工・発注先コード';
COMMENT ON COLUMN inspect.work_unit_code IS '作業単位コード';
COMMENT ON COLUMN inspect.purchase_order_number IS '発注番号';
COMMENT ON COLUMN inspect.inspect_type_code IS '検査種別コード';
COMMENT ON COLUMN inspect.inspec_method IS '検査方法';
COMMENT ON COLUMN inspect.inspect_accept_class_code IS '検査・検収区分コード';
COMMENT ON COLUMN inspect.inspect_item IS '検査項目';
COMMENT ON COLUMN inspect.meas_device_tool IS '測定装置・器具';
COMMENT ON COLUMN inspect.meas_part_code IS '測定部位コード';
COMMENT ON COLUMN inspect.sampling_quantity IS '抜取り数';
COMMENT ON COLUMN inspect.lot_accept_basis_quantity IS 'ロット合否判定基準数';
COMMENT ON COLUMN inspect.passed_quantity IS '合格数量';
COMMENT ON COLUMN inspect.rework_quantity IS '手直し数';
COMMENT ON COLUMN inspect.barely_passed_quantity IS '特採数';
COMMENT ON COLUMN inspect.inspect_number IS '検査番号';
COMMENT ON COLUMN inspect.inspect_emp_code IS '検査担当者コード';
COMMENT ON COLUMN inspect.inspect_date IS '検査日';

CREATE TABLE inspect_line (
	inspect_number	char(16),
	meas_part_code	char(8),
	meas_basis_value	double,
	upper_tolerance	double,
	lower_tolerance	double,
	parts_serial_number	char(16),
	actual_meas_value	double,
	PRIMARY KEY (inspect_number)
);

COMMENT ON TABLE inspect_line IS '検査明細';
COMMENT ON COLUMN inspect_line.inspect_number IS '検査番号';
COMMENT ON COLUMN inspect_line.meas_part_code IS '測定部位コード';
COMMENT ON COLUMN inspect_line.meas_basis_value IS '測定基準値';
COMMENT ON COLUMN inspect_line.upper_tolerance IS '公差上限';
COMMENT ON COLUMN inspect_line.lower_tolerance IS '公差下限';
COMMENT ON COLUMN inspect_line.parts_serial_number IS '部品追順No';
COMMENT ON COLUMN inspect_line.actual_meas_value IS '実測値';

CREATE TABLE product_ledger (
	product_number	char(16),
	order_lot_number	char(16),
	customer_code	char(8),
	item_code	char(8),
	inspect_emp_code	char(8),
	inspect_date	date,
	ship_date	date,
	PRIMARY KEY (product_number)
);

COMMENT ON TABLE product_ledger IS '製品台帳';
COMMENT ON COLUMN product_ledger.product_number IS '製品番号';
COMMENT ON COLUMN product_ledger.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN product_ledger.customer_code IS '得意先コード';
COMMENT ON COLUMN product_ledger.item_code IS '品目コード';
COMMENT ON COLUMN product_ledger.inspect_emp_code IS '検査担当者コード';
COMMENT ON COLUMN product_ledger.inspect_date IS '検査日';
COMMENT ON COLUMN product_ledger.ship_date IS '出荷日';

CREATE TABLE m_incoming_type (
	incoming_type_code	char(8),
	incoming_type_name	varchar(64),
	PRIMARY KEY (incoming_type_code)
);

COMMENT ON TABLE m_incoming_type IS '入庫種別マスタ';
COMMENT ON COLUMN m_incoming_type.incoming_type_code IS '入庫種別コード';
COMMENT ON COLUMN m_incoming_type.incoming_type_name IS '入庫種別名';

CREATE TABLE m_outgoing_type (
	outgoing_type_code	char(8),
	outgoing_type_name	varchar(64),
	PRIMARY KEY (outgoing_type_code)
);

COMMENT ON TABLE m_outgoing_type IS '出庫種別マスタ';
COMMENT ON COLUMN m_outgoing_type.outgoing_type_code IS '出庫種別コード';
COMMENT ON COLUMN m_outgoing_type.outgoing_type_name IS '出庫種別名';

CREATE TABLE auto_incoming_outgoing (
	incoming_outgoing_number	decimal(18),
	incoming_type_code	char(8),
	outgoing_type_code	char(8),
	order_lot_number	char(16),
	purchase_order_number	char(16),
	item_code	char(8),
	proc_code	char(8),
	warehouse_code	char(8),
	incoming_quantity	decimal(18),
	outgoing_quantity	decimal(18),
	unit_code	char(8),
	incoming_unit_price	decimal(18),
	outgoing_unit_price	decimal(18),
	incoming_outgoing_date	date,
	PRIMARY KEY (incoming_outgoing_number)
);

COMMENT ON TABLE auto_incoming_outgoing IS '自動入出庫';
COMMENT ON COLUMN auto_incoming_outgoing.incoming_outgoing_number IS '入出庫番号';
COMMENT ON COLUMN auto_incoming_outgoing.incoming_type_code IS '入庫種別コード';
COMMENT ON COLUMN auto_incoming_outgoing.outgoing_type_code IS '出庫種別コード';
COMMENT ON COLUMN auto_incoming_outgoing.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN auto_incoming_outgoing.purchase_order_number IS '発注番号';
COMMENT ON COLUMN auto_incoming_outgoing.item_code IS '品目コード';
COMMENT ON COLUMN auto_incoming_outgoing.proc_code IS '工程コード';
COMMENT ON COLUMN auto_incoming_outgoing.warehouse_code IS '倉庫コード';
COMMENT ON COLUMN auto_incoming_outgoing.incoming_quantity IS '入庫数';
COMMENT ON COLUMN auto_incoming_outgoing.outgoing_quantity IS '出庫数';
COMMENT ON COLUMN auto_incoming_outgoing.unit_code IS '単位コード';
COMMENT ON COLUMN auto_incoming_outgoing.incoming_unit_price IS '入庫単価';
COMMENT ON COLUMN auto_incoming_outgoing.outgoing_unit_price IS '出庫単価';
COMMENT ON COLUMN auto_incoming_outgoing.incoming_outgoing_date IS '入出庫日';

CREATE TABLE m_inv_type (
	inv_type_code	char(8),
	inv_type_name	varchar(64),
	PRIMARY KEY (inv_type_code)
);

COMMENT ON TABLE m_inv_type IS '在庫品種別マスタ';
COMMENT ON COLUMN m_inv_type.inv_type_code IS '在庫品種別コード';
COMMENT ON COLUMN m_inv_type.inv_type_name IS '在庫品種別名';

CREATE TABLE m_asset_class (
	asset_class_code	char(8),
	asset_class_name	varchar(64),
	PRIMARY KEY (asset_class_code)
);

COMMENT ON TABLE m_asset_class IS '資産区分マスタ';
COMMENT ON COLUMN m_asset_class.asset_class_code IS '資産区分コード';
COMMENT ON COLUMN m_asset_class.asset_class_name IS '資産区分名';

CREATE TABLE m_inv_use_class (
	inv_use_class_code	char(8),
	inv_use_class_name	varchar(64),
	PRIMARY KEY (inv_use_class_code)
);

COMMENT ON TABLE m_inv_use_class IS '在庫用途区分マスタ';
COMMENT ON COLUMN m_inv_use_class.inv_use_class_code IS '在庫用途区分コード';
COMMENT ON COLUMN m_inv_use_class.inv_use_class_name IS '在庫用途区分名';

CREATE TABLE m_item_group (
	item_group_code	char(8),
	item_group_name	varchar(64),
	PRIMARY KEY (item_group_code)
);

COMMENT ON TABLE m_item_group IS '品目グループマスタ';
COMMENT ON COLUMN m_item_group.item_group_code IS '品目グループコード';
COMMENT ON COLUMN m_item_group.item_group_name IS '品目グループ名';

CREATE TABLE m_inventory (
	item_code	char(8),
	proc_code	char(8),
	inv_type_code	char(8),
	asset_class_code	char(8),
	inv_use_class_code	char(8),
	item_group_code	char(8),
	warehouse_code	char(8),
	storage_location_code	char(8),
	shelf_position_number	char(16),
	total_inv_quantity	decimal(18),
	unallocated_inv_quantity	decimal(18),
	allocated_inv_quantity	decimal(18),
	unit_code	char(8),
	inv_unit_price	decimal(18),
	previous_month_total_inv_quantity	decimal(18),
	current_month_incoming_quantity	decimal(18),
	current_month_outgoing_quantity	decimal(18),
	current_month_transfer_incoming_quantity	decimal(18),
	current_month_transfer_outgoing_quantity	decimal(18),
	latest_incoming_date	date,
	latest_outgoing_date	date,
	replenish_procure_period	decimal(4),
	order_point_inv_quantity	decimal(18),
	safely_inv_quantity	decimal(18),
	replenish_purchase_quantity	decimal(18),
	purchase_request_date	date,
	purchase_request_quantity	decimal(18),
	procure_period_outgoing_quantity	decimal(18),
	latest_inv_count_date	date,
	current_inv_count_date	date,
	inv_count_start_plan_time	timestamp,
	inv_count_end_plan_time	timestamp,
	before_inv_count_total_quantity	decimal(18),
	inv_count_incoming_quantity	decimal(18),
	inv_count_outgoing_quantity	decimal(18),
	PRIMARY KEY (item_code proc_code inv_type_code asset_class_code)
);

COMMENT ON TABLE m_inventory IS '在庫マスタ';
COMMENT ON COLUMN m_inventory.item_code IS '品目コード';
COMMENT ON COLUMN m_inventory.proc_code IS '工程コード';
COMMENT ON COLUMN m_inventory.inv_type_code IS '在庫品種別コード';
COMMENT ON COLUMN m_inventory.asset_class_code IS '資産区分コード';
COMMENT ON COLUMN m_inventory.inv_use_class_code IS '在庫用途区分コード';
COMMENT ON COLUMN m_inventory.item_group_code IS '品目グループコード';
COMMENT ON COLUMN m_inventory.warehouse_code IS '倉庫コード';
COMMENT ON COLUMN m_inventory.storage_location_code IS '格納場所コード';
COMMENT ON COLUMN m_inventory.shelf_position_number IS '棚位置番号';
COMMENT ON COLUMN m_inventory.total_inv_quantity IS '総在庫数';
COMMENT ON COLUMN m_inventory.unallocated_inv_quantity IS '未引当在庫数';
COMMENT ON COLUMN m_inventory.allocated_inv_quantity IS '引当在庫数';
COMMENT ON COLUMN m_inventory.unit_code IS '単位コード';
COMMENT ON COLUMN m_inventory.inv_unit_price IS '在庫単価';
COMMENT ON COLUMN m_inventory.previous_month_total_inv_quantity IS '前月末総在庫数';
COMMENT ON COLUMN m_inventory.current_month_incoming_quantity IS '当月度入庫数';
COMMENT ON COLUMN m_inventory.current_month_outgoing_quantity IS '当月度出庫数';
COMMENT ON COLUMN m_inventory.current_month_transfer_incoming_quantity IS '当月度移動入庫数';
COMMENT ON COLUMN m_inventory.current_month_transfer_outgoing_quantity IS '当月度移動出庫数';
COMMENT ON COLUMN m_inventory.latest_incoming_date IS '最新入庫日';
COMMENT ON COLUMN m_inventory.latest_outgoing_date IS '最新出庫日';
COMMENT ON COLUMN m_inventory.replenish_procure_period IS '補充調達期間';
COMMENT ON COLUMN m_inventory.order_point_inv_quantity IS '発注点在庫数';
COMMENT ON COLUMN m_inventory.safely_inv_quantity IS '安全在庫数';
COMMENT ON COLUMN m_inventory.replenish_purchase_quantity IS '補充発注数';
COMMENT ON COLUMN m_inventory.purchase_request_date IS '発注依頼日';
COMMENT ON COLUMN m_inventory.purchase_request_quantity IS '発注依頼数';
COMMENT ON COLUMN m_inventory.procure_period_outgoing_quantity IS '調達期間中出庫数';
COMMENT ON COLUMN m_inventory.latest_inv_count_date IS '前回棚卸日';
COMMENT ON COLUMN m_inventory.current_inv_count_date IS '今回棚卸日';
COMMENT ON COLUMN m_inventory.inv_count_start_plan_time IS '棚卸開始予定時刻';
COMMENT ON COLUMN m_inventory.inv_count_end_plan_time IS '棚卸終了予定時刻';
COMMENT ON COLUMN m_inventory.before_inv_count_total_quantity IS '棚卸前総在庫数';
COMMENT ON COLUMN m_inventory.inv_count_incoming_quantity IS '棚卸中入庫数';
COMMENT ON COLUMN m_inventory.inv_count_outgoing_quantity IS '棚卸中出庫数';

CREATE TABLE off_books_inv (
	order_lot_number	char(16),
	dept_code	char(8),
	item_code	char(8),
	proc_code	char(8),
	inv_type_code	char(8),
	asset_class_code	char(8),
	inv_use_class_code	char(8),
	item_code	char(8),
	warehouse_code	char(8),
	storage_location_code	char(8),
	shelf_position_number	char(16),
	total_inv_quantity	decimal(18),
	unit_code	char(8),
	inv_unit_price	decimal(18),
	inv_amount	decimal(18),
	latest_incoming_date	date,
	latest_outgoing_date	date,
	latest_inv_count_date	date,
	current_inv_count_date	date,
	PRIMARY KEY (order_lot_number item_code proc_code inv_type_code asset_class_code)
);

COMMENT ON TABLE off_books_inv IS '簿外在庫';
COMMENT ON COLUMN off_books_inv.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN off_books_inv.dept_code IS '部門コード';
COMMENT ON COLUMN off_books_inv.item_code IS '品目コード';
COMMENT ON COLUMN off_books_inv.proc_code IS '工程コード';
COMMENT ON COLUMN off_books_inv.inv_type_code IS '在庫品種別コード';
COMMENT ON COLUMN off_books_inv.asset_class_code IS '資産区分コード';
COMMENT ON COLUMN off_books_inv.inv_use_class_code IS '在庫用途区分コード';
COMMENT ON COLUMN off_books_inv.item_code IS '品目コード';
COMMENT ON COLUMN off_books_inv.warehouse_code IS '倉庫コード';
COMMENT ON COLUMN off_books_inv.storage_location_code IS '格納場所コード';
COMMENT ON COLUMN off_books_inv.shelf_position_number IS '棚位置番号';
COMMENT ON COLUMN off_books_inv.total_inv_quantity IS '総在庫数';
COMMENT ON COLUMN off_books_inv.unit_code IS '単位コード';
COMMENT ON COLUMN off_books_inv.inv_unit_price IS '在庫単価';
COMMENT ON COLUMN off_books_inv.inv_amount IS '在庫金額';
COMMENT ON COLUMN off_books_inv.latest_incoming_date IS '最新入庫日';
COMMENT ON COLUMN off_books_inv.latest_outgoing_date IS '最新出庫日';
COMMENT ON COLUMN off_books_inv.latest_inv_count_date IS '前回棚卸日';
COMMENT ON COLUMN off_books_inv.current_inv_count_date IS '今回棚卸日';

CREATE TABLE move_ship (
	move_ship_number	decimal(18),
	transfer_request_dept_code	char(8),
	outgoing_warehouse_code	char(8),
	incoming_warehouse_code	char(8),
	item_code	char(8),
	proc_code	char(8),
	transfer_quantity	decimal(18),
	outgoing_unit_price	decimal(18),
	outgoing_date	date,
	incoming_date	date,
	PRIMARY KEY (move_ship_number)
);

COMMENT ON TABLE move_ship IS '移動積送';
COMMENT ON COLUMN move_ship.move_ship_number IS '移動積送番号';
COMMENT ON COLUMN move_ship.transfer_request_dept_code IS '移動依頼部門コード';
COMMENT ON COLUMN move_ship.outgoing_warehouse_code IS '出庫倉庫コード';
COMMENT ON COLUMN move_ship.incoming_warehouse_code IS '入庫倉庫コード';
COMMENT ON COLUMN move_ship.item_code IS '品目コード';
COMMENT ON COLUMN move_ship.proc_code IS '工程コード';
COMMENT ON COLUMN move_ship.transfer_quantity IS '移動積送数';
COMMENT ON COLUMN move_ship.outgoing_unit_price IS '出庫単価';
COMMENT ON COLUMN move_ship.outgoing_date IS '出庫日';
COMMENT ON COLUMN move_ship.incoming_date IS '入庫日';

CREATE TABLE m_inv_status_change_type (
	inv_status_change_type_code	char(8),
	inv_status_change_type_name	varchar(64),
	PRIMARY KEY (inv_status_change_type_code)
);

COMMENT ON TABLE m_inv_status_change_type IS '在庫状態変更種別マスタ';
COMMENT ON COLUMN m_inv_status_change_type.inv_status_change_type_code IS '在庫状態変更種別コード';
COMMENT ON COLUMN m_inv_status_change_type.inv_status_change_type_name IS '在庫状態変更種別名';

CREATE TABLE inv_receipt_payment (
	inv_receipt_payment_number	decimal(18),
	incoming_type_code	char(8),
	outgoing_type_code	char(8),
	inv_status_change_type_code	char(8),
	order_lot_number	char(16),
	dept_code	char(8),
	purchase_order_number	char(16),
	item_code	char(8),
	proc_code	char(8),
	inv_type_code	char(8),
	asset_class_code	char(8),
	inv_use_class_code	char(8),
	item_group_code	char(8),
	warehouse_code	char(8),
	storage_location_code	char(8),
	shelf_position_number	char(16),
	incoming_quantity	decimal(18),
	outgoing_quantity	decimal(18),
	unit_code	char(8),
	incoming_unit_price	decimal(18),
	outgoing_unit_price	decimal(18),
	incoming_outgoing_date	date,
	incoming_outgoing_time	timestamp,
	warehouse_emp_code	char(8),
	counterpart_warehouse_code	char(8),
	PRIMARY KEY (inv_receipt_payment_number)
);

COMMENT ON TABLE inv_receipt_payment IS '在庫受払';
COMMENT ON COLUMN inv_receipt_payment.inv_receipt_payment_number IS '在庫受払番号';
COMMENT ON COLUMN inv_receipt_payment.incoming_type_code IS '入庫種別コード';
COMMENT ON COLUMN inv_receipt_payment.outgoing_type_code IS '出庫種別コード';
COMMENT ON COLUMN inv_receipt_payment.inv_status_change_type_code IS '在庫状態変更種別コード';
COMMENT ON COLUMN inv_receipt_payment.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN inv_receipt_payment.dept_code IS '部門コード';
COMMENT ON COLUMN inv_receipt_payment.purchase_order_number IS '発注番号';
COMMENT ON COLUMN inv_receipt_payment.item_code IS '品目コード';
COMMENT ON COLUMN inv_receipt_payment.proc_code IS '工程コード';
COMMENT ON COLUMN inv_receipt_payment.inv_type_code IS '在庫品種別コード';
COMMENT ON COLUMN inv_receipt_payment.asset_class_code IS '資産区分コード';
COMMENT ON COLUMN inv_receipt_payment.inv_use_class_code IS '在庫用途区分コード';
COMMENT ON COLUMN inv_receipt_payment.item_group_code IS '品目グループコード';
COMMENT ON COLUMN inv_receipt_payment.warehouse_code IS '倉庫コード';
COMMENT ON COLUMN inv_receipt_payment.storage_location_code IS '格納場所コード';
COMMENT ON COLUMN inv_receipt_payment.shelf_position_number IS '棚位置番号';
COMMENT ON COLUMN inv_receipt_payment.incoming_quantity IS '入庫数';
COMMENT ON COLUMN inv_receipt_payment.outgoing_quantity IS '出庫数';
COMMENT ON COLUMN inv_receipt_payment.unit_code IS '単位コード';
COMMENT ON COLUMN inv_receipt_payment.incoming_unit_price IS '入庫単価';
COMMENT ON COLUMN inv_receipt_payment.outgoing_unit_price IS '出庫単価';
COMMENT ON COLUMN inv_receipt_payment.incoming_outgoing_date IS '受払日';
COMMENT ON COLUMN inv_receipt_payment.incoming_outgoing_time IS '受払時刻';
COMMENT ON COLUMN inv_receipt_payment.warehouse_emp_code IS '倉庫担当者コード';
COMMENT ON COLUMN inv_receipt_payment.counterpart_warehouse_code IS '相手先倉庫コード';

CREATE TABLE inv_eval (
	warehouse_code	char(8),
	inv_type_code	char(8),
	item_group_code	char(8),
	eval_year_month	char(6),
	previous_month_inv_quantity	decimal(18),
	current_month_inv_quantity	decimal(18),
	current_month_incoming_quantity	decimal(18),
	current_month_outgoing_quantity	decimal(18),
	PRIMARY KEY (warehouse_code inv_type_code item_group_code eval_year_month)
);

COMMENT ON TABLE inv_eval IS '在庫評価';
COMMENT ON COLUMN inv_eval.warehouse_code IS '倉庫コード';
COMMENT ON COLUMN inv_eval.inv_type_code IS '在庫品種別コード';
COMMENT ON COLUMN inv_eval.item_group_code IS '品目グループコード';
COMMENT ON COLUMN inv_eval.eval_year_month IS '評価年月度';
COMMENT ON COLUMN inv_eval.previous_month_inv_quantity IS '前月末在庫数';
COMMENT ON COLUMN inv_eval.current_month_inv_quantity IS '当月末在庫数';
COMMENT ON COLUMN inv_eval.current_month_incoming_quantity IS '当月度入庫数';
COMMENT ON COLUMN inv_eval.current_month_outgoing_quantity IS '当月度出庫数';

CREATE TABLE replenish_analysis (
	warehouse_code	char(8),
	item_code	char(8),
	proc_code	char(8),
	inv_type_code	char(8),
	item_group_code	char(8),
	procure_period	decimal(4),
	order_point_quantity	decimal(18),
	safely_inv_quantity	decimal(18),
	replenish_purchase_quantity	decimal(18),
	procure_period_outgoing_quantity	decimal(18),
	PRIMARY KEY (warehouse_code item_code proc_code inv_type_code item_group_code procure_period)
);

COMMENT ON TABLE replenish_analysis IS '補充分析';
COMMENT ON COLUMN replenish_analysis.warehouse_code IS '倉庫コード';
COMMENT ON COLUMN replenish_analysis.item_code IS '品目コード';
COMMENT ON COLUMN replenish_analysis.proc_code IS '工程コード';
COMMENT ON COLUMN replenish_analysis.inv_type_code IS '在庫品種別コード';
COMMENT ON COLUMN replenish_analysis.item_group_code IS '品目グループコード';
COMMENT ON COLUMN replenish_analysis.procure_period IS '調達期間';
COMMENT ON COLUMN replenish_analysis.order_point_quantity IS '発注点数量';
COMMENT ON COLUMN replenish_analysis.safely_inv_quantity IS '安全在庫数';
COMMENT ON COLUMN replenish_analysis.replenish_purchase_quantity IS '補充発注数';
COMMENT ON COLUMN replenish_analysis.procure_period_outgoing_quantity IS '調達期間中出庫数';

CREATE TABLE replenish_order (
	replenish_order_number	decimal(18),
	warehouse_code	char(8),
	item_code	char(8),
	proc_code	char(8),
	purchase_request_date	date,
	purchase_request_quantity	decimal(18),
	incoming_date	date,
	actual_procure_days	decimal(4),
	PRIMARY KEY (replenish_order_number)
);

COMMENT ON TABLE replenish_order IS '補充発注';
COMMENT ON COLUMN replenish_order.replenish_order_number IS '補充発注番号';
COMMENT ON COLUMN replenish_order.warehouse_code IS '倉庫コード';
COMMENT ON COLUMN replenish_order.item_code IS '品目コード';
COMMENT ON COLUMN replenish_order.proc_code IS '工程コード';
COMMENT ON COLUMN replenish_order.purchase_request_date IS '発注依頼日';
COMMENT ON COLUMN replenish_order.purchase_request_quantity IS '発注依頼数';
COMMENT ON COLUMN replenish_order.incoming_date IS '入庫日';
COMMENT ON COLUMN replenish_order.actual_procure_days IS '実調達日数';

CREATE TABLE m_diff_cause (
	diff_cause_code	char(8),
	diff_cause_name	varchar(64),
	PRIMARY KEY (diff_cause_code)
);

COMMENT ON TABLE m_diff_cause IS '差異原因マスタ';
COMMENT ON COLUMN m_diff_cause.diff_cause_code IS '差異原因コード';
COMMENT ON COLUMN m_diff_cause.diff_cause_name IS '差異原因名';

CREATE TABLE inv_count (
	inv_count_number	decimal(18),
	warehouse_code	char(8),
	storage_location_code	char(8),
	shelf_position_number	char(16),
	item_code	char(8),
	proc_code	char(8),
	inv_type_code	char(8),
	item_group_code	char(8),
	current_inv_count_date	date,
	inv_count_start_plan_time	timestamp,
	inv_count_end_plan_time	timestamp,
	inv_count_emp_code	char(8),
	before_inv_count_total_quantity	decimal(18),
	inv_count_start_time	timestamp,
	inv_count_end_time	timestamp,
	inv_balance	decimal(18),
	result_inv_count	decimal(18),
	inv_count_outgoing_quantity	decimal(18),
	inv_count_increase_quantity	decimal(18),
	inv_count_decrease_quantity	decimal(18),
	diff_cause_code	char(8),
	inv_count_master_incoming_quantity	decimal(18),
	inv_count_master_outgoing_quantity	decimal(18),
	PRIMARY KEY (inv_count_number)
);

COMMENT ON TABLE inv_count IS '在庫棚卸';
COMMENT ON COLUMN inv_count.inv_count_number IS '在庫棚卸番号';
COMMENT ON COLUMN inv_count.warehouse_code IS '倉庫コード';
COMMENT ON COLUMN inv_count.storage_location_code IS '格納場所コード';
COMMENT ON COLUMN inv_count.shelf_position_number IS '棚位置番号';
COMMENT ON COLUMN inv_count.item_code IS '品目コード';
COMMENT ON COLUMN inv_count.proc_code IS '工程コード';
COMMENT ON COLUMN inv_count.inv_type_code IS '在庫品種別コード';
COMMENT ON COLUMN inv_count.item_group_code IS '品目グループコード';
COMMENT ON COLUMN inv_count.current_inv_count_date IS '今回棚卸日';
COMMENT ON COLUMN inv_count.inv_count_start_plan_time IS '棚卸開始予定時刻';
COMMENT ON COLUMN inv_count.inv_count_end_plan_time IS '棚卸終了予定時刻';
COMMENT ON COLUMN inv_count.inv_count_emp_code IS '棚卸担当者コード';
COMMENT ON COLUMN inv_count.before_inv_count_total_quantity IS '棚卸前総在庫数';
COMMENT ON COLUMN inv_count.inv_count_start_time IS '棚卸開始時刻';
COMMENT ON COLUMN inv_count.inv_count_end_time IS '棚卸終了時刻';
COMMENT ON COLUMN inv_count.inv_balance IS '棚卸残高数';
COMMENT ON COLUMN inv_count.result_inv_count IS '実棚卸数';
COMMENT ON COLUMN inv_count.inv_count_outgoing_quantity IS '棚卸中出庫数';
COMMENT ON COLUMN inv_count.inv_count_increase_quantity IS '棚卸増加数';
COMMENT ON COLUMN inv_count.inv_count_decrease_quantity IS '棚卸減少数';
COMMENT ON COLUMN inv_count.diff_cause_code IS '差異原因コード';
COMMENT ON COLUMN inv_count.inv_count_master_incoming_quantity IS '棚卸中・在庫マスタ入庫数';
COMMENT ON COLUMN inv_count.inv_count_master_outgoing_quantity IS '棚卸中・在庫マスタ出庫数';

CREATE TABLE terminal_inv_count (
	terminal_inv_count_number	decimal(18),
	warehouse_code	char(8),
	storage_location_code	char(8),
	shelf_position_number	char(16),
	item_code	char(8),
	item_name	varchar(64),
	before_inv_count_total_quantity	decimal(18),
	inv_count_start_time	timestamp,
	inv_count_end_time	timestamp,
	inv_balance	decimal(18),
	result_inv_count	decimal(18),
	inv_count_outgoing_quantity	decimal(18),
	PRIMARY KEY (terminal_inv_count_number)
);

COMMENT ON TABLE terminal_inv_count IS '端末棚卸';
COMMENT ON COLUMN terminal_inv_count.terminal_inv_count_number IS '端末棚卸番号';
COMMENT ON COLUMN terminal_inv_count.warehouse_code IS '倉庫コード';
COMMENT ON COLUMN terminal_inv_count.storage_location_code IS '格納場所コード';
COMMENT ON COLUMN terminal_inv_count.shelf_position_number IS '棚位置番号';
COMMENT ON COLUMN terminal_inv_count.item_code IS '品目コード';
COMMENT ON COLUMN terminal_inv_count.item_name IS '品目名';
COMMENT ON COLUMN terminal_inv_count.before_inv_count_total_quantity IS '棚卸前総在庫数';
COMMENT ON COLUMN terminal_inv_count.inv_count_start_time IS '棚卸開始時刻';
COMMENT ON COLUMN terminal_inv_count.inv_count_end_time IS '棚卸完了時刻';
COMMENT ON COLUMN terminal_inv_count.inv_balance IS '棚卸残高数';
COMMENT ON COLUMN terminal_inv_count.result_inv_count IS '実棚卸数';
COMMENT ON COLUMN terminal_inv_count.inv_count_outgoing_quantity IS '棚卸中出庫数';

CREATE TABLE m_ship_type (
	ship_type_code	char(8),
	ship_type_name	varchar(64),
	PRIMARY KEY (ship_type_code)
);

COMMENT ON TABLE m_ship_type IS '出荷種別マスタ';
COMMENT ON COLUMN m_ship_type.ship_type_code IS '出荷種別コード';
COMMENT ON COLUMN m_ship_type.ship_type_name IS '出荷種別名';

CREATE TABLE m_transport_cost_class (
	transport_cost_class_code	char(8),
	transport_cost_class_name	varchar(64),
	PRIMARY KEY (transport_cost_class_code)
);

COMMENT ON TABLE m_transport_cost_class IS '運送費負担区分マスタ';
COMMENT ON COLUMN m_transport_cost_class.transport_cost_class_code IS '運送費負担区分コード';
COMMENT ON COLUMN m_transport_cost_class.transport_cost_class_name IS '運送費負担区分名';

CREATE TABLE m_transport_method (
	transport_method_code	char(8),
	transport_method_name	varchar(64),
	PRIMARY KEY (transport_method_code)
);

COMMENT ON TABLE m_transport_method IS '運送方法マスタ';
COMMENT ON COLUMN m_transport_method.transport_method_code IS '運送方法コード';
COMMENT ON COLUMN m_transport_method.transport_method_name IS '運送方法名';

CREATE TABLE m_packaging (
	packaging_code	char(8),
	packaging_name	varchar(64),
	PRIMARY KEY (packaging_code)
);

COMMENT ON TABLE m_packaging IS '荷姿マスタ';
COMMENT ON COLUMN m_packaging.packaging_code IS '荷姿コード';
COMMENT ON COLUMN m_packaging.packaging_name IS '荷姿名';

CREATE TABLE shipping (
	ship_type_code	char(8),
	ship_number	char(16),
	order_type_code	char(8),
	order_number	char(16),
	line_number	decimal(4),
	order_line_class_code	char(8),
	item_code	char(8),
	line_spec	varchar(256),
	ship_quantity	decimal(18),
	unit_code	char(8),
	sales_emp_code	char(8),
	customer_code	char(8),
	delivery_customer_code	char(8),
	delivery_customer_name	varchar(64),
	zip_code	char(7),
	address	varchar(128),
	phone_number	varchar(16),
	customer_purchase_order_number	varchar(64),
	partner_item_code	char(8),
	oem_flag	char(1),
	transport_cost_class_code	char(8),
	pre_compensation_order_number	char(16),
	claim_ship_number	char(16),
	transfer_request_dept_code	char(8),
	outgoing_warehouse_code	char(8),
	incoming_warehouse_code	char(8),
	transport_method_code	char(8),
	transport_request_code	char(8),
	inquiry_number	char(16),
	ship_plan_time	timestamp,
	packaging_code	char(8),
	packaging_quantity	decimal(18),
	packaging_unit_volume	decimal(10,2),
	packaging_weight	decimal(10,2),
	transport_distance	decimal(18),
	delivery_date	date,
	transport_period	decimal(4),
	ship_request_date	date,
	ship_date	date,
	ship_time	timestamp,
	accept_date	date,
	transport_cost	decimal(18),
	accept_amount	decimal(18),
	PRIMARY KEY (ship_number)
);

COMMENT ON TABLE shipping IS '出荷';
COMMENT ON COLUMN shipping.ship_type_code IS '出荷種別コード';
COMMENT ON COLUMN shipping.ship_number IS '出荷番号';
COMMENT ON COLUMN shipping.order_type_code IS '受注種別コード';
COMMENT ON COLUMN shipping.order_number IS '受注番号';
COMMENT ON COLUMN shipping.line_number IS '明細No';
COMMENT ON COLUMN shipping.order_line_class_code IS '受注明細区分コード';
COMMENT ON COLUMN shipping.item_code IS '品目コード';
COMMENT ON COLUMN shipping.line_spec IS '明細仕様';
COMMENT ON COLUMN shipping.ship_quantity IS '出荷数';
COMMENT ON COLUMN shipping.unit_code IS '単位コード';
COMMENT ON COLUMN shipping.sales_emp_code IS '営業担当者コード';
COMMENT ON COLUMN shipping.customer_code IS '得意先コード';
COMMENT ON COLUMN shipping.delivery_customer_code IS '納入先コード';
COMMENT ON COLUMN shipping.delivery_customer_name IS '納入先名';
COMMENT ON COLUMN shipping.zip_code IS '郵便番号';
COMMENT ON COLUMN shipping.address IS '住所';
COMMENT ON COLUMN shipping.phone_number IS '電話番号';
COMMENT ON COLUMN shipping.customer_purchase_order_number IS '得意先発注番号';
COMMENT ON COLUMN shipping.partner_item_code IS '他社品目コード';
COMMENT ON COLUMN shipping.oem_flag IS 'OEMフラグ';
COMMENT ON COLUMN shipping.transport_cost_class_code IS '運送費負担区分コード';
COMMENT ON COLUMN shipping.pre_compensation_order_number IS '補償前受注番号';
COMMENT ON COLUMN shipping.claim_ship_number IS 'クレーム出荷番号';
COMMENT ON COLUMN shipping.transfer_request_dept_code IS '移動依頼部門コード';
COMMENT ON COLUMN shipping.outgoing_warehouse_code IS '出庫側倉庫コード';
COMMENT ON COLUMN shipping.incoming_warehouse_code IS '入庫側倉庫コード';
COMMENT ON COLUMN shipping.transport_method_code IS '運送方法コード';
COMMENT ON COLUMN shipping.transport_request_code IS '運送依頼先コード';
COMMENT ON COLUMN shipping.inquiry_number IS '問合せ番号';
COMMENT ON COLUMN shipping.ship_plan_time IS '出荷予定時刻';
COMMENT ON COLUMN shipping.packaging_code IS '荷姿コード';
COMMENT ON COLUMN shipping.packaging_quantity IS '梱包数';
COMMENT ON COLUMN shipping.packaging_unit_volume IS '梱包単位容積';
COMMENT ON COLUMN shipping.packaging_weight IS '梱包重量';
COMMENT ON COLUMN shipping.transport_distance IS '搬送距離';
COMMENT ON COLUMN shipping.delivery_date IS '納期';
COMMENT ON COLUMN shipping.transport_period IS '搬送期間';
COMMENT ON COLUMN shipping.ship_request_date IS '出荷依頼日';
COMMENT ON COLUMN shipping.ship_date IS '出荷日';
COMMENT ON COLUMN shipping.ship_time IS '出荷時刻';
COMMENT ON COLUMN shipping.accept_date IS '検収日';
COMMENT ON COLUMN shipping.transport_cost IS '運送費';
COMMENT ON COLUMN shipping.accept_amount IS '検収金額';

CREATE TABLE sales_receivable (
	customer_code	char(8),
	invoice_customer_code	char(8),
	sales_emp_code	char(8),
	order_type_code	char(8),
	order_number	char(16),
	customer_purchase_order_number	char(16),
	ship_type_code	char(8),
	ship_number	char(16),
	item_code	char(8),
	order_quantity	decimal(18),
	delivery_quantity	decimal(18),
	ship_date	date,
	sales_recording_date	date,
	sales_slip_flag	char(1),
	order_unit_price	decimal(18),
	passed_quantity	decimal(18),
	rejected_quantity	decimal(18),
	barely_passed_quantity	decimal(18),
	barely_passed_unit_price	decimal(18),
	discount_amount	decimal(18),
	accept_total_amount	decimal(18),
	receivable_recording_date	date,
	invoice_issue_date	date,
	PRIMARY KEY (order_number ship_number)
);

COMMENT ON TABLE sales_receivable IS '売上売掛';
COMMENT ON COLUMN sales_receivable.customer_code IS '得意先コード';
COMMENT ON COLUMN sales_receivable.invoice_customer_code IS '請求先コード';
COMMENT ON COLUMN sales_receivable.sales_emp_code IS '営業担当者コード';
COMMENT ON COLUMN sales_receivable.order_type_code IS '受注種別コード';
COMMENT ON COLUMN sales_receivable.order_number IS '受注番号';
COMMENT ON COLUMN sales_receivable.customer_purchase_order_number IS '得意先発注番号';
COMMENT ON COLUMN sales_receivable.ship_type_code IS '出荷種別コード';
COMMENT ON COLUMN sales_receivable.ship_number IS '出荷番号';
COMMENT ON COLUMN sales_receivable.item_code IS '品目コード';
COMMENT ON COLUMN sales_receivable.order_quantity IS '受注数';
COMMENT ON COLUMN sales_receivable.delivery_quantity IS '納入数';
COMMENT ON COLUMN sales_receivable.ship_date IS '出荷日';
COMMENT ON COLUMN sales_receivable.sales_recording_date IS '売上計上日';
COMMENT ON COLUMN sales_receivable.sales_slip_flag IS '売上伝票要否フラグ';
COMMENT ON COLUMN sales_receivable.order_unit_price IS '受注単価';
COMMENT ON COLUMN sales_receivable.passed_quantity IS '検収合格数量';
COMMENT ON COLUMN sales_receivable.rejected_quantity IS '不合格数量';
COMMENT ON COLUMN sales_receivable.barely_passed_quantity IS '特採数';
COMMENT ON COLUMN sales_receivable.barely_passed_unit_price IS '特採単価';
COMMENT ON COLUMN sales_receivable.discount_amount IS '値引額';
COMMENT ON COLUMN sales_receivable.accept_total_amount IS '検収合計金額';
COMMENT ON COLUMN sales_receivable.receivable_recording_date IS '売掛計上日';
COMMENT ON COLUMN sales_receivable.invoice_issue_date IS '請求書発行日';

CREATE TABLE receivable_balance (
	customer_code	char(8),
	year_month	char(6),
	sales_emp_code	char(8),
	previous_carryover_balance	decimal(18),
	invoice_amount	decimal(18),
	consumption_tax_recieved	decimal(18),
	payable_offset_amount	decimal(18),
	net_deposit_planned_amount	decimal(18),
	cash_deposit_planned_amount	decimal(18),
	bill_deposit_planned_amount	decimal(18),
	deposit_date	date,
	cash_deposit_amount	decimal(18),
	bill_deposit_total_amount	decimal(18),
	bill_average_site	decimal(3),
	next_carryover_balance	decimal(18),
	PRIMARY KEY (customer_code year_month)
);

COMMENT ON TABLE receivable_balance IS '売掛残高';
COMMENT ON COLUMN receivable_balance.customer_code IS '得意先コード';
COMMENT ON COLUMN receivable_balance.year_month IS '対象年月度';
COMMENT ON COLUMN receivable_balance.sales_emp_code IS '営業担当者コード';
COMMENT ON COLUMN receivable_balance.previous_carryover_balance IS '前月繰越残高';
COMMENT ON COLUMN receivable_balance.invoice_amount IS '当月請求金額';
COMMENT ON COLUMN receivable_balance.consumption_tax_recieved IS '受取消費税';
COMMENT ON COLUMN receivable_balance.payable_offset_amount IS '買掛金相殺額';
COMMENT ON COLUMN receivable_balance.net_deposit_planned_amount IS '差引入金予定金額';
COMMENT ON COLUMN receivable_balance.cash_deposit_planned_amount IS '現金入金予定金額';
COMMENT ON COLUMN receivable_balance.bill_deposit_planned_amount IS '手形入金予定金額';
COMMENT ON COLUMN receivable_balance.deposit_date IS '入金日';
COMMENT ON COLUMN receivable_balance.cash_deposit_amount IS '現金入金額';
COMMENT ON COLUMN receivable_balance.bill_deposit_total_amount IS '手形入金合計額';
COMMENT ON COLUMN receivable_balance.bill_average_site IS '手形平均サイト';
COMMENT ON COLUMN receivable_balance.next_carryover_balance IS '次月繰越残高';

CREATE TABLE m_deposit_type (
	deposit_type_code	char(8),
	deposit_type_name	varchar(64),
	PRIMARY KEY (deposit_type_code)
);

COMMENT ON TABLE m_deposit_type IS '入金種別マスタ';
COMMENT ON COLUMN m_deposit_type.deposit_type_code IS '入金種別コード';
COMMENT ON COLUMN m_deposit_type.deposit_type_name IS '入金種別名';

CREATE TABLE deposit_schedule (
	customer_code	char(8),
	sales_emp_code	char(8),
	deposit_plan_date	date,
	deposit_type_code	char(8),
	deposit_planned_amount	decimal(18),
	bill_payment_due_date	date,
	PRIMARY KEY (customer_code deposit_plan_date)
);

COMMENT ON TABLE deposit_schedule IS '入金予定';
COMMENT ON COLUMN deposit_schedule.customer_code IS '得意先コード';
COMMENT ON COLUMN deposit_schedule.sales_emp_code IS '営業担当者コード';
COMMENT ON COLUMN deposit_schedule.deposit_plan_date IS '入金予定日';
COMMENT ON COLUMN deposit_schedule.deposit_type_code IS '入金種別コード';
COMMENT ON COLUMN deposit_schedule.deposit_planned_amount IS '入金予定額';
COMMENT ON COLUMN deposit_schedule.bill_payment_due_date IS '手形決済期日';

CREATE TABLE receivable_eval (
	customer_code	char(8),
	eval_year_month	char(6),
	sales_emp_code	char(8),
	deposit_plan_date	date,
	deposit_date	date,
	receivable_amount	decimal(18),
	payable_offset_amount	decimal(18),
	cash_deposit_amount	decimal(18),
	bill_deposit_amount	decimal(18),
	bill_average_site	decimal(3),
	PRIMARY KEY (customer_code eval_year_month)
);

COMMENT ON TABLE receivable_eval IS '売掛評価';
COMMENT ON COLUMN receivable_eval.customer_code IS '得意先コード';
COMMENT ON COLUMN receivable_eval.eval_year_month IS '評価年月度';
COMMENT ON COLUMN receivable_eval.sales_emp_code IS '営業担当者コード';
COMMENT ON COLUMN receivable_eval.deposit_plan_date IS '入金予定日';
COMMENT ON COLUMN receivable_eval.deposit_date IS '入金日';
COMMENT ON COLUMN receivable_eval.receivable_amount IS '売掛金';
COMMENT ON COLUMN receivable_eval.payable_offset_amount IS '買掛金相殺額';
COMMENT ON COLUMN receivable_eval.cash_deposit_amount IS '現金入金';
COMMENT ON COLUMN receivable_eval.bill_deposit_amount IS '手形入金';
COMMENT ON COLUMN receivable_eval.bill_average_site IS '手形平均サイト';

CREATE TABLE payable_balance (
	payout_partner_code	char(8),
	year_month	char(6),
	previous_carryover_balance	decimal(18),
	accept_amount	decimal(18),
	consumption_tax_payable	decimal(18),
	sales_material_cost	decimal(18),
	consumption_tax_recieved	decimal(18),
	receivable_offset_amount	decimal(18),
	net_payment_planned_amount	decimal(18),
	cash_payment_planned_amount	decimal(18),
	bill_payment_planned_amount	decimal(18),
	cash_payment_amount	decimal(18),
	bill_payment_total_amount	decimal(18),
	bill_average_site	decimal(3),
	next_carryover_balance	decimal(18),
	PRIMARY KEY (payout_partner_code year_month)
);

COMMENT ON TABLE payable_balance IS '買掛残高';
COMMENT ON COLUMN payable_balance.payout_partner_code IS '支払先コード';
COMMENT ON COLUMN payable_balance.year_month IS '対象年月度';
COMMENT ON COLUMN payable_balance.previous_carryover_balance IS '前月繰越残高';
COMMENT ON COLUMN payable_balance.accept_amount IS '当月検収金額';
COMMENT ON COLUMN payable_balance.consumption_tax_payable IS '支払消費税';
COMMENT ON COLUMN payable_balance.sales_material_cost IS '売上材料費';
COMMENT ON COLUMN payable_balance.consumption_tax_recieved IS '受取消費税';
COMMENT ON COLUMN payable_balance.receivable_offset_amount IS '売掛金相殺金額';
COMMENT ON COLUMN payable_balance.net_payment_planned_amount IS '差引支払予定金額';
COMMENT ON COLUMN payable_balance.cash_payment_planned_amount IS '現金支払予定金額';
COMMENT ON COLUMN payable_balance.bill_payment_planned_amount IS '手形支払予定金額';
COMMENT ON COLUMN payable_balance.cash_payment_amount IS '現金支払金額';
COMMENT ON COLUMN payable_balance.bill_payment_total_amount IS '手形支払合計金額';
COMMENT ON COLUMN payable_balance.bill_average_site IS '手形平均サイト';
COMMENT ON COLUMN payable_balance.next_carryover_balance IS '次月繰越残高';

CREATE TABLE m_payment_type (
	payment_type_code	char(8),
	payment_type_name	varchar(64),
	PRIMARY KEY (payment_type_code)
);

COMMENT ON TABLE m_payment_type IS '支払種別マスタ';
COMMENT ON COLUMN m_payment_type.payment_type_code IS '支払種別コード';
COMMENT ON COLUMN m_payment_type.payment_type_name IS '支払種別名';

CREATE TABLE payment_schedule (
	payout_partner_code	char(8),
	payment_plan_date	date,
	payment_type_code	char(8),
	payment_amount	decimal(18),
	bill_mgmt_number	char(16),
	bill_payment_due_date	date,
	PRIMARY KEY (payout_partner_code payment_plan_date payment_type_code)
);

COMMENT ON TABLE payment_schedule IS '支払予定';
COMMENT ON COLUMN payment_schedule.payout_partner_code IS '支払先コード';
COMMENT ON COLUMN payment_schedule.payment_plan_date IS '支払予定日';
COMMENT ON COLUMN payment_schedule.payment_type_code IS '支払種別コード';
COMMENT ON COLUMN payment_schedule.payment_amount IS '支払額';
COMMENT ON COLUMN payment_schedule.bill_mgmt_number IS '手形管理番号';
COMMENT ON COLUMN payment_schedule.bill_payment_due_date IS '手形決済期日';

CREATE TABLE m_bank_account_type (
	bank_account_type_code	char(8),
	bank_account_type_name	varchar(64),
	PRIMARY KEY (bank_account_type_code)
);

COMMENT ON TABLE m_bank_account_type IS '銀行口座種別マスタ';
COMMENT ON COLUMN m_bank_account_type.bank_account_type_code IS '銀行口座種別コード';
COMMENT ON COLUMN m_bank_account_type.bank_account_type_name IS '銀行口座種別名';

CREATE TABLE transfer_request (
	transfer_request_number	char(16),
	Payment date	date,
	payout_bank_code	char(8),
	payout_bank_account_type_code	char(8),
	payout_account_number	char(16),
	Remittance bank code	char(8),
	Payee name	varchar(64),
	transfer_bank_account_type_code	char(8),
	transfer_account_number	char(16),
	transfer_amount	decimal(18),
	Transfer fee	decimal(18),
	PRIMARY KEY (transfer_request_number)
);

COMMENT ON TABLE transfer_request IS '振込依頼';
COMMENT ON COLUMN transfer_request.transfer_request_number IS '振込依頼番号';
COMMENT ON COLUMN transfer_request.Payment date IS '支払日';
COMMENT ON COLUMN transfer_request.payout_bank_code IS '払出銀行コード';
COMMENT ON COLUMN transfer_request.payout_bank_account_type_code IS '払出銀行口座種別コード';
COMMENT ON COLUMN transfer_request.payout_account_number IS '払出口座番号';
COMMENT ON COLUMN transfer_request.Remittance bank code IS '振込銀行コード';
COMMENT ON COLUMN transfer_request.Payee name IS '振込先名';
COMMENT ON COLUMN transfer_request.transfer_bank_account_type_code IS '振込銀行口座種別コード';
COMMENT ON COLUMN transfer_request.transfer_account_number IS '振込口座番号';
COMMENT ON COLUMN transfer_request.transfer_amount IS '振込金額';
COMMENT ON COLUMN transfer_request.Transfer fee IS '振込手数料';

CREATE TABLE m_bill_type (
	bill_type_code	char(8),
	bill_type_name	varchar(64),
	PRIMARY KEY (bill_type_code)
);

COMMENT ON TABLE m_bill_type IS '手形種別マスタ';
COMMENT ON COLUMN m_bill_type.bill_type_code IS '手形種別コード';
COMMENT ON COLUMN m_bill_type.bill_type_name IS '手形種別名';

CREATE TABLE m_bill_issuing_class (
	bill_issuing_class_code	char(8),
	bill_issuing_class_name	varchar(64),
	PRIMARY KEY (bill_issuing_class_code)
);

COMMENT ON TABLE m_bill_issuing_class IS '手形発生区分マスタ';
COMMENT ON COLUMN m_bill_issuing_class.bill_issuing_class_code IS '手形発生区分コード';
COMMENT ON COLUMN m_bill_issuing_class.bill_issuing_class_name IS '手形発生区分名';

CREATE TABLE m_bill_status_class (
	bill_status_class_code	char(8),
	bill_status_class_name	varchar(64),
	PRIMARY KEY (bill_status_class_code)
);

COMMENT ON TABLE m_bill_status_class IS '手形状態区分マスタ';
COMMENT ON COLUMN m_bill_status_class.bill_status_class_code IS '手形状態区分コード';
COMMENT ON COLUMN m_bill_status_class.bill_status_class_name IS '手形状態区分名';

CREATE TABLE m_bill_payout_class (
	bill_payout_class_code	char(8),
	bill_payout_class_name	varchar(64),
	PRIMARY KEY (bill_payout_class_code)
);

COMMENT ON TABLE m_bill_payout_class IS '手形払出区分マスタ';
COMMENT ON COLUMN m_bill_payout_class.bill_payout_class_code IS '手形払出区分コード';
COMMENT ON COLUMN m_bill_payout_class.bill_payout_class_name IS '手形払出区分名';

CREATE TABLE bill_mgmt (
	bill_mgmt_number	char(16),
	accounting_number	char(16),
	bill_type_code	char(8),
	bill_issuing_class_code	char(8),
	bill_status_class_code	char(8),
	bill_payer_code	char(8),
	submit_endorse_code	char(8),
	Submitter/Endorser Name	varchar(64),
	face_amount	decimal(18),
	submit_date	date,
	collect_due_date	date,
	payment_location_code	char(8),
	accept_account_code	char(8),
	accept_date	date,
	dishonor_date	date,
	bill_payout_class_code	char(8),
	payout_partner_code	char(8),
	payout_account_code	char(8),
	payout_date	date,
	PRIMARY KEY (bill_mgmt_number)
);

COMMENT ON TABLE bill_mgmt IS '手形管理';
COMMENT ON COLUMN bill_mgmt.bill_mgmt_number IS '手形管理番号';
COMMENT ON COLUMN bill_mgmt.accounting_number IS '経理番号';
COMMENT ON COLUMN bill_mgmt.bill_type_code IS '手形種別コード';
COMMENT ON COLUMN bill_mgmt.bill_issuing_class_code IS '手形発生区分コード';
COMMENT ON COLUMN bill_mgmt.bill_status_class_code IS '手形状態区分コード';
COMMENT ON COLUMN bill_mgmt.bill_payer_code IS '手形支払人コード';
COMMENT ON COLUMN bill_mgmt.submit_endorse_code IS '提出・裏書人コード';
COMMENT ON COLUMN bill_mgmt.Submitter/Endorser Name IS '提出・裏書人名';
COMMENT ON COLUMN bill_mgmt.face_amount IS '額面金額';
COMMENT ON COLUMN bill_mgmt.submit_date IS '提出日';
COMMENT ON COLUMN bill_mgmt.collect_due_date IS '取立期日';
COMMENT ON COLUMN bill_mgmt.payment_location_code IS '支払場所コード';
COMMENT ON COLUMN bill_mgmt.accept_account_code IS '受入相手勘定科目コード';
COMMENT ON COLUMN bill_mgmt.accept_date IS '受入日';
COMMENT ON COLUMN bill_mgmt.dishonor_date IS '不渡発生日';
COMMENT ON COLUMN bill_mgmt.bill_payout_class_code IS '手形払出区分コード';
COMMENT ON COLUMN bill_mgmt.payout_partner_code IS '払出先コード';
COMMENT ON COLUMN bill_mgmt.payout_account_code IS '払出相手勘定科目コード';
COMMENT ON COLUMN bill_mgmt.payout_date IS '払出日';

CREATE TABLE m_asset_status_class (
	asset_status_class_code	char(8),
	asset_status_class_name	varchar(64),
	PRIMARY KEY (asset_status_class_code)
);

COMMENT ON TABLE m_asset_status_class IS '資産状態区分マスタ';
COMMENT ON COLUMN m_asset_status_class.asset_status_class_code IS '資産状態区分コード';
COMMENT ON COLUMN m_asset_status_class.asset_status_class_name IS '資産状態区分名';

CREATE TABLE m_depreciate_type (
	depreciate_type_code	char(8),
	depreciate_type_name	varchar(64),
	PRIMARY KEY (depreciate_type_code)
);

COMMENT ON TABLE m_depreciate_type IS '償却種別マスタ';
COMMENT ON COLUMN m_depreciate_type.depreciate_type_code IS '償却種別コード';
COMMENT ON COLUMN m_depreciate_type.depreciate_type_name IS '償却種別名';

CREATE TABLE m_depreciate_calc_method (
	depreciate_calc_method_code	char(8),
	depreciate_calc_method_name	varchar(64),
	PRIMARY KEY (depreciate_calc_method_code)
);

COMMENT ON TABLE m_depreciate_calc_method IS '償却計算方法マスタ';
COMMENT ON COLUMN m_depreciate_calc_method.depreciate_calc_method_code IS '償却計算方法コード';
COMMENT ON COLUMN m_depreciate_calc_method.depreciate_calc_method_name IS '償却計算方法名';

CREATE TABLE m_asset_payout_class (
	asset_payout_class_code	char(8),
	asset_payout_class_name	varchar(64),
	PRIMARY KEY (asset_payout_class_code)
);

COMMENT ON TABLE m_asset_payout_class IS '資産払出区分マスタ';
COMMENT ON COLUMN m_asset_payout_class.asset_payout_class_code IS '資産払出区分コード';
COMMENT ON COLUMN m_asset_payout_class.asset_payout_class_name IS '資産払出区分名';

CREATE TABLE depreciable_asset (
	asset_mgmt_number	char(16),
	asset_type_code	char(8),
	item_code	char(8),
	asset_name	varchar(64),
	purpose	varchar(64),
	dept_code	char(8),
	asset_location	varchar(64),
	asset_status_class_code	char(8),
	supplier_code	char(8),
	manufacturer_name	varchar(64),
	main_unit_acquire_amount	decimal(18),
	additional_amount	decimal(18),
	depreciate_limit_amount	decimal(18),
	legal_residual_amount	decimal(18),
	service_life	decimal(3),
	depreciate_type_code	char(8),
	special_depreciate_formula	varchar(256),
	depreciate_calc_method_code	char(8),
	straight_line_depreciate_rate	decimal(5,2),
	fixed_rate_depreciate_rate	decimal(5,2),
	acquire_date	date,
	suspend_date	date,
	beginning_book_value	decimal(18),
	depreciate_amount	decimal(18),
	ending_book_value	decimal(18),
	depreciate_total_amount	decimal(18),
	depreciate_date	date,
	next_monthly_depreciate_amount	decimal(18),
	next_monthly_depreciate_total_amount	decimal(18),
	asset_payout_class_code	char(8),
	payout_partner_code	char(8),
	payout_date	date,
	PRIMARY KEY (asset_mgmt_number)
);

COMMENT ON TABLE depreciable_asset IS '償却資産';
COMMENT ON COLUMN depreciable_asset.asset_mgmt_number IS '資産管理番号';
COMMENT ON COLUMN depreciable_asset.asset_type_code IS '資産種別コード';
COMMENT ON COLUMN depreciable_asset.item_code IS '品目コード';
COMMENT ON COLUMN depreciable_asset.asset_name IS '資産名';
COMMENT ON COLUMN depreciable_asset.purpose IS '用途';
COMMENT ON COLUMN depreciable_asset.dept_code IS '利用部門コード';
COMMENT ON COLUMN depreciable_asset.asset_location IS '設置保管場所';
COMMENT ON COLUMN depreciable_asset.asset_status_class_code IS '資産状態区分コード';
COMMENT ON COLUMN depreciable_asset.supplier_code IS '仕入先コード';
COMMENT ON COLUMN depreciable_asset.manufacturer_name IS 'メーカー名';
COMMENT ON COLUMN depreciable_asset.main_unit_acquire_amount IS '本体取得価額';
COMMENT ON COLUMN depreciable_asset.additional_amount IS '付帯価額';
COMMENT ON COLUMN depreciable_asset.depreciate_limit_amount IS '減価償却限度額';
COMMENT ON COLUMN depreciable_asset.legal_residual_amount IS '法定残存価額';
COMMENT ON COLUMN depreciable_asset.service_life IS '耐用年数';
COMMENT ON COLUMN depreciable_asset.depreciate_type_code IS '償却種別コード';
COMMENT ON COLUMN depreciable_asset.special_depreciate_formula IS '特別割増償却計算式';
COMMENT ON COLUMN depreciable_asset.depreciate_calc_method_code IS '償却計算方法コード';
COMMENT ON COLUMN depreciable_asset.straight_line_depreciate_rate IS '定額償却率';
COMMENT ON COLUMN depreciable_asset.fixed_rate_depreciate_rate IS '定率償却率';
COMMENT ON COLUMN depreciable_asset.acquire_date IS '取得日';
COMMENT ON COLUMN depreciable_asset.suspend_date IS '休止日';
COMMENT ON COLUMN depreciable_asset.beginning_book_value IS '期首帳簿価額';
COMMENT ON COLUMN depreciable_asset.depreciate_amount IS '当期減価償却費';
COMMENT ON COLUMN depreciable_asset.ending_book_value IS '期末帳簿価額';
COMMENT ON COLUMN depreciable_asset.depreciate_total_amount IS '償却費累計額';
COMMENT ON COLUMN depreciable_asset.depreciate_date IS '償却実施日';
COMMENT ON COLUMN depreciable_asset.next_monthly_depreciate_amount IS '次期月次償却額';
COMMENT ON COLUMN depreciable_asset.next_monthly_depreciate_total_amount IS '次期月次償却累計額';
COMMENT ON COLUMN depreciable_asset.asset_payout_class_code IS '資産払出区分コード';
COMMENT ON COLUMN depreciable_asset.payout_partner_code IS '払出先コード';
COMMENT ON COLUMN depreciable_asset.payout_date IS '払出日';

CREATE TABLE m_deduct_type (
	deduct_type_code	char(8),
	deduct_type_name	varchar(64),
	PRIMARY KEY (deduct_type_code)
);

COMMENT ON TABLE m_deduct_type IS '控除種別マスタ';
COMMENT ON COLUMN m_deduct_type.deduct_type_code IS '控除種別コード';
COMMENT ON COLUMN m_deduct_type.deduct_type_name IS '控除種別名';

CREATE TABLE m_deduct_time_class (
	deduct_time_class_code	char(8),
	deduct_time_class_name	varchar(64),
	PRIMARY KEY (deduct_time_class_code)
);

COMMENT ON TABLE m_deduct_time_class IS '控除時期区分マスタ';
COMMENT ON COLUMN m_deduct_time_class.deduct_time_class_code IS '控除時期区分コード';
COMMENT ON COLUMN m_deduct_time_class.deduct_time_class_name IS '控除時期区分名';

CREATE TABLE m_deduction (
	emp_code	char(8),
	deduct_type_code	char(8),
	deduct_time_class_code	char(8),
	start_date	date,
	end_date	date,
	fixed_deduction_amount	decimal(18),
	first_variable_deduction_amount	decimal(18),
	final_variable_deduction_amount	decimal(18),
	loan_repayment_total_amount	decimal(18),
	loan_balance	decimal(18),
	loan_rate	decimal(5,2),
	PRIMARY KEY (emp_code deduct_type_code deduct_time_class_code start_date)
);

COMMENT ON TABLE m_deduction IS '継続控除マスタ';
COMMENT ON COLUMN m_deduction.emp_code IS '従業員コード';
COMMENT ON COLUMN m_deduction.deduct_type_code IS '控除種別コード';
COMMENT ON COLUMN m_deduction.deduct_time_class_code IS '控除時期区分コード';
COMMENT ON COLUMN m_deduction.start_date IS '控除開始日';
COMMENT ON COLUMN m_deduction.end_date IS '控除終了日';
COMMENT ON COLUMN m_deduction.fixed_deduction_amount IS '定額控除額';
COMMENT ON COLUMN m_deduction.first_variable_deduction_amount IS '初回変動控除額';
COMMENT ON COLUMN m_deduction.final_variable_deduction_amount IS '最終回変動控除額';
COMMENT ON COLUMN m_deduction.loan_repayment_total_amount IS '貸付金返済累計額';
COMMENT ON COLUMN m_deduction.loan_balance IS '貸付残高';
COMMENT ON COLUMN m_deduction.loan_rate IS '貸付利率';

CREATE TABLE salary_deduct (
	emp_code	char(8),
	deduct_date	date,
	deduct_type_code	char(8),
	deduction_amount	decimal(18),
	PRIMARY KEY (emp_code deduct_date deduct_type_code)
);

COMMENT ON TABLE salary_deduct IS '給与控除';
COMMENT ON COLUMN salary_deduct.emp_code IS '従業員コード';
COMMENT ON COLUMN salary_deduct.deduct_date IS '控除日';
COMMENT ON COLUMN salary_deduct.deduct_type_code IS '控除種別コード';
COMMENT ON COLUMN salary_deduct.deduction_amount IS '控除額';

CREATE TABLE m_salary_type (
	salary_type_code	char(8),
	salary_type_name	varchar(64),
	PRIMARY KEY (salary_type_code)
);

COMMENT ON TABLE m_salary_type IS '給与支給種別マスタ';
COMMENT ON COLUMN m_salary_type.salary_type_code IS '給与支給種別コード';
COMMENT ON COLUMN m_salary_type.salary_type_name IS '給与支給種別名';

CREATE TABLE m_emp_class (
	emp_class_code	char(8),
	emp_class_name	varchar(64),
	PRIMARY KEY (emp_class_code)
);

COMMENT ON TABLE m_emp_class IS '社員区分マスタ';
COMMENT ON COLUMN m_emp_class.emp_class_code IS '社員区分コード';
COMMENT ON COLUMN m_emp_class.emp_class_name IS '社員区分名';

CREATE TABLE pay_slip (
	dept_code	char(8),
	emp_code	char(8),
	salary_type_code	char(8),
	payment_date	date,
	emp_class_code	char(8),
	basic_salary	decimal(18),
	annual_salary_amount	decimal(18),
	job_salary	decimal(18),
	title_position_allowance	decimal(18),
	qualification_salary	decimal(18),
	perfect_attendance_allowance	decimal(18),
	dependent_allowance	decimal(18),
	other_allowances	decimal(18),
	prepaid_expenses	decimal(18),
	overtime_hours	decimal(5,2),
	late_night_hours	decimal(5,2),
	shift_work_count	decimal(2),
	overtime_allowance	decimal(18),
	late_night_hours	decimal(5,2),
	shift_work_allowance	decimal(18),
	paid_vacation_days	decimal(5,2),
	special_leave_days	decimal(5,2),
	absent_days	decimal(5,2),
	late_early_counts	decimal(2),
	late_early_hours	decimal(5,2),
	salary_cut_amount	decimal(18),
	payment_tatal_amount	decimal(18),
	employee_pension_insurance	decimal(18),
	health_insurance	decimal(18),
	employment_insurance	decimal(18),
	taxable_amount	decimal(18),
	withholding_income_tax	decimal(18),
	resident_tax	decimal(18),
	property_accumulation_savings	decimal(18),
	life_insurance	decimal(18),
	labor_union_dues	decimal(18),
	mutual_aid_membership_fees	decimal(18),
	prepaid_expense_deductions	decimal(18),
	loan_repayment_amount	decimal(18),
	loan_interest	decimal(18),
	net_payment_amount	decimal(18),
	PRIMARY KEY (emp_code salary_type_code payment_date)
);

COMMENT ON TABLE pay_slip IS '給与明細';
COMMENT ON COLUMN pay_slip.dept_code IS '部門コード';
COMMENT ON COLUMN pay_slip.emp_code IS '従業員コード';
COMMENT ON COLUMN pay_slip.salary_type_code IS '給与支給種別コード';
COMMENT ON COLUMN pay_slip.payment_date IS '支給日';
COMMENT ON COLUMN pay_slip.emp_class_code IS '社員区分コード';
COMMENT ON COLUMN pay_slip.basic_salary IS '基本給';
COMMENT ON COLUMN pay_slip.annual_salary_amount IS '年俸割額';
COMMENT ON COLUMN pay_slip.job_salary IS '職務給';
COMMENT ON COLUMN pay_slip.title_position_allowance IS '役席・職位手当';
COMMENT ON COLUMN pay_slip.qualification_salary IS '資格給';
COMMENT ON COLUMN pay_slip.perfect_attendance_allowance IS '精皆勤手当';
COMMENT ON COLUMN pay_slip.dependent_allowance IS '扶養家族手当';
COMMENT ON COLUMN pay_slip.other_allowances IS 'その他手当';
COMMENT ON COLUMN pay_slip.prepaid_expenses IS '前払費用';
COMMENT ON COLUMN pay_slip.overtime_hours IS '所定外時間数';
COMMENT ON COLUMN pay_slip.late_night_hours IS '深夜時間数';
COMMENT ON COLUMN pay_slip.shift_work_count IS '交替勤務回数';
COMMENT ON COLUMN pay_slip.overtime_allowance IS '所定外勤務手当';
COMMENT ON COLUMN pay_slip.late_night_hours IS '深夜時間数';
COMMENT ON COLUMN pay_slip.shift_work_allowance IS '交替勤務手当';
COMMENT ON COLUMN pay_slip.paid_vacation_days IS '有給休暇日数';
COMMENT ON COLUMN pay_slip.special_leave_days IS '特別休暇日数';
COMMENT ON COLUMN pay_slip.absent_days IS '欠勤日数';
COMMENT ON COLUMN pay_slip.late_early_counts IS '遅刻・早退回数';
COMMENT ON COLUMN pay_slip.late_early_hours IS '遅刻・早退時間数';
COMMENT ON COLUMN pay_slip.salary_cut_amount IS '給与カット額';
COMMENT ON COLUMN pay_slip.payment_tatal_amount IS '支給総額';
COMMENT ON COLUMN pay_slip.employee_pension_insurance IS '厚生年金保険料';
COMMENT ON COLUMN pay_slip.health_insurance IS '健康保険料';
COMMENT ON COLUMN pay_slip.employment_insurance IS '雇用保険料';
COMMENT ON COLUMN pay_slip.taxable_amount IS '課税対象額';
COMMENT ON COLUMN pay_slip.withholding_income_tax IS '源泉所得税';
COMMENT ON COLUMN pay_slip.resident_tax IS '住民税';
COMMENT ON COLUMN pay_slip.property_accumulation_savings IS '財形貯蓄';
COMMENT ON COLUMN pay_slip.life_insurance IS '生命保険料';
COMMENT ON COLUMN pay_slip.labor_union_dues IS '労働組合費';
COMMENT ON COLUMN pay_slip.mutual_aid_membership_fees IS '共済会費';
COMMENT ON COLUMN pay_slip.prepaid_expense_deductions IS '前払費用控除';
COMMENT ON COLUMN pay_slip.loan_repayment_amount IS '貸付金返済額';
COMMENT ON COLUMN pay_slip.loan_interest IS '貸付金利息';
COMMENT ON COLUMN pay_slip.net_payment_amount IS '差引支給額';

CREATE TABLE m_account_type_class (
	account_type_class_code	char(8),
	account_type_class_name	varchar(64),
	PRIMARY KEY (account_type_class_code)
);

COMMENT ON TABLE m_account_type_class IS '勘定種別分類マスタ';
COMMENT ON COLUMN m_account_type_class.account_type_class_code IS '勘定種別分類コード';
COMMENT ON COLUMN m_account_type_class.account_type_class_name IS '勘定種別分類名';

CREATE TABLE m_account_type (
	account_type_code	char(8),
	account_type_name	varchar(64),
	account_type_class_code	char(8),
	higher_account_type_code	char(8),
	PRIMARY KEY (account_type_code)
);

COMMENT ON TABLE m_account_type IS '勘定種別マスター';
COMMENT ON COLUMN m_account_type.account_type_code IS '勘定種別コード';
COMMENT ON COLUMN m_account_type.account_type_name IS '勘定種別名';
COMMENT ON COLUMN m_account_type.account_type_class_code IS '勘定種別分類コード';
COMMENT ON COLUMN m_account_type.higher_account_type_code IS '上位勘定種別コード';

CREATE TABLE m_account_detail_type (
	account_detail_type_code	char(8),
	account_detail_type_name	varchar(64),
	PRIMARY KEY (account_detail_type_code)
);

COMMENT ON TABLE m_account_detail_type IS '勘定口座種別マスタ';
COMMENT ON COLUMN m_account_detail_type.account_detail_type_code IS '勘定口座種別コード';
COMMENT ON COLUMN m_account_detail_type.account_detail_type_name IS '勘定口座種別名';

CREATE TABLE m_account (
	account_code	char(8),
	account_name	varchar(64),
	major_account_type_code	char(8),
	middle_account_type_code	char(8),
	small_account_type_code	char(8),
	detailed_account_type_code	char(8),
	account_detail_type_code	char(8),
	trial_balance_flag	char(1),
	balance_sheet_flag	char(1),
	profit_loss_sheet_flag	char(1),
	merged_account_code	char(8),
	PRIMARY KEY (account_code)
);

COMMENT ON TABLE m_account IS '勘定科目マスタ';
COMMENT ON COLUMN m_account.account_code IS '勘定科目コード';
COMMENT ON COLUMN m_account.account_name IS '勘定科目名';
COMMENT ON COLUMN m_account.major_account_type_code IS '大分類勘定種別コード';
COMMENT ON COLUMN m_account.middle_account_type_code IS '中分類勘定種別コード';
COMMENT ON COLUMN m_account.small_account_type_code IS '小分類勘定種別コード';
COMMENT ON COLUMN m_account.detailed_account_type_code IS '細分類勘定種別コード';
COMMENT ON COLUMN m_account.account_detail_type_code IS '借方・貸方勘定口座種別コード';
COMMENT ON COLUMN m_account.trial_balance_flag IS '合計残高試算表表示フラグ';
COMMENT ON COLUMN m_account.balance_sheet_flag IS '貸借対照表表示フラグ';
COMMENT ON COLUMN m_account.profit_loss_sheet_flag IS '損益計算書表示フラグ';
COMMENT ON COLUMN m_account.merged_account_code IS '併合先・勘定科目コード';

CREATE TABLE m_auto_journal_entry_type (
	auto_journal_entry_type_code	char(8),
	auto_journal_entry_type_name	varchar(64),
	PRIMARY KEY (auto_journal_entry_type_code)
);

COMMENT ON TABLE m_auto_journal_entry_type IS '自動仕訳種類マスタ';
COMMENT ON COLUMN m_auto_journal_entry_type.auto_journal_entry_type_code IS '自動仕訳種類コード';
COMMENT ON COLUMN m_auto_journal_entry_type.auto_journal_entry_type_name IS '自動仕訳種類名';

CREATE TABLE m_expense_account_class (
	expense_account_class_code	char(8),
	expense_account_class_name	varchar(64),
	PRIMARY KEY (expense_account_class_code)
);

COMMENT ON TABLE m_expense_account_class IS '費用勘定区分マスタ';
COMMENT ON COLUMN m_expense_account_class.expense_account_class_code IS '費用勘定区分コード';
COMMENT ON COLUMN m_expense_account_class.expense_account_class_name IS '費用勘定区分名';

CREATE TABLE journal_entry_lines (
	account_code	char(8),
	accounting_number	char(16),
	entry_date	date,
	auto_journal_entry_type_code	char(8),
	order_number	char(16),
	dept_code	char(8),
	expense_account_class_code	char(8),
	account_detail_type_code	char(8),
	account_detail_number	char(16),
	journal_entry_item_number	char(16),
	breakdown	varchar(64),
	debit_amount	decimal(18),
	credit_amount	decimal(18),
	counterpart_account_code	char(8),
	PRIMARY KEY (accounting_number)
);

COMMENT ON TABLE journal_entry_lines IS '仕訳明細';
COMMENT ON COLUMN journal_entry_lines.account_code IS '勘定科目コード';
COMMENT ON COLUMN journal_entry_lines.accounting_number IS '経理番号';
COMMENT ON COLUMN journal_entry_lines.entry_date IS '仕訳日';
COMMENT ON COLUMN journal_entry_lines.auto_journal_entry_type_code IS '自動仕訳種類コード';
COMMENT ON COLUMN journal_entry_lines.order_number IS 'オーダー番号';
COMMENT ON COLUMN journal_entry_lines.dept_code IS '部門コード';
COMMENT ON COLUMN journal_entry_lines.expense_account_class_code IS '費用勘定区分コード';
COMMENT ON COLUMN journal_entry_lines.account_detail_type_code IS '勘定口座種別コード';
COMMENT ON COLUMN journal_entry_lines.account_detail_number IS '勘定口座番号';
COMMENT ON COLUMN journal_entry_lines.journal_entry_item_number IS '仕訳内訳番号';
COMMENT ON COLUMN journal_entry_lines.breakdown IS '内訳';
COMMENT ON COLUMN journal_entry_lines.debit_amount IS '借方金額';
COMMENT ON COLUMN journal_entry_lines.credit_amount IS '貸方金額';
COMMENT ON COLUMN journal_entry_lines.counterpart_account_code IS '相手勘定科目コード';

CREATE TABLE m_journal_entry_item (
	journal_entry_item_number	char(16),
	breakdown	varchar(64),
	account_code	char(8),
	PRIMARY KEY (journal_entry_item_number)
);

COMMENT ON TABLE m_journal_entry_item IS '仕訳内訳マスタ';
COMMENT ON COLUMN m_journal_entry_item.journal_entry_item_number IS '仕訳内訳番号';
COMMENT ON COLUMN m_journal_entry_item.breakdown IS '内訳';
COMMENT ON COLUMN m_journal_entry_item.account_code IS '勘定科目コード';

CREATE TABLE account_detail_balance (
	account_detail_balance_number	decimal(18),
	account_code	char(8),
	account_detail_type_code	char(8),
	account_detail_number	char(16),
	detail_number	char(16),
	year_month	char(6),
	previous_debit_carryover_balance	decimal(18),
	previous_credit_carryover_balance	decimal(18),
	debit_amount	decimal(18),
	credit_amount	decimal(18),
	next_debit_carryover_balance	decimal(18),
	next_credit_carryover_balance	decimal(18),
	PRIMARY KEY (account_detail_balance_number)
);

COMMENT ON TABLE account_detail_balance IS '口座残高';
COMMENT ON COLUMN account_detail_balance.account_detail_balance_number IS '口座残高番号';
COMMENT ON COLUMN account_detail_balance.account_code IS '勘定科目コード';
COMMENT ON COLUMN account_detail_balance.account_detail_type_code IS '勘定口座種別コード';
COMMENT ON COLUMN account_detail_balance.account_detail_number IS '勘定口座番号';
COMMENT ON COLUMN account_detail_balance.detail_number IS '内訳番号';
COMMENT ON COLUMN account_detail_balance.year_month IS '対象年月';
COMMENT ON COLUMN account_detail_balance.previous_debit_carryover_balance IS '前月借方繰越残高';
COMMENT ON COLUMN account_detail_balance.previous_credit_carryover_balance IS '前月貸方繰越残高';
COMMENT ON COLUMN account_detail_balance.debit_amount IS '当月借方金額';
COMMENT ON COLUMN account_detail_balance.credit_amount IS '当月貸方金額';
COMMENT ON COLUMN account_detail_balance.next_debit_carryover_balance IS '次月借方繰越残高';
COMMENT ON COLUMN account_detail_balance.next_credit_carryover_balance IS '次月貸方繰越残高';

CREATE TABLE account_balance (
	account_code	char(8),
	year_month	char(6),
	beginning_debit_balance	decimal(18),
	beginning_credit_balance	decimal(18),
	previous_debit_carryover_balance	decimal(18),
	previous_credit_carryover_balance	decimal(18),
	debit_amount	decimal(18),
	credit_amount	decimal(18),
	next_debit_carryover_balance	decimal(18),
	next_credit_carryover_balance	decimal(18),
	PRIMARY KEY (account_code year_month)
);

COMMENT ON TABLE account_balance IS '科目残高';
COMMENT ON COLUMN account_balance.account_code IS '勘定科目コード';
COMMENT ON COLUMN account_balance.year_month IS '対象年月';
COMMENT ON COLUMN account_balance.beginning_debit_balance IS '期首借方残高';
COMMENT ON COLUMN account_balance.beginning_credit_balance IS '期首貸方残高';
COMMENT ON COLUMN account_balance.previous_debit_carryover_balance IS '前月借方繰越残高';
COMMENT ON COLUMN account_balance.previous_credit_carryover_balance IS '前月貸方繰越残高';
COMMENT ON COLUMN account_balance.debit_amount IS '当月借方金額';
COMMENT ON COLUMN account_balance.credit_amount IS '当月貸方金額';
COMMENT ON COLUMN account_balance.next_debit_carryover_balance IS '次月借方繰越残高';
COMMENT ON COLUMN account_balance.next_credit_carryover_balance IS '次月貸方繰越残高';

CREATE TABLE expense_account (
	expense_incurred_date	date,
	expense_account_class_code	char(8),
	order_number	char(16),
	dept_code	char(8),
	account_code	char(8),
	expense_code	char(8),
	parts_rank_code	char(8),
	proc_code	char(8),
	proc_rank_code	char(8),
	result_quantity	decimal(18),
	setup_time	decimal(18),
	unit_proc_time	decimal(18),
	result_time	decimal(18),
	proc_cost	decimal(18),
	cost_difference	decimal(18),
	budget_unit_price	decimal(18),
	accept_amount	decimal(18),
	PRIMARY KEY (expense_incurred_date expense_account_class_code order_number)
);

COMMENT ON TABLE expense_account IS '費用勘定';
COMMENT ON COLUMN expense_account.expense_incurred_date IS '費用発生日';
COMMENT ON COLUMN expense_account.expense_account_class_code IS '費用勘定区分コード';
COMMENT ON COLUMN expense_account.order_number IS 'オーダー番号';
COMMENT ON COLUMN expense_account.dept_code IS '部門コード';
COMMENT ON COLUMN expense_account.account_code IS '勘定科目コード';
COMMENT ON COLUMN expense_account.expense_code IS '費用コード';
COMMENT ON COLUMN expense_account.parts_rank_code IS '部品ランクコード';
COMMENT ON COLUMN expense_account.proc_code IS '工程コード';
COMMENT ON COLUMN expense_account.proc_rank_code IS '工程ランクコード';
COMMENT ON COLUMN expense_account.result_quantity IS '実績数量';
COMMENT ON COLUMN expense_account.setup_time IS '段取時間';
COMMENT ON COLUMN expense_account.unit_proc_time IS '単位当り加工時間';
COMMENT ON COLUMN expense_account.result_time IS '実績時間';
COMMENT ON COLUMN expense_account.proc_cost IS '加工費';
COMMENT ON COLUMN expense_account.cost_difference IS '原価差額';
COMMENT ON COLUMN expense_account.budget_unit_price IS '予算単価';
COMMENT ON COLUMN expense_account.accept_amount IS '検収金額';

CREATE TABLE m_alloc_basis_type (
	alloc_basis_type_code	char(8),
	alloc_basis_type_name	varchar(64),
	PRIMARY KEY (alloc_basis_type_code)
);

COMMENT ON TABLE m_alloc_basis_type IS '配賦基準種別マスタ';
COMMENT ON COLUMN m_alloc_basis_type.alloc_basis_type_code IS '配賦基準種別コード';
COMMENT ON COLUMN m_alloc_basis_type.alloc_basis_type_name IS '配賦基準種別名';

CREATE TABLE m_alloc_basis (
	alloc_basis_number	decimal(18),
	common_cost_dept_code	char(8),
	alloc_account_code	char(8),
	alloc_dept_code	char(8),
	alloc_basis_type_code	char(8),
	alloc_denominator	decimal(18),
	alloc_numerator	decimal(18),
	PRIMARY KEY (alloc_basis_number)
);

COMMENT ON TABLE m_alloc_basis IS '配賦基準マスタ';
COMMENT ON COLUMN m_alloc_basis.alloc_basis_number IS '配賦基準番号';
COMMENT ON COLUMN m_alloc_basis.common_cost_dept_code IS '共通費識別部門コード';
COMMENT ON COLUMN m_alloc_basis.alloc_account_code IS '配賦対象・勘定科目コード';
COMMENT ON COLUMN m_alloc_basis.alloc_dept_code IS '配賦先部門コード';
COMMENT ON COLUMN m_alloc_basis.alloc_basis_type_code IS '配賦基準種別コード';
COMMENT ON COLUMN m_alloc_basis.alloc_denominator IS '配賦分母数値';
COMMENT ON COLUMN m_alloc_basis.alloc_numerator IS '配賦分子数値';

CREATE TABLE budget_mgmt (
	budget_year_month	char(6),
	dept_code	char(8),
	account_code	char(8),
	planned_amount	decimal(18),
	result_amount	decimal(18),
	PRIMARY KEY (budget_year_month dept_code account_code)
);

COMMENT ON TABLE budget_mgmt IS '予算管理';
COMMENT ON COLUMN budget_mgmt.budget_year_month IS '予算年月';
COMMENT ON COLUMN budget_mgmt.dept_code IS '部門コード';
COMMENT ON COLUMN budget_mgmt.account_code IS '勘定科目コード';
COMMENT ON COLUMN budget_mgmt.planned_amount IS '予定金額';
COMMENT ON COLUMN budget_mgmt.result_amount IS '実績金額';

CREATE TABLE expense_total (
	cost_incurre_year_month	char(6),
	previous_product_inv_balance	decimal(18),
	previous_wip_cost	decimal(18),
	product_cost	decimal(18),
	sales_cost	decimal(18),
	current_wip_cost	decimal(18),
	current_product_inv_balance	decimal(18),
	direct_labor_cost	decimal(18),
	PRIMARY KEY (cost_incurre_year_month)
);

COMMENT ON TABLE expense_total IS '費用合計';
COMMENT ON COLUMN expense_total.cost_incurre_year_month IS '費用発生年月';
COMMENT ON COLUMN expense_total.previous_product_inv_balance IS '前月末製品在庫高';
COMMENT ON COLUMN expense_total.previous_wip_cost IS '前月末仕掛原価';
COMMENT ON COLUMN expense_total.product_cost IS '当月製造原価';
COMMENT ON COLUMN expense_total.sales_cost IS '当月売上原価';
COMMENT ON COLUMN expense_total.current_wip_cost IS '当月仕掛原価';
COMMENT ON COLUMN expense_total.current_product_inv_balance IS '当月末製品在庫高';
COMMENT ON COLUMN expense_total.direct_labor_cost IS '直接労務費';

CREATE TABLE dept_direct_labor_cost (
	cost_incurre_year_month	char(6),
	dept_code	char(8),
	direct_labor_cost	decimal(18),
	PRIMARY KEY (cost_incurre_year_month dept_code)
);

COMMENT ON TABLE dept_direct_labor_cost IS '部門別直接労務費';
COMMENT ON COLUMN dept_direct_labor_cost.cost_incurre_year_month IS '費用発生年月';
COMMENT ON COLUMN dept_direct_labor_cost.dept_code IS '部門コード';
COMMENT ON COLUMN dept_direct_labor_cost.direct_labor_cost IS '直接労務費';

CREATE TABLE dept_cost (
	dept_cost_number	decimal(18),
	order_lot_number	char(16),
	product_code	char(8),
	part_code	char(8),
	parts_rank_code	char(8),
	required_quantity	decimal(18),
	number_of_other_parts	decimal(18),
	material_budget	decimal(18),
	actual_material_cost	decimal(18),
	major_proc_basis_total_time	decimal(18),
	major_proc_result_total_time	decimal(18),
	major_proc_total_cost	decimal(18),
	major_proc_paln_outsource_total_cost	decimal(18),
	major_proc_result_outsource_total_cost	decimal(18),
	other_proc_basis_total_time	decimal(18),
	other_proc_result_total_time	decimal(18),
	other_proc_paln_outsource_total_cost	decimal(18),
	other_proc_result_outsource_total_cost	decimal(18),
	PRIMARY KEY (dept_cost_number)
);

COMMENT ON TABLE dept_cost IS '部門原価';
COMMENT ON COLUMN dept_cost.dept_cost_number IS '部門原価番号';
COMMENT ON COLUMN dept_cost.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN dept_cost.product_code IS '製品コード';
COMMENT ON COLUMN dept_cost.part_code IS '部品コード';
COMMENT ON COLUMN dept_cost.parts_rank_code IS '部品ランクコード';
COMMENT ON COLUMN dept_cost.required_quantity IS '所要数';
COMMENT ON COLUMN dept_cost.number_of_other_parts IS 'その他部品種別数';
COMMENT ON COLUMN dept_cost.material_budget IS '材料予算金額';
COMMENT ON COLUMN dept_cost.actual_material_cost IS '実績材料費';
COMMENT ON COLUMN dept_cost.major_proc_basis_total_time IS '主要工程標準・予定時間累計';
COMMENT ON COLUMN dept_cost.major_proc_result_total_time IS '主要工程実績時間累計';
COMMENT ON COLUMN dept_cost.major_proc_total_cost IS '主要工程加工費累計';
COMMENT ON COLUMN dept_cost.major_proc_paln_outsource_total_cost IS '主要工程外注加工費予算累計';
COMMENT ON COLUMN dept_cost.major_proc_result_outsource_total_cost IS '主要工程外注加工費実績累計';
COMMENT ON COLUMN dept_cost.other_proc_basis_total_time IS 'その他工程標準・予定時間累計';
COMMENT ON COLUMN dept_cost.other_proc_result_total_time IS 'その他工程実績時間累計';
COMMENT ON COLUMN dept_cost.other_proc_paln_outsource_total_cost IS 'その他工程外注加工費予算累計';
COMMENT ON COLUMN dept_cost.other_proc_result_outsource_total_cost IS 'その他工程外注加工費実績累計';

CREATE TABLE major_proc_cost (
	major_proc_cost_number	decimal(18),
	order_lot_number	char(16),
	product_code	char(8),
	part_code	char(8),
	major_proc_code	char(8),
	basis_plan_time	decimal(18),
	result_time	decimal(18),
	proc_cost	decimal(18),
	outsource_budget	decimal(18),
	result_outsource_cost	decimal(18),
	PRIMARY KEY (major_proc_cost_number)
);

COMMENT ON TABLE major_proc_cost IS '主要工程原価';
COMMENT ON COLUMN major_proc_cost.major_proc_cost_number IS '主要工程原価番号';
COMMENT ON COLUMN major_proc_cost.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN major_proc_cost.product_code IS '製品コード';
COMMENT ON COLUMN major_proc_cost.part_code IS '部品コード';
COMMENT ON COLUMN major_proc_cost.major_proc_code IS '主要工程コード';
COMMENT ON COLUMN major_proc_cost.basis_plan_time IS '標準・予定時間';
COMMENT ON COLUMN major_proc_cost.result_time IS '実績時間';
COMMENT ON COLUMN major_proc_cost.proc_cost IS '加工費';
COMMENT ON COLUMN major_proc_cost.outsource_budget IS '外注加工予算金額';
COMMENT ON COLUMN major_proc_cost.result_outsource_cost IS '実績外注加工費';

CREATE TABLE m_cost_class (
	cost_class_code	char(8),
	cost_class_name	varchar(64),
	PRIMARY KEY (cost_class_code)
);

COMMENT ON TABLE m_cost_class IS '原価区分マスタ';
COMMENT ON COLUMN m_cost_class.cost_class_code IS '原価区分コード';
COMMENT ON COLUMN m_cost_class.cost_class_name IS '原価区分名';

CREATE TABLE order_cost (
	order_lot_number	char(16),
	customer_code	char(8),
	quote_number	char(16),
	order_date	date,
	sales_recording_date	date,
	cost_class_code	char(8),
	item_code	char(8),
	order_quantity	decimal(18),
	design_basis_man_hour	decimal(4),
	design_man_hour	decimal(4),
	design_cost	decimal(18),
	assembly_basis_man_hour	decimal(4),
	assembly_cost	decimal(18),
	major_material_cost	decimal(18),
	other_material_cost	decimal(18),
	major_outsource_cost	decimal(18),
	other_outsource_cost	decimal(18),
	cost_difference	decimal(18),
	failed_cost	decimal(18),
	main_unit_total_cost	decimal(18),
	accessory_budget_cost	decimal(18),
	accessory_result_cost	decimal(18),
	inspect_cost	decimal(18),
	packing_transport_cost	decimal(18),
	on_site_construct_cost	decimal(18),
	other_cost	decimal(18),
	order_total_cost	decimal(18),
	total_variable_cost	decimal(18),
	PRIMARY KEY (order_lot_number)
);

COMMENT ON TABLE order_cost IS 'オーダー原価';
COMMENT ON COLUMN order_cost.order_lot_number IS '受注ロット番号';
COMMENT ON COLUMN order_cost.customer_code IS '得意先コード';
COMMENT ON COLUMN order_cost.quote_number IS '見積番号';
COMMENT ON COLUMN order_cost.order_date IS '受注日';
COMMENT ON COLUMN order_cost.sales_recording_date IS '売上日';
COMMENT ON COLUMN order_cost.cost_class_code IS '原価区分コード';
COMMENT ON COLUMN order_cost.item_code IS '品目コード';
COMMENT ON COLUMN order_cost.order_quantity IS '受注数';
COMMENT ON COLUMN order_cost.design_basis_man_hour IS '設計基準工数';
COMMENT ON COLUMN order_cost.design_man_hour IS '設計工数';
COMMENT ON COLUMN order_cost.design_cost IS '設計費';
COMMENT ON COLUMN order_cost.assembly_basis_man_hour IS '組立基準工数';
COMMENT ON COLUMN order_cost.assembly_cost IS '組立費';
COMMENT ON COLUMN order_cost.major_material_cost IS '主要部品材料費';
COMMENT ON COLUMN order_cost.other_material_cost IS 'その他部品材料費';
COMMENT ON COLUMN order_cost.major_outsource_cost IS '主要工程外注加工費';
COMMENT ON COLUMN order_cost.other_outsource_cost IS 'その他工程外注加工費';
COMMENT ON COLUMN order_cost.cost_difference IS '原価差額';
COMMENT ON COLUMN order_cost.failed_cost IS '仕損費';
COMMENT ON COLUMN order_cost.main_unit_total_cost IS '本体総原価';
COMMENT ON COLUMN order_cost.accessory_budget_cost IS '付属品費予算累計';
COMMENT ON COLUMN order_cost.accessory_result_cost IS '付属品費実績累計';
COMMENT ON COLUMN order_cost.inspect_cost IS '検査手数料';
COMMENT ON COLUMN order_cost.packing_transport_cost IS '荷造運送費';
COMMENT ON COLUMN order_cost.on_site_construct_cost IS '現地工事費';
COMMENT ON COLUMN order_cost.other_cost IS 'その他費用';
COMMENT ON COLUMN order_cost.order_total_cost IS 'オーダー総原価';
COMMENT ON COLUMN order_cost.total_variable_cost IS '変動費合計';

CREATE TABLE proc_cost (
	planned_year_month	char(6),
	product_code	char(8),
	proc_seq_number	decimal(4),
	proc_code	char(8),
	previous_wip_material_cost	decimal(18),
	previous_wip_expense	decimal(18),
	previous_wip_proc_cost	decimal(18),
	material_cost	decimal(18),
	expense	decimal(18),
	cost_difference	decimal(18),
	finished_quantity	decimal(18),
	wip_quantity	decimal(18),
	failed_quantity	decimal(18),
	by_products_quantity	decimal(18),
	wip_progress_rate	decimal(5,2),
	failed_product_progress_rate	decimal(5,2),
	finished_material_cost	decimal(18),
	finished_cost	decimal(18),
	finished_proc_cost	decimal(18),
	product_cost_difference	decimal(18),
	wip_material_cost	decimal(18),
	wip_expense	decimal(18),
	wip_proc_cost	decimal(18),
	wip_cost_difference	decimal(18),
	failed_material_cost	decimal(18),
	failed_expense	decimal(18),
	failed_proc_cost	decimal(18),
	failed_cost_difference	decimal(18),
	by_product_amount	decimal(18),
	PRIMARY KEY (planned_year_month product_code proc_seq_number)
);

COMMENT ON TABLE proc_cost IS '工程原価';
COMMENT ON COLUMN proc_cost.planned_year_month IS '計算年月度';
COMMENT ON COLUMN proc_cost.product_code IS '製品コード';
COMMENT ON COLUMN proc_cost.proc_seq_number IS '工程順No';
COMMENT ON COLUMN proc_cost.proc_code IS '工程コード';
COMMENT ON COLUMN proc_cost.previous_wip_material_cost IS '前月末仕掛材料費';
COMMENT ON COLUMN proc_cost.previous_wip_expense IS '前月末仕掛経費';
COMMENT ON COLUMN proc_cost.previous_wip_proc_cost IS '前月末仕掛加工費';
COMMENT ON COLUMN proc_cost.material_cost IS '材料費';
COMMENT ON COLUMN proc_cost.expense IS '経費';
COMMENT ON COLUMN proc_cost.cost_difference IS '原価差額';
COMMENT ON COLUMN proc_cost.finished_quantity IS '完成品数量';
COMMENT ON COLUMN proc_cost.wip_quantity IS '仕掛品数量';
COMMENT ON COLUMN proc_cost.failed_quantity IS '仕損品数量';
COMMENT ON COLUMN proc_cost.by_products_quantity IS '副産品数量';
COMMENT ON COLUMN proc_cost.wip_progress_rate IS '仕掛品進捗率';
COMMENT ON COLUMN proc_cost.failed_product_progress_rate IS '仕損品進捗率';
COMMENT ON COLUMN proc_cost.finished_material_cost IS '完成材料費';
COMMENT ON COLUMN proc_cost.finished_cost IS '完成経費';
COMMENT ON COLUMN proc_cost.finished_proc_cost IS '完成加工費';
COMMENT ON COLUMN proc_cost.product_cost_difference IS '完成原価差額';
COMMENT ON COLUMN proc_cost.wip_material_cost IS '仕掛材料費';
COMMENT ON COLUMN proc_cost.wip_expense IS '仕掛経費';
COMMENT ON COLUMN proc_cost.wip_proc_cost IS '仕掛加工費';
COMMENT ON COLUMN proc_cost.wip_cost_difference IS '仕掛原価差額';
COMMENT ON COLUMN proc_cost.failed_material_cost IS '仕損材料費';
COMMENT ON COLUMN proc_cost.failed_expense IS '仕損経費';
COMMENT ON COLUMN proc_cost.failed_proc_cost IS '仕損加工費';
COMMENT ON COLUMN proc_cost.failed_cost_difference IS '仕損原価差額';
COMMENT ON COLUMN proc_cost.by_product_amount IS '副産物価額';

CREATE TABLE m_grade (
	grade_code	char(8),
	grade_name	varchar(64),
	PRIMARY KEY (grade_code)
);

COMMENT ON TABLE m_grade IS '等級別マスタ';
COMMENT ON COLUMN m_grade.grade_code IS '等級別コード';
COMMENT ON COLUMN m_grade.grade_name IS '等級別名';

CREATE TABLE proc_cost_inv_eval (
	planned_year_month	char(6),
	product_code	char(8),
	proc_seq_number	decimal(4),
	final_proc_grade_code	char(8),
	grade_quantity	decimal(18),
	PRIMARY KEY (planned_year_month product_code proc_seq_number)
);

COMMENT ON TABLE proc_cost_inv_eval IS '工程原価棚卸評価';
COMMENT ON COLUMN proc_cost_inv_eval.planned_year_month IS '計算年月度';
COMMENT ON COLUMN proc_cost_inv_eval.product_code IS '製品コード';
COMMENT ON COLUMN proc_cost_inv_eval.proc_seq_number IS '工程順No';
COMMENT ON COLUMN proc_cost_inv_eval.final_proc_grade_code IS '最終工程・等級別コード';
COMMENT ON COLUMN proc_cost_inv_eval.grade_quantity IS '等級別数量';

CREATE TABLE m_graded_cost_factor (
	product_code	char(8),
	grade_code	char(8),
	material_cost_equiv_factor	decimal(5,2),
	cost_equiv_factor	decimal(5,2),
	proc_cost_equiv_factor	decimal(5,2),
	PRIMARY KEY (product_code grade_code)
);

COMMENT ON TABLE m_graded_cost_factor IS '等価係数マスタ';
COMMENT ON COLUMN m_graded_cost_factor.product_code IS '製品コード';
COMMENT ON COLUMN m_graded_cost_factor.grade_code IS '等級別コード';
COMMENT ON COLUMN m_graded_cost_factor.material_cost_equiv_factor IS '材料費等価係数';
COMMENT ON COLUMN m_graded_cost_factor.cost_equiv_factor IS '経費等価係数';
COMMENT ON COLUMN m_graded_cost_factor.proc_cost_equiv_factor IS '加工費等価係数';

CREATE TABLE product_cost (
	planned_year_month	char(6),
	product_code	char(8),
	grade_code	char(8),
	previous_wip_material_cost	decimal(18),
	previous_wip_expense	decimal(18),
	previous_wip_proc_cost	decimal(18),
	finished_material_cost	decimal(18),
	finished_cost	decimal(18),
	finished_proc_cost	decimal(18),
	product_cost_difference	decimal(18),
	total_cost	decimal(18),
	finished_quantity	decimal(18),
	product_cost_per_unit	decimal(18),
	wip_material_cost	decimal(18),
	wip_expense	decimal(18),
	wip_proc_cost	decimal(18),
	wip_cost_difference	decimal(18),
	PRIMARY KEY (planned_year_month product_code grade_code)
);

COMMENT ON TABLE product_cost IS '製品原価';
COMMENT ON COLUMN product_cost.planned_year_month IS '計算年月度';
COMMENT ON COLUMN product_cost.product_code IS '製品コード';
COMMENT ON COLUMN product_cost.grade_code IS '等級別コード';
COMMENT ON COLUMN product_cost.previous_wip_material_cost IS '前月末仕掛材料費';
COMMENT ON COLUMN product_cost.previous_wip_expense IS '前月末仕掛経費';
COMMENT ON COLUMN product_cost.previous_wip_proc_cost IS '前月末仕掛加工費';
COMMENT ON COLUMN product_cost.finished_material_cost IS '完成材料費';
COMMENT ON COLUMN product_cost.finished_cost IS '完成経費';
COMMENT ON COLUMN product_cost.finished_proc_cost IS '完成加工費';
COMMENT ON COLUMN product_cost.product_cost_difference IS '完成原価差額';
COMMENT ON COLUMN product_cost.total_cost IS '原価合計';
COMMENT ON COLUMN product_cost.finished_quantity IS '当月製品完成数量';
COMMENT ON COLUMN product_cost.product_cost_per_unit IS '単位当り製品原価';
COMMENT ON COLUMN product_cost.wip_material_cost IS '仕掛材料費';
COMMENT ON COLUMN product_cost.wip_expense IS '仕掛経費';
COMMENT ON COLUMN product_cost.wip_proc_cost IS '仕掛加工費';
COMMENT ON COLUMN product_cost.wip_cost_difference IS '仕掛原価差額';

CREATE TABLE total_by_customer (
	customer_code	char(8),
	target_year	char(4),
	order_total_amount	decimal(18),
	sales_total_amount	decimal(18),
	total_discount_return	decimal(18),
	sales_quote_total_cost	decimal(18),
	sales_quote_total_variable_cost	decimal(18),
	sales_marginal_profit	decimal(18),
	product_total_cost	decimal(18),
	product_total_variable_cost	decimal(18),
	production_marginal_profit	decimal(18),
	number_of_orders	decimal(18),
	number_of_sales	decimal(18),
	PRIMARY KEY (customer_code target_year)
);

COMMENT ON TABLE total_by_customer IS '得意先累計';
COMMENT ON COLUMN total_by_customer.customer_code IS '得意先コード';
COMMENT ON COLUMN total_by_customer.target_year IS '対象年';
COMMENT ON COLUMN total_by_customer.order_total_amount IS '受注高累計';
COMMENT ON COLUMN total_by_customer.sales_total_amount IS '売上高累計';
COMMENT ON COLUMN total_by_customer.total_discount_return IS '値引戻り高累計';
COMMENT ON COLUMN total_by_customer.sales_quote_total_cost IS '売上・見積原価累計';
COMMENT ON COLUMN total_by_customer.sales_quote_total_variable_cost IS '売上・見積変動費累計';
COMMENT ON COLUMN total_by_customer.sales_marginal_profit IS '売上・限界利益';
COMMENT ON COLUMN total_by_customer.product_total_cost IS '製造原価累計';
COMMENT ON COLUMN total_by_customer.product_total_variable_cost IS '製造・変動費累計';
COMMENT ON COLUMN total_by_customer.production_marginal_profit IS '製造・限界利益';
COMMENT ON COLUMN total_by_customer.number_of_orders IS '受注件数';
COMMENT ON COLUMN total_by_customer.number_of_sales IS '売上件数';

CREATE TABLE total_by_product (
	product_code	char(8),
	target_year	char(4),
	order_total_amount	decimal(18),
	sales_total_amount	decimal(18),
	total_discount_return	decimal(18),
	sales_quote_total_cost	decimal(18),
	sales_quote_total_variable_cost	decimal(18),
	sales_marginal_profit	decimal(18),
	product_total_cost	decimal(18),
	product_total_variable_cost	decimal(18),
	production_marginal_profit	decimal(18),
	number_of_orders	decimal(18),
	number_of_sales	decimal(18),
	PRIMARY KEY (product_code target_year)
);

COMMENT ON TABLE total_by_product IS '製品累計';
COMMENT ON COLUMN total_by_product.product_code IS '製品コード';
COMMENT ON COLUMN total_by_product.target_year IS '対象年';
COMMENT ON COLUMN total_by_product.order_total_amount IS '受注高累計';
COMMENT ON COLUMN total_by_product.sales_total_amount IS '売上高累計';
COMMENT ON COLUMN total_by_product.total_discount_return IS '値引戻り高累計';
COMMENT ON COLUMN total_by_product.sales_quote_total_cost IS '売上・見積原価累計';
COMMENT ON COLUMN total_by_product.sales_quote_total_variable_cost IS '売上・見積変動費累計';
COMMENT ON COLUMN total_by_product.sales_marginal_profit IS '売上・限界利益';
COMMENT ON COLUMN total_by_product.product_total_cost IS '製造原価累計';
COMMENT ON COLUMN total_by_product.product_total_variable_cost IS '製造・変動費累計';
COMMENT ON COLUMN total_by_product.production_marginal_profit IS '製造・限界利益';
COMMENT ON COLUMN total_by_product.number_of_orders IS '受注件数';
COMMENT ON COLUMN total_by_product.number_of_sales IS '売上件数';

CREATE TABLE m_cash_flow_item (
	cash_flow_item_code	char(8),
	cash_flow_item_name	varchar(64),
	cash_flow_item_group_code	char(8),
	display_order	decimal(4),
	PRIMARY KEY (cash_flow_item_code)
);

COMMENT ON TABLE m_cash_flow_item IS '資金繰り項目マスタ';
COMMENT ON COLUMN m_cash_flow_item.cash_flow_item_code IS '資金繰り項目コード';
COMMENT ON COLUMN m_cash_flow_item.cash_flow_item_name IS '資金繰り項目名';
COMMENT ON COLUMN m_cash_flow_item.cash_flow_item_group_code IS '資金繰り項目グループコード';
COMMENT ON COLUMN m_cash_flow_item.display_order IS '表示順';

CREATE TABLE fund_mgmt (
	planned_year_month	char(6),
	cash_flow_item_code	char(8),
	result_amount	decimal(18),
	planned_amount	decimal(18),
	PRIMARY KEY (planned_year_month cash_flow_item_code)
);

COMMENT ON TABLE fund_mgmt IS '資金管理';
COMMENT ON COLUMN fund_mgmt.planned_year_month IS '計画年月';
COMMENT ON COLUMN fund_mgmt.cash_flow_item_code IS '資金繰り項目コード';
COMMENT ON COLUMN fund_mgmt.result_amount IS '実績金額';
COMMENT ON COLUMN fund_mgmt.planned_amount IS '計画金額';

CREATE TABLE m_elem_calc (
	elem_calc_code	char(8),
	elem_calc_name	varchar(64),
	elem_calc_formula	varchar(256),
	PRIMARY KEY (elem_calc_code)
);

COMMENT ON TABLE m_elem_calc IS '要素計算マスタ';
COMMENT ON COLUMN m_elem_calc.elem_calc_code IS '分析要素コード';
COMMENT ON COLUMN m_elem_calc.elem_calc_name IS '分析要素名';
COMMENT ON COLUMN m_elem_calc.elem_calc_formula IS '分析要素計算式';

CREATE TABLE analysis_elem (
	calc_year	char(4),
	elem_calc_code	char(8),
	analysis_elem_value	decimal(18),
	PRIMARY KEY (calc_year elem_calc_code)
);

COMMENT ON TABLE analysis_elem IS '分析要素';
COMMENT ON COLUMN analysis_elem.calc_year IS '計算年度';
COMMENT ON COLUMN analysis_elem.elem_calc_code IS '分析要素コード';
COMMENT ON COLUMN analysis_elem.analysis_elem_value IS '分析要素数値';

CREATE TABLE m_comp_raito_type (
	comp_raito_type_code	char(8),
	comp_raito_type_name	varchar(64),
	PRIMARY KEY (comp_raito_type_code)
);

COMMENT ON TABLE m_comp_raito_type IS '構成比率種別マスタ';
COMMENT ON COLUMN m_comp_raito_type.comp_raito_type_code IS '構成比率種別コード';
COMMENT ON COLUMN m_comp_raito_type.comp_raito_type_name IS '構成比率種別名';

CREATE TABLE m_comp_calc (
	comp_raito_type_code	char(8),
	comp_raito_code	char(8),
	comp_raito_name	varchar(64),
	comp_raito_formula	varchar(256),
	PRIMARY KEY (comp_raito_code)
);

COMMENT ON TABLE m_comp_calc IS '構成計算マスタ';
COMMENT ON COLUMN m_comp_calc.comp_raito_type_code IS '構成比率種別コード';
COMMENT ON COLUMN m_comp_calc.comp_raito_code IS '構成比率コード';
COMMENT ON COLUMN m_comp_calc.comp_raito_name IS '構成比率名';
COMMENT ON COLUMN m_comp_calc.comp_raito_formula IS '構成比率計算式';

CREATE TABLE m_eval_raito_type (
	eval_raito_type_code	char(8),
	eval_raito_type_name	varchar(64),
	PRIMARY KEY (eval_raito_type_code)
);

COMMENT ON TABLE m_eval_raito_type IS '評価比率種別マスタ';
COMMENT ON COLUMN m_eval_raito_type.eval_raito_type_code IS '評価比率種別コード';
COMMENT ON COLUMN m_eval_raito_type.eval_raito_type_name IS '評価比率種別名';

CREATE TABLE m_eval_raito_unit_class (
	eval_raito_unit_class_code	char(8),
	eval_raito_unit_class_name	varchar(64),
	PRIMARY KEY (eval_raito_unit_class_code)
);

COMMENT ON TABLE m_eval_raito_unit_class IS '評価比率単位区分マスタ';
COMMENT ON COLUMN m_eval_raito_unit_class.eval_raito_unit_class_code IS '評価比率単位区分コード';
COMMENT ON COLUMN m_eval_raito_unit_class.eval_raito_unit_class_name IS '評価比率単位区分名';

CREATE TABLE m_eval_calc (
	eval_raito_type_code	char(8),
	eval_raito_code	char(8),
	eval_raito_name	varchar(64),
	eval_raito_calc_formula	varchar(256),
	eval_raito_unit_class_code	char(8),
	eval_raito_calc_formula_description	varchar(256),
	PRIMARY KEY (eval_raito_code)
);

COMMENT ON TABLE m_eval_calc IS '評価計算マスタ';
COMMENT ON COLUMN m_eval_calc.eval_raito_type_code IS '評価比率種別コード';
COMMENT ON COLUMN m_eval_calc.eval_raito_code IS '評価比率コード';
COMMENT ON COLUMN m_eval_calc.eval_raito_name IS '評価比率名';
COMMENT ON COLUMN m_eval_calc.eval_raito_calc_formula IS '評価比率計算式';
COMMENT ON COLUMN m_eval_calc.eval_raito_unit_class_code IS '評価比率単位区分コード';
COMMENT ON COLUMN m_eval_calc.eval_raito_calc_formula_description IS '評価比率式説明文';

CREATE TABLE comp_eval (
	calc_year	char(4),
	comp_raito_code	char(8),
	eval_raito_code	char(8),
	comp_eval_raito	decimal(5,2),
	PRIMARY KEY (calc_year comp_raito_code eval_raito_code)
);

COMMENT ON TABLE comp_eval IS '構成評価';
COMMENT ON COLUMN comp_eval.calc_year IS '計算年度';
COMMENT ON COLUMN comp_eval.comp_raito_code IS '構成比率コード';
COMMENT ON COLUMN comp_eval.eval_raito_code IS '評価比率コード';
COMMENT ON COLUMN comp_eval.comp_eval_raito IS '構成評価比率';

CREATE TABLE m_unit_price (
	item_code	char(8),
	unit_code	char(8),
	sales_price	decimal(18),
	PRIMARY KEY (item_code)
);

COMMENT ON TABLE m_unit_price IS '単価マスタ';
COMMENT ON COLUMN m_unit_price.item_code IS '品目コード';
COMMENT ON COLUMN m_unit_price.unit_code IS '単位コード';
COMMENT ON COLUMN m_unit_price.sales_price IS '販売単価';

CREATE TABLE m_office (
	office_code	char(8),
	office_name	varchar(64),
	PRIMARY KEY (office_code)
);

COMMENT ON TABLE m_office IS '事業所マスタ';
COMMENT ON COLUMN m_office.office_code IS '事業所コード';
COMMENT ON COLUMN m_office.office_name IS '事業所名';

CREATE TABLE m_dept (
	dept_code	char(8),
	dept_name	varchar(64),
	agg_dept_code	char(8),
	expense_ calc_area	char(8),
	dept_headcount	decimal(8),
	occupied_area	decimal(8),
	PRIMARY KEY (dept_code)
);

COMMENT ON TABLE m_dept IS '部門マスタ';
COMMENT ON COLUMN m_dept.dept_code IS '部門コード';
COMMENT ON COLUMN m_dept.dept_name IS '部門名';
COMMENT ON COLUMN m_dept.agg_dept_code IS '集約部門コード';
COMMENT ON COLUMN m_dept.expense_ calc_area IS '費用計算領域';
COMMENT ON COLUMN m_dept.dept_headcount IS '部門人数';
COMMENT ON COLUMN m_dept.occupied_area IS '占有面積';

CREATE TABLE m_partner_type (
	partner_type_code	char(8),
	partner_type_name	varchar(64),
	PRIMARY KEY (partner_type_code)
);

COMMENT ON TABLE m_partner_type IS '取引先種別マスタ';
COMMENT ON COLUMN m_partner_type.partner_type_code IS '取引先種別コード';
COMMENT ON COLUMN m_partner_type.partner_type_name IS '取引先種別名';

CREATE TABLE m_partner (
	partner_code	char(8),
	partner_type_code	char(8),
	partner_name	varchar(64),
	zip_code	char(7),
	address	varchar(128),
	phone_number	varchar(16),
	partner_group_code	char(8),
	PRIMARY KEY (partner_code)
);

COMMENT ON TABLE m_partner IS '取引先マスタ';
COMMENT ON COLUMN m_partner.partner_code IS '取引先コード';
COMMENT ON COLUMN m_partner.partner_type_code IS '取引先種別コード';
COMMENT ON COLUMN m_partner.partner_name IS '取引先名';
COMMENT ON COLUMN m_partner.zip_code IS '郵便番号';
COMMENT ON COLUMN m_partner.address IS '住所';
COMMENT ON COLUMN m_partner.phone_number IS '電話番号';
COMMENT ON COLUMN m_partner.partner_group_code IS '取引先グループコード';

CREATE TABLE m_warehouse (
	warehouse_code	char(8),
	warehouse_name	varchar(64),
	partner_code	char(8),
	PRIMARY KEY (warehouse_code)
);

COMMENT ON TABLE m_warehouse IS '倉庫マスタ';
COMMENT ON COLUMN m_warehouse.warehouse_code IS '倉庫コード';
COMMENT ON COLUMN m_warehouse.warehouse_name IS '倉庫名';
COMMENT ON COLUMN m_warehouse.partner_code IS '取引先コード';

CREATE TABLE m_storage_location (
	storage_location_code	char(8),
	storage_location_name	varchar(64),
	warehouse_code	char(8),
	PRIMARY KEY (storage_location_code)
);

COMMENT ON TABLE m_storage_location IS '格納場所マスタ';
COMMENT ON COLUMN m_storage_location.storage_location_code IS '格納場所コード';
COMMENT ON COLUMN m_storage_location.storage_location_name IS '格納場所名';
COMMENT ON COLUMN m_storage_location.warehouse_code IS '倉庫コード';

CREATE TABLE m_shelf_position (
	shelf_position_number	char(16),
	warehouse_code	char(8),
	storage_location_code	char(8),
	PRIMARY KEY (shelf_position_number)
);

COMMENT ON TABLE m_shelf_position IS '棚位置マスタ';
COMMENT ON COLUMN m_shelf_position.shelf_position_number IS '棚位置番号';
COMMENT ON COLUMN m_shelf_position.warehouse_code IS '倉庫コード';
COMMENT ON COLUMN m_shelf_position.storage_location_code IS '格納場所コード';

CREATE TABLE m_calendar (
	calendar_date	date,
	business_day_flag	char(1),
	PRIMARY KEY (calendar_date)
);

COMMENT ON TABLE m_calendar IS 'カレンダーマスタ';
COMMENT ON COLUMN m_calendar.calendar_date IS '年月日';
COMMENT ON COLUMN m_calendar.business_day_flag IS '営業日フラグ';

CREATE TABLE employee (
	emp_code	char(8),
	emp_name	varchar(64),
	gender	char(1),
	date_of_birth	date,
	educational_background	varchar(64),
	place_of_birth	varchar(64),
	date_of_emplyment	date,
	date_of_retirement	date,
	PRIMARY KEY (emp_code)
);

COMMENT ON TABLE employee IS '従業員基本';
COMMENT ON COLUMN employee.emp_code IS '従業員コード';
COMMENT ON COLUMN employee.emp_name IS '氏名';
COMMENT ON COLUMN employee.gender IS '性別';
COMMENT ON COLUMN employee.date_of_birth IS '生年月日';
COMMENT ON COLUMN employee.educational_background IS '学歴';
COMMENT ON COLUMN employee.place_of_birth IS '出身地';
COMMENT ON COLUMN employee.date_of_emplyment IS '入社年月日';
COMMENT ON COLUMN employee.date_of_retirement IS '退職年月日';

CREATE TABLE m_job_class (
	job_class_code	char(8),
	job_class_name	varchar(64),
	PRIMARY KEY (job_class_code)
);

COMMENT ON TABLE m_job_class IS '職務区分マスタ';
COMMENT ON COLUMN m_job_class.job_class_code IS '職務区分コード';
COMMENT ON COLUMN m_job_class.job_class_name IS '職務区分名';

CREATE TABLE m_position_title_class (
	position_title_class_code	char(8),
	position_title_class_name	varchar(64),
	PRIMARY KEY (position_title_class_code)
);

COMMENT ON TABLE m_position_title_class IS '役席・職位区分マスタ';
COMMENT ON COLUMN m_position_title_class.position_title_class_code IS '役席・職位区分コード';
COMMENT ON COLUMN m_position_title_class.position_title_class_name IS '役席・職位区分名';

CREATE TABLE internal_career (
	internal_career_number	char(16),
	emp_code	char(8),
	tranfer_date	date,
	end_date	date,
	office_code	char(8),
	dept_code	char(8),
	job_class_code	char(8),
	job_detail	varchar(256),
	promote_date	date,
	position_title_class_code	char(8),
	PRIMARY KEY (internal_career_number)
);

COMMENT ON TABLE internal_career IS '社内経歴';
COMMENT ON COLUMN internal_career.internal_career_number IS '社内経歴番号';
COMMENT ON COLUMN internal_career.emp_code IS '従業員コード';
COMMENT ON COLUMN internal_career.tranfer_date IS '異動日';
COMMENT ON COLUMN internal_career.end_date IS '終了日';
COMMENT ON COLUMN internal_career.office_code IS '事業所コード';
COMMENT ON COLUMN internal_career.dept_code IS '部門コード';
COMMENT ON COLUMN internal_career.job_class_code IS '職務区分コード';
COMMENT ON COLUMN internal_career.job_detail IS '職務内容';
COMMENT ON COLUMN internal_career.promote_date IS '昇格日';
COMMENT ON COLUMN internal_career.position_title_class_code IS '役席・職位区分コード';

CREATE TABLE external_career (
	external_career_number	char(16),
	emp_code	char(8),
	previous_employment	varchar(64),
	industry	varchar(64),
	date_of_emplyment	date,
	Length of Employment	decimal(8),
	position_title	varchar(64),
	job_detail	varchar(256),
	PRIMARY KEY (external_career_number)
);

COMMENT ON TABLE external_career IS '社外経歴';
COMMENT ON COLUMN external_career.external_career_number IS '社外経歴番号';
COMMENT ON COLUMN external_career.emp_code IS '従業員コード';
COMMENT ON COLUMN external_career.previous_employment IS '入社前勤務先';
COMMENT ON COLUMN external_career.industry IS '業種';
COMMENT ON COLUMN external_career.date_of_emplyment IS '入社日';
COMMENT ON COLUMN external_career.Length of Employment IS '在籍期間';
COMMENT ON COLUMN external_career.position_title IS '役席・職位';
COMMENT ON COLUMN external_career.job_detail IS '職務内容';

CREATE TABLE m_patent_utility_model_apply_type (
	patent_utility_model_apply_type_code	char(8),
	patent_utility_model_apply_type_name	varchar(64),
	PRIMARY KEY (patent_utility_model_apply_type_code)
);

COMMENT ON TABLE m_patent_utility_model_apply_type IS '特許・実用新案出願種別マスタ';
COMMENT ON COLUMN m_patent_utility_model_apply_type.patent_utility_model_apply_type_code IS '特許・実用新案出願種別コード';
COMMENT ON COLUMN m_patent_utility_model_apply_type.patent_utility_model_apply_type_name IS '特許・実用新案出願種別名';

CREATE TABLE patent_utility_model (
	patent_utility_model_number	varchar(64),
	emp_code	char(8),
	date_of_apply	date,
	apply_type_code	char(8),
	apply_number	char(16),
	apply_detail	varchar(256),
	apply_result	varchar(256),
	PRIMARY KEY (patent_utility_model_number)
);

COMMENT ON TABLE patent_utility_model IS '特許・実用新案';
COMMENT ON COLUMN patent_utility_model.patent_utility_model_number IS '特許・実用新案番号';
COMMENT ON COLUMN patent_utility_model.emp_code IS '従業員コード';
COMMENT ON COLUMN patent_utility_model.date_of_apply IS '出願日';
COMMENT ON COLUMN patent_utility_model.apply_type_code IS '出願種別コード';
COMMENT ON COLUMN patent_utility_model.apply_number IS '出願番号';
COMMENT ON COLUMN patent_utility_model.apply_detail IS '出願内容';
COMMENT ON COLUMN patent_utility_model.apply_result IS '出願結果';

CREATE TABLE m_qual_type (
	qual_type_code	char(8),
	qual_type_name	varchar(64),
	PRIMARY KEY (qual_type_code)
);

COMMENT ON TABLE m_qual_type IS '資格種別マスタ';
COMMENT ON COLUMN m_qual_type.qual_type_code IS '資格種別コード';
COMMENT ON COLUMN m_qual_type.qual_type_name IS '資格種別名';

CREATE TABLE qualifications (
	qual_number	char(16),
	emp_code	char(8),
	date_of_obtain	date,
	qual_type_code	char(8),
	qual_detail	varchar(256),
	PRIMARY KEY (qual_number)
);

COMMENT ON TABLE qualifications IS '取得資格';
COMMENT ON COLUMN qualifications.qual_number IS '取得資格番号';
COMMENT ON COLUMN qualifications.emp_code IS '従業員コード';
COMMENT ON COLUMN qualifications.date_of_obtain IS '取得日';
COMMENT ON COLUMN qualifications.qual_type_code IS '資格種別コード';
COMMENT ON COLUMN qualifications.qual_detail IS '資格内容';

CREATE TABLE internal_proposal (
	proposal_number	char(16),
	emp_code	char(8),
	date_of_propose	date,
	eval_rank	varchar(64),
	PRIMARY KEY (proposal_number)
);

COMMENT ON TABLE internal_proposal IS '提案制度';
COMMENT ON COLUMN internal_proposal.proposal_number IS '提案番号';
COMMENT ON COLUMN internal_proposal.emp_code IS '従業員コード';
COMMENT ON COLUMN internal_proposal.date_of_propose IS '提案日';
COMMENT ON COLUMN internal_proposal.eval_rank IS '評価ランク';

CREATE TABLE salary (
	emp_code	char(8),
	change_date	date,
	basic_salary	decimal(18),
	merit_pay	decimal(18),
	qualification_salary	decimal(18),
	title_position_allowance	decimal(18),
	annual_salary	decimal(18),
	retirement_allowance_amount	decimal(18),
	increase_amount	decimal(18),
	PRIMARY KEY (emp_code change_date)
);

COMMENT ON TABLE salary IS '給与';
COMMENT ON COLUMN salary.emp_code IS '従業員コード';
COMMENT ON COLUMN salary.change_date IS '変更日';
COMMENT ON COLUMN salary.basic_salary IS '基本給';
COMMENT ON COLUMN salary.merit_pay IS '能力給';
COMMENT ON COLUMN salary.qualification_salary IS '資格給';
COMMENT ON COLUMN salary.title_position_allowance IS '役席・職位手当';
COMMENT ON COLUMN salary.annual_salary IS '年俸';
COMMENT ON COLUMN salary.retirement_allowance_amount IS '退職金積立額';
COMMENT ON COLUMN salary.increase_amount IS '昇給額';

CREATE TABLE performance_appraisal (
	emp_code	char(8),
	eval_date	date,
	eval_rank	varchar(64),
	eval_detail	varchar(256),
	evaluator_code	char(8),
	PRIMARY KEY (emp_code eval_date)
);

COMMENT ON TABLE performance_appraisal IS '考課査定';
COMMENT ON COLUMN performance_appraisal.emp_code IS '従業員コード';
COMMENT ON COLUMN performance_appraisal.eval_date IS '査定日';
COMMENT ON COLUMN performance_appraisal.eval_rank IS '評価ランク';
COMMENT ON COLUMN performance_appraisal.eval_detail IS '評価内容';
COMMENT ON COLUMN performance_appraisal.evaluator_code IS '査定者コード';

CREATE TABLE social_insurance (
	emp_code	char(8),
	change_date	date,
	pension_number	char(16),
	standard_monthly_remuneration	decimal(18),
	first_resident_tax_amount	decimal(18),
	resident_tax_amount	decimal(18),
	PRIMARY KEY (emp_code change_date)
);

COMMENT ON TABLE social_insurance IS '社会保険';
COMMENT ON COLUMN social_insurance.emp_code IS '従業員コード';
COMMENT ON COLUMN social_insurance.change_date IS '変更日';
COMMENT ON COLUMN social_insurance.pension_number IS '年金番号';
COMMENT ON COLUMN social_insurance.standard_monthly_remuneration IS '社会保険・標準報酬月額';
COMMENT ON COLUMN social_insurance.first_resident_tax_amount IS '初回住民税額';
COMMENT ON COLUMN social_insurance.resident_tax_amount IS '２回目以降住民税額';

CREATE TABLE health_status (
	emp_code	char(8),
	inspect_date	date,
	regular_health_check_result	varchar(256),
	PRIMARY KEY (emp_code inspect_date)
);

COMMENT ON TABLE health_status IS '健康状況';
COMMENT ON COLUMN health_status.emp_code IS '従業員コード';
COMMENT ON COLUMN health_status.inspect_date IS '検査日';
COMMENT ON COLUMN health_status.regular_health_check_result IS '定期検診結果';

CREATE TABLE suspension_from_office (
	emp_code	char(8),
	start_date	date,
	end_date	date,
	reason_for_leave	varchar(256),
	PRIMARY KEY (emp_code start_date)
);

COMMENT ON TABLE suspension_from_office IS '休職';
COMMENT ON COLUMN suspension_from_office.emp_code IS '従業員コード';
COMMENT ON COLUMN suspension_from_office.start_date IS '開始日';
COMMENT ON COLUMN suspension_from_office.end_date IS '終了日';
COMMENT ON COLUMN suspension_from_office.reason_for_leave IS '休業理由';

CREATE TABLE paid_holiday (
	emp_code	char(8),
	target_year	char(4),
	beginning_holiday_count	decimal(4,1),
	used_holiday_count	decimal(4,1),
	PRIMARY KEY (emp_code target_year)
);

COMMENT ON TABLE paid_holiday IS '有給休暇';
COMMENT ON COLUMN paid_holiday.emp_code IS '従業員コード';
COMMENT ON COLUMN paid_holiday.target_year IS '対象年';
COMMENT ON COLUMN paid_holiday.beginning_holiday_count IS '年初休暇日数';
COMMENT ON COLUMN paid_holiday.used_holiday_count IS '消化休暇日数';

CREATE TABLE m_salary_transfer_type (
	salary_transfer_type_code	char(8),
	salary_transfer_type_name	varchar(64),
	PRIMARY KEY (salary_transfer_type_code)
);

COMMENT ON TABLE m_salary_transfer_type IS '給与振込先種別マスタ';
COMMENT ON COLUMN m_salary_transfer_type.salary_transfer_type_code IS '給与振込先種別コード';
COMMENT ON COLUMN m_salary_transfer_type.salary_transfer_type_name IS '給与振込先種別名';

CREATE TABLE salary_transfer_details (
	transfer_detail_number	char(16),
	emp_code	char(8),
	transfer_type_code	char(8),
	start_date	date,
	end_date	date,
	transfer_bank	varchar(64),
	bank_account_type_code	char(8),
	bank_account_number	varchar(64),
	PRIMARY KEY (transfer_detail_number)
);

COMMENT ON TABLE salary_transfer_details IS '給与振込先';
COMMENT ON COLUMN salary_transfer_details.transfer_detail_number IS '振込先番号';
COMMENT ON COLUMN salary_transfer_details.emp_code IS '従業員コード';
COMMENT ON COLUMN salary_transfer_details.transfer_type_code IS '振込先種別コード';
COMMENT ON COLUMN salary_transfer_details.start_date IS '開始日';
COMMENT ON COLUMN salary_transfer_details.end_date IS '終了日';
COMMENT ON COLUMN salary_transfer_details.transfer_bank IS '振込銀行';
COMMENT ON COLUMN salary_transfer_details.bank_account_type_code IS '口座種別コード';
COMMENT ON COLUMN salary_transfer_details.bank_account_number IS '口座番号';

CREATE TABLE address (
	emp_code	char(8),
	change_date	date,
	zip_code	char(7),
	address	varchar(128),
	phone_number	varchar(16),
	emergency_contact	varchar(64),
	emergency_contact_number	varchar(16),
	PRIMARY KEY (emp_code change_date)
);

COMMENT ON TABLE address IS '住所';
COMMENT ON COLUMN address.emp_code IS '従業員コード';
COMMENT ON COLUMN address.change_date IS '変更日';
COMMENT ON COLUMN address.zip_code IS '郵便番号';
COMMENT ON COLUMN address.address IS '住所';
COMMENT ON COLUMN address.phone_number IS '電話番号';
COMMENT ON COLUMN address.emergency_contact IS '緊急連絡先';
COMMENT ON COLUMN address.emergency_contact_number IS '緊急連絡先・電話番号';

CREATE TABLE commuting_route (
	emp_code	char(8),
	change_date	date,
	line_number	decimal(4),
	transportation_name	varchar(64),
	start_station	varchar(64),
	end_station	varchar(64),
	pass_price	decimal(18),
	PRIMARY KEY (emp_code change_date)
);

COMMENT ON TABLE commuting_route IS '通勤経路';
COMMENT ON COLUMN commuting_route.emp_code IS '従業員コード';
COMMENT ON COLUMN commuting_route.change_date IS '変更日';
COMMENT ON COLUMN commuting_route.line_number IS '明細No';
COMMENT ON COLUMN commuting_route.transportation_name IS '利用交通機関名';
COMMENT ON COLUMN commuting_route.start_station IS '乗車駅';
COMMENT ON COLUMN commuting_route.end_station IS '降車駅';
COMMENT ON COLUMN commuting_route.pass_price IS '定期券代金';

CREATE TABLE m_family_status_relationship_class (
	family_status_relationship_class_code	char(8),
	family_status_relationship_class_name	varchar(64),
	PRIMARY KEY (family_status_relationship_class_code)
);

COMMENT ON TABLE m_family_status_relationship_class IS '家族状況関係区分マスタ';
COMMENT ON COLUMN m_family_status_relationship_class.family_status_relationship_class_code IS '家族状況関係区分コード';
COMMENT ON COLUMN m_family_status_relationship_class.family_status_relationship_class_name IS '家族状況関係区分名';

CREATE TABLE family_status (
	emp_code	char(8),
	change_date	date,
	line_number	decimal(4),
	relationship_class_code	char(8),
	name	varchar(64),
	gender	char(1),
	date_of_birth	date,
	dependent_status	char(8),
	separate_flag	char(1),
	job_school_name	varchar(64),
	PRIMARY KEY (emp_code change_date line_number)
);

COMMENT ON TABLE family_status IS '家族状況';
COMMENT ON COLUMN family_status.emp_code IS '従業員コード';
COMMENT ON COLUMN family_status.change_date IS '変更日';
COMMENT ON COLUMN family_status.line_number IS '明細No';
COMMENT ON COLUMN family_status.relationship_class_code IS '関係区分コード';
COMMENT ON COLUMN family_status.name IS '氏名';
COMMENT ON COLUMN family_status.gender IS '性別';
COMMENT ON COLUMN family_status.date_of_birth IS '生年月日';
COMMENT ON COLUMN family_status.dependent_status IS '扶養区分';
COMMENT ON COLUMN family_status.separate_flag IS '別居フラグ';
COMMENT ON COLUMN family_status.job_school_name IS '職業・学校名';

