CREATE TABLE m_conds( 
    conds_key varchar (64) NOT NULL
    , conds_seq numeric (8) NOT NULL
    , conds_text1 varchar (126) NOT NULL
    , conds_text2 varchar (126) NOT NULL
    , conds_text3 varchar (126) NOT NULL
    , conds_text4 varchar (126) NOT NULL
    , conds_text5 varchar (126) NOT NULL
    , conds_numb1 numeric (10, 2) NOT NULL
    , conds_numb2 numeric (10, 2) NOT NULL
    , conds_numb3 numeric (10, 2) NOT NULL
    , conds_numb4 numeric (10, 2) NOT NULL
    , conds_numb5 numeric (10, 2) NOT NULL
    , add_datetime timestamp
    , upd_datetime timestamp DEFAULT NULL
    , del_datetime timestamp DEFAULT NULL
    , upd_count numeric (8) DEFAULT 0
    , PRIMARY KEY (conds_key, conds_seq)
); 

CREATE TABLE m_item( 
    item_code varchar (64) NOT NULL
    , cust_code varchar (64) NOT NULL
    , item_name varchar (120) NOT NULL
    , cust_name varchar (120) NOT NULL
    , remarks1 varchar (120) NOT NULL
    , remarks2 varchar (120) NOT NULL
    , remarks3 varchar (120) NOT NULL
    , add_datetime timestamp
    , upd_datetime timestamp DEFAULT NULL
    , del_datetime timestamp DEFAULT NULL
    , upd_count numeric (8) DEFAULT 0
    , PRIMARY KEY (item_code, cust_code)
); 

CREATE TABLE m_station( 
    station_code varchar (8) NOT NULL
    , station_name varchar (126) NOT NULL
    , in_seq numeric (8) NOT NULL
    , out_seq numeric (8) NOT NULL
    , notused varchar (1) NOT NULL
    , station_posx numeric (8) NOT NULL
    , station_posy numeric (8) NOT NULL
    , station_posz numeric (8) NOT NULL
    , remarks1 varchar (120) NOT NULL
    , remarks2 varchar (120) NOT NULL
    , remarks3 varchar (120) NOT NULL
    , add_datetime timestamp
    , upd_datetime timestamp DEFAULT NULL
    , del_datetime timestamp DEFAULT NULL
    , upd_count numeric (8) DEFAULT 0
    , PRIMARY KEY (station_code, station_name)
); 

CREATE TABLE m_stock( 
    item_code varchar (64) NOT NULL
    , made_date date NOT NULL
    , seq numeric (8) NOT NULL
    , lotno varchar (120) NOT NULL
    , ship_mode varchar (2) NOT NULL
    , quant numeric (8) NOT NULL
    , stock_in date NOT NULL
    , stock_out date NOT NULL
    , ristr_mode varchar (2) NOT NULL
    , loc_x numeric (8) NOT NULL
    , loc_y numeric (8) NOT NULL
    , loc_z numeric (8) NOT NULL
    , add_datetime timestamp
    , upd_datetime timestamp DEFAULT NULL
    , del_datetime timestamp DEFAULT NULL
    , upd_count numeric (8) DEFAULT 0
    , PRIMARY KEY (item_code, made_date, seq)
); 

CREATE TABLE m_storage( 
    loc_x numeric (8) NOT NULL
    , loc_y numeric (8) NOT NULL
    , loc_z numeric (8) NOT NULL
    , usage_code varchar (2) NOT NULL
    , priority_x numeric (8) NOT NULL
    , priority_y numeric (8) NOT NULL
    , priority_z numeric (8) NOT NULL
    , priority_t numeric (8) NOT NULL
    , remarks_1 varchar (126) NOT NULL
    , remarks_2 varchar (126) NOT NULL
    , remarks_3 varchar (126) NOT NULL
    , add_datetime timestamp
    , upd_datetime timestamp DEFAULT NULL
    , del_datetime timestamp DEFAULT NULL
    , upd_count numeric (8) DEFAULT 0
); 

CREATE TABLE t_stock_info( 
    loc_x numeric (8) NOT NULL
    , loc_y numeric (8) NOT NULL
    , loc_z numeric (8) NOT NULL
    , usage_code varchar (2) NOT NULL
    , cargo_mode varchar (2) NOT NULL
    , ship_mode varchar (2) NOT NULL
    , item_code varchar (64) NOT NULL
    , made_date date NOT NULL
    , seq numeric (8) NOT NULL
    , lotno varchar (120) NOT NULL
    , add_datetime timestamp
    , upd_datetime timestamp DEFAULT NULL
    , del_datetime timestamp DEFAULT NULL
    , upd_count numeric (8) DEFAULT 0
    , PRIMARY KEY (loc_x, loc_y, loc_z)
); 

