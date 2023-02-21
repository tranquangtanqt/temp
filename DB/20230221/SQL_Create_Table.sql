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


COMMENT ON TABLE m_conds IS '�����}�X�^';
COMMENT ON TABLE m_item IS '�i�ڃ}�X�^';
COMMENT ON TABLE m_station IS '�X�e�[�V�����}�X�^';
COMMENT ON TABLE m_stock IS '�݌Ƀ}�X�^';
COMMENT ON TABLE m_storage IS '�I�ԃ}�X�^';
COMMENT ON TABLE t_stock_info IS '�q�Ɏ��ԃe�[�u��';
COMMENT ON TABLE t_stock_hist IS '�݌ɗ����e�[�u��';
COMMENT ON TABLE t_stock_in IS '���ɏ��e�[�u��';
COMMENT ON TABLE t_stock_out IS '�o�ɏ��[�u��';


COMMENT ON COLUMN m_conds.conds_key IS '�����L�[';
COMMENT ON COLUMN m_conds.conds_seq IS '�����A��';
COMMENT ON COLUMN m_conds.conds_text1 IS '���������f�[�^�P';
COMMENT ON COLUMN m_conds.conds_text2 IS '���������f�[�^�Q';
COMMENT ON COLUMN m_conds.conds_text3 IS '���������f�[�^�R';
COMMENT ON COLUMN m_conds.conds_text4 IS '���������f�[�^�S';
COMMENT ON COLUMN m_conds.conds_text5 IS '���������f�[�^�T';
COMMENT ON COLUMN m_conds.conds_numb1 IS '�������l�f�[�^�P';
COMMENT ON COLUMN m_conds.conds_numb2 IS '�������l�f�[�^�Q';
COMMENT ON COLUMN m_conds.conds_numb3 IS '�������l�f�[�^�R';
COMMENT ON COLUMN m_conds.conds_numb4 IS '�������l�f�[�^�S';
COMMENT ON COLUMN m_conds.conds_numb5 IS '�������l�f�[�^�T';
COMMENT ON COLUMN m_conds.add_datetime IS '�o�^����';
COMMENT ON COLUMN m_conds.upd_datetime IS '�X�V����';
COMMENT ON COLUMN m_conds.del_datetime IS '�폜����';
COMMENT ON COLUMN m_conds.upd_count IS '�X�V��';


COMMENT ON COLUMN m_item.item_code IS '�i�ڃR�[�h';
COMMENT ON COLUMN m_item.cust_code IS '�׎�R�[�h';
COMMENT ON COLUMN m_item.item_name IS '�i�ږ�';
COMMENT ON COLUMN m_item.cust_name IS '�׎喼';
COMMENT ON COLUMN m_item.remarks1 IS '���l�P';
COMMENT ON COLUMN m_item.remarks2 IS '���l�Q';
COMMENT ON COLUMN m_item.remarks3 IS '���l�R';
COMMENT ON COLUMN m_item.add_datetime IS '�o�^����';
COMMENT ON COLUMN m_item.upd_datetime IS '�X�V����';
COMMENT ON COLUMN m_item.del_datetime IS '�폜����';
COMMENT ON COLUMN m_item.upd_count IS '�X�V��';


COMMENT ON COLUMN m_station.station_code IS '�X�e�[�V�����R�[�h';
COMMENT ON COLUMN m_station.station_name IS '�X�e�[�V������';
COMMENT ON COLUMN m_station.in_seq IS '���p�D�揇�i���j';
COMMENT ON COLUMN m_station.out_seq IS '���p�D�揇�i�o�j';
COMMENT ON COLUMN m_station.notused IS '�g�p�֎~';
COMMENT ON COLUMN m_station.station_posx IS '�X�e�[�V����X�ʒu';
COMMENT ON COLUMN m_station.station_posy IS '�X�e�[�V����Y�ʒu';
COMMENT ON COLUMN m_station.station_posz IS '�X�e�[�V����Z�ʒu';
COMMENT ON COLUMN m_station.remarks1 IS '���l�P';
COMMENT ON COLUMN m_station.remarks2 IS '���l�Q';
COMMENT ON COLUMN m_station.remarks3 IS '���l�R';
COMMENT ON COLUMN m_station.add_datetime IS '�o�^����';
COMMENT ON COLUMN m_station.upd_datetime IS '�X�V����';
COMMENT ON COLUMN m_station.del_datetime IS '�폜����';
COMMENT ON COLUMN m_station.upd_count IS '�X�V��';


