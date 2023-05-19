CREATE TABLE region (
	r_id INT NOT NULL,
  	r_name VARCHAR(32),
  	
  	CONSTRAINT region_pk PRIMARY KEY(r_id)
);

CREATE TABLE loc (
	l_id INT NOT NULL,
  	l_name VARCHAR(32),
  	l_prosperity INT,
  
  	CONSTRAINT location_pk PRIMARY KEY(l_id)
);

CREATE TABLE player (
	p_id INT,
	p_name VARCHAR(32),
  	p_country VARCHAR(32),

  	p_region_id INT,
  	CONSTRAINT player_pk PRIMARY KEY(p_id),
  	CONSTRAINT player_region_fk FOREIGN KEY(p_region_id) REFERENCES region(r_id)
);

CREATE TABLE npc (
	n_id INT,
  	n_name VARCHAR(32),
  	n_hp INT,
  	n_level INT,
  
  	n_loc_id INT,
  	CONSTRAINT npc_pk PRIMARY KEY(n_id),
  	CONSTRAINT npc_location_fk FOREIGN KEY(n_loc_id) REFERENCES loc(l_id)
);

CREATE TABLE quest (
	q_id INT,
  	q_name VARCHAR(32),
  	q_desc VARCHAR(32),
  	q_reward VARCHAR(32),
  
  	CONSTRAINT quest_pk PRIMARY KEY(q_id)
);

CREATE TABLE item (
	i_id INT,
  	i_name VARCHAR(32),
  	i_desc VARCHAR(32),

  	CONSTRAINT item_pk PRIMARY KEY(i_id)
);

CREATE TABLE character (
	ch_id INT,
  	ch_name VARCHAR(32),
  	ch_hp INT,
  	ch_level INT,
  	ch_class VARCHAR(32),
  
  	ch_player_id INT,
  	ch_location_id INT,
  	CONSTRAINT character_pk PRIMARY KEY(ch_id),
  	CONSTRAINT character_player_fk FOREIGN KEY(ch_player_id) REFERENCES player(p_id),
  	CONSTRAINT character_location_fk FOREIGN KEY(ch_location_id) REFERENCES loc(l_id)
);

CREATE TABLE skill (
	s_id INT,
  	s_name VARCHAR(32),
	s_desc VARCHAR(32),
  
  	s_character_id INT,
  	CONSTRAINT skill_pk PRIMARY KEY(s_id),
  	CONSTRAINT skill_character_fk FOREIGN KEY(s_character_id) REFERENCES character(ch_id)
);

CREATE TABLE character_item (
	character_id INT,
  	item_id INT,
  
  	CONSTRAINT character_item_pk PRIMARY KEY(character_id, item_id),
  	CONSTRAINT character_item_ch_fk FOREIGN KEY(character_id) REFERENCES character(ch_id),
  	CONSTRAINT character_item__i_fk FOREIGN KEY(item_id) REFERENCES item(i_id)
); 

CREATE TABLE player_quest (
	player_id INT,
  	quest_id INT,
  
  	CONSTRAINT player_quest_pk PRIMARY KEY(player_id, quest_id),
  	CONSTRAINT player__quest_p_fk FOREIGN KEY(player_id) REFERENCES player(p_id),
  	CONSTRAINT player_quest_q_fk FOREIGN KEY(quest_id) REFERENCES quest(q_id)
);

CREATE TABLE character_quest (
	character_id INT,
  	quest_id INT,
  
  	CONSTRAINT character_quest_pk PRIMARY KEY(character_id, quest_id),
  	CONSTRAINT character_quest_ch_fk FOREIGN KEY(character_id) REFERENCES character(ch_id),
  	CONSTRAINT character_quest_q_fk FOREIGN KEY(quest_id) REFERENCES quest(q_id)
);