CREATE TABLE t_stock_hist( 
    item_code varchar (64) NOT NULL
    , made_date date NOT NULL
    , seq numeric (8) NOT NULL
    , hist_seq numeric (2) NOT NULL
    , hist_code varchar (2) NOT NULL
    , ship_mode varchar (2) NOT NULL
    , station_code varchar (8) NOT NULL
    , vehicle_no varchar (32) NOT NULL
    , loc_x numeric (8) NOT NULL
    , loc_y numeric (8) NOT NULL
    , loc_z numeric (8) NOT NULL
    , add_datetime timestamp
    , upd_datetime timestamp DEFAULT NULL
    , del_datetime timestamp DEFAULT NULL
    , upd_count numeric (8) DEFAULT 0
    , PRIMARY KEY (item_code, made_date, seq, hist_seq)
); 

CREATE TABLE t_stock_in( 
    station_code varchar (8) NOT NULL
    , rsv_code varchar (2) NOT NULL
    , rsv_seq numeric (8) NOT NULL
    , item_code varchar (64) NOT NULL
    , made_date date NOT NULL
    , seq numeric (8) NOT NULL
    , lotno varchar (120) NOT NULL
    , exec_conds varchar (8) NOT NULL
    , loc_x numeric (8) NOT NULL
    , loc_y numeric (8) NOT NULL
    , loc_z numeric (8) NOT NULL
    , add_datetime timestamp
    , upd_datetime timestamp DEFAULT NULL
    , del_datetime timestamp DEFAULT NULL
    , upd_count numeric (8) DEFAULT 0
    , PRIMARY KEY (station_code, rsv_code, rsv_seq)
); 

CREATE TABLE t_stock_out( 
    station_code varchar (8) NOT NULL
    , station_mode varchar (4) NOT NULL
    , station_seq numeric (8) NOT NULL
    , item_code varchar (64) NOT NULL
    , made_date date NOT NULL
    , seq numeric (8) NOT NULL
    , lotno varchar (120) NOT NULL
    , exec_conds varchar (8) NOT NULL
    , loc_x numeric (8) NOT NULL
    , loc_y numeric (8) NOT NULL
    , loc_z numeric (8) NOT NULL
    , add_datetime timestamp
    , upd_datetime timestamp DEFAULT NULL
    , del_datetime timestamp DEFAULT NULL
    , upd_count numeric (8) DEFAULT 0
    , PRIMARY KEY (station_code, station_mode, station_seq)
);


COMMENT ON TABLE m_conds IS '条件マスタ';
COMMENT ON TABLE m_item IS '品目マスタ';
COMMENT ON TABLE m_station IS 'ステーションマスタ';
COMMENT ON TABLE m_stock IS '在庫マスタ';
COMMENT ON TABLE m_storage IS '棚番マスタ';
COMMENT ON TABLE t_stock_info IS '倉庫実態テーブル';
COMMENT ON TABLE t_stock_hist IS '在庫履歴テーブル';
COMMENT ON TABLE t_stock_in IS '入庫情報テーブル';
COMMENT ON TABLE t_stock_out IS '出庫情報ーブル';


COMMENT ON COLUMN m_conds.conds_key IS '条件キー';
COMMENT ON COLUMN m_conds.conds_seq IS '条件連番';
COMMENT ON COLUMN m_conds.conds_text1 IS '条件文字データ１';
COMMENT ON COLUMN m_conds.conds_text2 IS '条件文字データ２';
COMMENT ON COLUMN m_conds.conds_text3 IS '条件文字データ３';
COMMENT ON COLUMN m_conds.conds_text4 IS '条件文字データ４';
COMMENT ON COLUMN m_conds.conds_text5 IS '条件文字データ５';
COMMENT ON COLUMN m_conds.conds_numb1 IS '条件数値データ１';
COMMENT ON COLUMN m_conds.conds_numb2 IS '条件数値データ２';
COMMENT ON COLUMN m_conds.conds_numb3 IS '条件数値データ３';
COMMENT ON COLUMN m_conds.conds_numb4 IS '条件数値データ４';
COMMENT ON COLUMN m_conds.conds_numb5 IS '条件数値データ５';
COMMENT ON COLUMN m_conds.add_datetime IS '登録日時';
COMMENT ON COLUMN m_conds.upd_datetime IS '更新日時';
COMMENT ON COLUMN m_conds.del_datetime IS '削除日時';
COMMENT ON COLUMN m_conds.upd_count IS '更新回数';