COMMENT ON COLUMN m_stock.item_code IS '�i�ڃR�[�h';
COMMENT ON COLUMN m_stock.made_date IS '�����N����';
COMMENT ON COLUMN m_stock.seq IS '�A��';
COMMENT ON COLUMN m_stock.lotno IS '�������b�gNO';
COMMENT ON COLUMN m_stock.ship_mode IS '�o�׏�';
COMMENT ON COLUMN m_stock.quant IS '����';
COMMENT ON COLUMN m_stock.stock_in IS '���ɓ�';
COMMENT ON COLUMN m_stock.stock_out IS '�o�ɓ�';
COMMENT ON COLUMN m_stock.ristr_mode IS '�֎~�敪';
COMMENT ON COLUMN m_stock.loc_x IS '�i�[��X';
COMMENT ON COLUMN m_stock.loc_y IS '�i�[��Y';
COMMENT ON COLUMN m_stock.loc_z IS '�i�[��Z';
COMMENT ON COLUMN m_stock.add_datetime IS '�o�^����';
COMMENT ON COLUMN m_stock.upd_datetime IS '�X�V����';
COMMENT ON COLUMN m_stock.del_datetime IS '�폜����';
COMMENT ON COLUMN m_stock.upd_count IS '�X�V��';


COMMENT ON COLUMN m_storage.loc_x IS '�i�[��X';
COMMENT ON COLUMN m_storage.loc_y IS '�i�[��Y';
COMMENT ON COLUMN m_storage.loc_z IS '�i�[��Z';
COMMENT ON COLUMN m_storage.usage_code IS '�I�敪';
COMMENT ON COLUMN m_storage.priority_x IS 'X�����D�揇��';
COMMENT ON COLUMN m_storage.priority_y IS 'Y�����D�揇��';
COMMENT ON COLUMN m_storage.priority_z IS 'Z�����D�揇��';
COMMENT ON COLUMN m_storage.priority_t IS '�����D�揇��';
COMMENT ON COLUMN m_storage.remarks_1 IS '���l�P';
COMMENT ON COLUMN m_storage.remarks_2 IS '���l�Q';
COMMENT ON COLUMN m_storage.remarks_3 IS '���l�R';
COMMENT ON COLUMN m_storage.add_datetime IS '�o�^����';
COMMENT ON COLUMN m_storage.upd_datetime IS '�X�V����';
COMMENT ON COLUMN m_storage.del_datetime IS '�폜����';
COMMENT ON COLUMN m_storage.upd_count IS '�X�V��';


COMMENT ON COLUMN t_stock_info.loc_x IS '�i�[��X';
COMMENT ON COLUMN t_stock_info.loc_y IS '�i�[��Y';
COMMENT ON COLUMN t_stock_info.loc_z IS '�i�[��Z';
COMMENT ON COLUMN t_stock_info.usage_code IS '�I�敪';
COMMENT ON COLUMN t_stock_info.cargo_mode IS '�ו��敪';
COMMENT ON COLUMN t_stock_info.ship_mode IS '�o�ɋ敪';
COMMENT ON COLUMN t_stock_info.item_code IS '�i�ڃR�[�h';
COMMENT ON COLUMN t_stock_info.made_date IS '�����N����';
COMMENT ON COLUMN t_stock_info.seq IS '�A��';
COMMENT ON COLUMN t_stock_info.lotno IS '�������b�gNO';
COMMENT ON COLUMN t_stock_info.add_datetime IS '�o�^����';
COMMENT ON COLUMN t_stock_info.upd_datetime IS '�X�V����';
COMMENT ON COLUMN t_stock_info.del_datetime IS '�폜����';
COMMENT ON COLUMN t_stock_info.upd_count IS '�X�V��';


