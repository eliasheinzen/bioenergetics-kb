START TRANSACTION;

CREATE TABLE vitamin (
 id BIGSERIAL,
 name TEXT NOT NULL DEFAULT 'NULL',
 vitamin_type_id BIGINT NOT NULL,
 discovered_by BIGINT NOT NULL
);


ALTER TABLE vitamin ADD CONSTRAINT vitamin_pkey PRIMARY KEY (id);

CREATE TABLE person (
 id BIGSERIAL,
 name TEXT NOT NULL DEFAULT 'NULL'
);


ALTER TABLE person ADD CONSTRAINT person_pkey PRIMARY KEY (id);

CREATE TABLE ocupation (
 id BIGSERIAL,
 name TEXT NOT NULL DEFAULT 'NULL',
 field_id BIGINT NOT NULL
);


ALTER TABLE ocupation ADD CONSTRAINT ocupation_pkey PRIMARY KEY (id);

CREATE TABLE person_ocupation (
 id BIGSERIAL,
 person_id BIGINT NOT NULL,
 ocupation_id BIGINT NOT NULL
);


ALTER TABLE person_ocupation ADD CONSTRAINT person_ocupation_pkey PRIMARY KEY (id);

CREATE TABLE vitamin_type (
 id BIGSERIAL,
 name TEXT NOT NULL DEFAULT 'NULL'
);


ALTER TABLE vitamin_type ADD CONSTRAINT vitamin_type_pkey PRIMARY KEY (id);

CREATE TABLE field (
 id BIGSERIAL,
 name TEXT
);


ALTER TABLE field ADD CONSTRAINT field_pkey PRIMARY KEY (id);

ALTER TABLE vitamin ADD CONSTRAINT vitamin_vitamin_type_id_fkey FOREIGN KEY (vitamin_type_id) REFERENCES vitamin_type(id);
ALTER TABLE vitamin ADD CONSTRAINT vitamin_discovered_by_fkey FOREIGN KEY (discovered_by) REFERENCES person(id);
ALTER TABLE ocupation ADD CONSTRAINT ocupation_field_id_fkey FOREIGN KEY (field_id) REFERENCES field(id);
ALTER TABLE person_ocupation ADD CONSTRAINT person_ocupation_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(id);
ALTER TABLE person_ocupation ADD CONSTRAINT person_ocupation_ocupation_id_fkey FOREIGN KEY (ocupation_id) REFERENCES ocupation(id);

COMMIT;
