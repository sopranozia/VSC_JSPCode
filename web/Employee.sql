-- Table: public.Employee

-- DROP TABLE public."Employee";

CREATE TABLE public."Employee"
(
    id integer NOT NULL,
    name text COLLATE pg_catalog."default",
    surname text COLLATE pg_catalog."default",
    "birthDay" date,
    "telephoneNumber" text COLLATE pg_catalog."default",
    location text COLLATE pg_catalog."default",
    "maritalStatus" text COLLATE pg_catalog."default",
    branch text COLLATE pg_catalog."default",
    CONSTRAINT "Employee_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public."Employee"
    OWNER to postgres;