COMMENT ON COLUMN t_stock_hist.item_code IS '�i�ڃR�[�h';
COMMENT ON COLUMN t_stock_hist.made_date IS '�����N����';
COMMENT ON COLUMN t_stock_hist.seq IS '�A��';
COMMENT ON COLUMN t_stock_hist.hist_seq IS '����SEQ';
COMMENT ON COLUMN t_stock_hist.hist_code IS '�����敪';
COMMENT ON COLUMN t_stock_hist.ship_mode IS '���s����';
COMMENT ON COLUMN t_stock_hist.station_code IS '�X�e�[�V�����R�[�h';
COMMENT ON COLUMN t_stock_hist.vehicle_no IS '�g���b�N�Ԕ�';
COMMENT ON COLUMN t_stock_hist.loc_x IS '�i�[��X';
COMMENT ON COLUMN t_stock_hist.loc_y IS '�i�[��Y';
COMMENT ON COLUMN t_stock_hist.loc_z IS '�i�[��Z';
COMMENT ON COLUMN t_stock_hist.add_datetime IS '�o�^����';
COMMENT ON COLUMN t_stock_hist.upd_datetime IS '�X�V����';
COMMENT ON COLUMN t_stock_hist.del_datetime IS '�폜����';
COMMENT ON COLUMN t_stock_hist.upd_count IS '�X�V��';


COMMENT ON COLUMN t_stock_in.station_code IS '�X�e�[�V�����R�[�h';
COMMENT ON COLUMN t_stock_in.rsv_code IS '�\��敪';
COMMENT ON COLUMN t_stock_in.rsv_seq IS '�\��SEQ';
COMMENT ON COLUMN t_stock_in.item_code IS '�i�ڃR�[�h';
COMMENT ON COLUMN t_stock_in.made_date IS '�����N����';
COMMENT ON COLUMN t_stock_in.seq IS '�A��';
COMMENT ON COLUMN t_stock_in.lotno IS '�������b�gNO';
COMMENT ON COLUMN t_stock_in.exec_conds IS '������';
COMMENT ON COLUMN t_stock_in.loc_x IS '�i�[��X';
COMMENT ON COLUMN t_stock_in.loc_y IS '�i�[��Y';
COMMENT ON COLUMN t_stock_in.loc_z IS '�i�[��Z';
COMMENT ON COLUMN t_stock_in.add_datetime IS '�o�^����';
COMMENT ON COLUMN t_stock_in.upd_datetime IS '�X�V����';
COMMENT ON COLUMN t_stock_in.del_datetime IS '�폜����';
COMMENT ON COLUMN t_stock_in.upd_count IS '�X�V��';


COMMENT ON COLUMN t_stock_out.station_code IS '�X�e�[�V�����R�[�h';
COMMENT ON COLUMN t_stock_out.station_mode IS '�X�e�[�V������';
COMMENT ON COLUMN t_stock_out.station_seq IS '�\��SEQ';
COMMENT ON COLUMN t_stock_out.item_code IS '�i�ڃR�[�h';
COMMENT ON COLUMN t_stock_out.made_date IS '�����N����';
COMMENT ON COLUMN t_stock_out.seq IS '�A��';
COMMENT ON COLUMN t_stock_out.lotno IS '�������b�gNO';
COMMENT ON COLUMN t_stock_out.exec_conds IS '������';
COMMENT ON COLUMN t_stock_out.loc_x IS '�i�[��X';
COMMENT ON COLUMN t_stock_out.loc_y IS '�i�[��Y';
COMMENT ON COLUMN t_stock_out.loc_z IS '�i�[��Z';
COMMENT ON COLUMN t_stock_out.add_datetime IS '�o�^����';
COMMENT ON COLUMN t_stock_out.upd_datetime IS '�X�V����';
COMMENT ON COLUMN t_stock_out.del_datetime IS '�폜����';
COMMENT ON COLUMN t_stock_out.upd_count IS '�X�V��';