COMMENT ON COLUMN m_item.item_code IS '品目コード';
COMMENT ON COLUMN m_item.cust_code IS '荷主コード';
COMMENT ON COLUMN m_item.item_name IS '品目名';
COMMENT ON COLUMN m_item.cust_name IS '荷主名';
COMMENT ON COLUMN m_item.remarks1 IS '備考１';
COMMENT ON COLUMN m_item.remarks2 IS '備考２';
COMMENT ON COLUMN m_item.remarks3 IS '備考３';
COMMENT ON COLUMN m_item.add_datetime IS '登録日時';
COMMENT ON COLUMN m_item.upd_datetime IS '更新日時';
COMMENT ON COLUMN m_item.del_datetime IS '削除日時';
COMMENT ON COLUMN m_item.upd_count IS '更新回数';


COMMENT ON COLUMN m_station.station_code IS 'ステーションコード';
COMMENT ON COLUMN m_station.station_name IS 'ステーション名';
COMMENT ON COLUMN m_station.in_seq IS '利用優先順（入）';
COMMENT ON COLUMN m_station.out_seq IS '利用優先順（出）';
COMMENT ON COLUMN m_station.notused IS '使用禁止';
COMMENT ON COLUMN m_station.station_posx IS 'ステーションX位置';
COMMENT ON COLUMN m_station.station_posy IS 'ステーションY位置';
COMMENT ON COLUMN m_station.station_posz IS 'ステーションZ位置';
COMMENT ON COLUMN m_station.remarks1 IS '備考１';
COMMENT ON COLUMN m_station.remarks2 IS '備考２';
COMMENT ON COLUMN m_station.remarks3 IS '備考３';
COMMENT ON COLUMN m_station.add_datetime IS '登録日時';
COMMENT ON COLUMN m_station.upd_datetime IS '更新日時';
COMMENT ON COLUMN m_station.del_datetime IS '削除日時';
COMMENT ON COLUMN m_station.upd_count IS '更新回数';


COMMENT ON COLUMN m_stock.item_code IS '品目コード';
COMMENT ON COLUMN m_stock.made_date IS '製造年月日';
COMMENT ON COLUMN m_stock.seq IS '連番';
COMMENT ON COLUMN m_stock.lotno IS '製造ロットNO';
COMMENT ON COLUMN m_stock.ship_mode IS '出荷状況';
COMMENT ON COLUMN m_stock.quant IS '数量';
COMMENT ON COLUMN m_stock.stock_in IS '入庫日';
COMMENT ON COLUMN m_stock.stock_out IS '出庫日';
COMMENT ON COLUMN m_stock.ristr_mode IS '禁止区分';
COMMENT ON COLUMN m_stock.loc_x IS '格納先X';
COMMENT ON COLUMN m_stock.loc_y IS '格納先Y';
COMMENT ON COLUMN m_stock.loc_z IS '格納先Z';
COMMENT ON COLUMN m_stock.add_datetime IS '登録日時';
COMMENT ON COLUMN m_stock.upd_datetime IS '更新日時';
COMMENT ON COLUMN m_stock.del_datetime IS '削除日時';
COMMENT ON COLUMN m_stock.upd_count IS '更新回数';


COMMENT ON COLUMN m_storage.loc_x IS '格納先X';
COMMENT ON COLUMN m_storage.loc_y IS '格納先Y';
COMMENT ON COLUMN m_storage.loc_z IS '格納先Z';
COMMENT ON COLUMN m_storage.usage_code IS '棚区分';
COMMENT ON COLUMN m_storage.priority_x IS 'X方向優先順位';
COMMENT ON COLUMN m_storage.priority_y IS 'Y方向優先順位';
COMMENT ON COLUMN m_storage.priority_z IS 'Z方向優先順位';
COMMENT ON COLUMN m_storage.priority_t IS '総合優先順位';
COMMENT ON COLUMN m_storage.remarks_1 IS '備考１';
COMMENT ON COLUMN m_storage.remarks_2 IS '備考２';
COMMENT ON COLUMN m_storage.remarks_3 IS '備考３';
COMMENT ON COLUMN m_storage.add_datetime IS '登録日時';
COMMENT ON COLUMN m_storage.upd_datetime IS '更新日時';
COMMENT ON COLUMN m_storage.del_datetime IS '削除日時';
COMMENT ON COLUMN m_storage.upd_count IS '更新回数';


COMMENT ON COLUMN t_stock_info.loc_x IS '格納先X';
COMMENT ON COLUMN t_stock_info.loc_y IS '格納先Y';
COMMENT ON COLUMN t_stock_info.loc_z IS '格納先Z';
COMMENT ON COLUMN t_stock_info.usage_code IS '棚区分';
COMMENT ON COLUMN t_stock_info.cargo_mode IS '荷物区分';
COMMENT ON COLUMN t_stock_info.ship_mode IS '出庫区分';
COMMENT ON COLUMN t_stock_info.item_code IS '品目コード';
COMMENT ON COLUMN t_stock_info.made_date IS '製造年月日';
COMMENT ON COLUMN t_stock_info.seq IS '連番';
COMMENT ON COLUMN t_stock_info.lotno IS '製造ロットNO';
COMMENT ON COLUMN t_stock_info.add_datetime IS '登録日時';
COMMENT ON COLUMN t_stock_info.upd_datetime IS '更新日時';
COMMENT ON COLUMN t_stock_info.del_datetime IS '削除日時';
COMMENT ON COLUMN t_stock_info.upd_count IS '更新回数';


COMMENT ON COLUMN t_stock_hist.item_code IS '品目コード';
COMMENT ON COLUMN t_stock_hist.made_date IS '製造年月日';
COMMENT ON COLUMN t_stock_hist.seq IS '連番';
COMMENT ON COLUMN t_stock_hist.hist_seq IS '履歴SEQ';
COMMENT ON COLUMN t_stock_hist.hist_code IS '履歴区分';
COMMENT ON COLUMN t_stock_hist.ship_mode IS '実行日時';
COMMENT ON COLUMN t_stock_hist.station_code IS 'ステーションコード';
COMMENT ON COLUMN t_stock_hist.vehicle_no IS 'トラック車番';
COMMENT ON COLUMN t_stock_hist.loc_x IS '格納先X';
COMMENT ON COLUMN t_stock_hist.loc_y IS '格納先Y';
COMMENT ON COLUMN t_stock_hist.loc_z IS '格納先Z';
COMMENT ON COLUMN t_stock_hist.add_datetime IS '登録日時';
COMMENT ON COLUMN t_stock_hist.upd_datetime IS '更新日時';
COMMENT ON COLUMN t_stock_hist.del_datetime IS '削除日時';
COMMENT ON COLUMN t_stock_hist.upd_count IS '更新回数';


COMMENT ON COLUMN t_stock_in.station_code IS 'ステーションコード';
COMMENT ON COLUMN t_stock_in.rsv_code IS '予約区分';
COMMENT ON COLUMN t_stock_in.rsv_seq IS '予約SEQ';
COMMENT ON COLUMN t_stock_in.item_code IS '品目コード';
COMMENT ON COLUMN t_stock_in.made_date IS '製造年月日';
COMMENT ON COLUMN t_stock_in.seq IS '連番';
COMMENT ON COLUMN t_stock_in.lotno IS '製造ロットNO';
COMMENT ON COLUMN t_stock_in.exec_conds IS '処理状況';
COMMENT ON COLUMN t_stock_in.loc_x IS '格納先X';
COMMENT ON COLUMN t_stock_in.loc_y IS '格納先Y';
COMMENT ON COLUMN t_stock_in.loc_z IS '格納先Z';
COMMENT ON COLUMN t_stock_in.add_datetime IS '登録日時';
COMMENT ON COLUMN t_stock_in.upd_datetime IS '更新日時';
COMMENT ON COLUMN t_stock_in.del_datetime IS '削除日時';
COMMENT ON COLUMN t_stock_in.upd_count IS '更新回数';


COMMENT ON COLUMN t_stock_out.station_code IS 'ステーションコード';
COMMENT ON COLUMN t_stock_out.station_mode IS 'ステーション状況';
COMMENT ON COLUMN t_stock_out.station_seq IS '予約SEQ';
COMMENT ON COLUMN t_stock_out.item_code IS '品目コード';
COMMENT ON COLUMN t_stock_out.made_date IS '製造年月日';
COMMENT ON COLUMN t_stock_out.seq IS '連番';
COMMENT ON COLUMN t_stock_out.lotno IS '製造ロットNO';
COMMENT ON COLUMN t_stock_out.exec_conds IS '処理状況';
COMMENT ON COLUMN t_stock_out.loc_x IS '格納先X';
COMMENT ON COLUMN t_stock_out.loc_y IS '格納先Y';
COMMENT ON COLUMN t_stock_out.loc_z IS '格納先Z';
COMMENT ON COLUMN t_stock_out.add_datetime IS '登録日時';
COMMENT ON COLUMN t_stock_out.upd_datetime IS '更新日時';
COMMENT ON COLUMN t_stock_out.del_datetime IS '削除日時';
COMMENT ON COLUMN t_stock_out.upd_count IS '更新回数';

