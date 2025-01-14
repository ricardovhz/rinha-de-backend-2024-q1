CREATE TABLE public."Clientes" (
	"Id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	"Limite" int4 NOT NULL,
	"Saldo" int4 NOT NULL,
	CONSTRAINT "PK_Clientes" PRIMARY KEY ("Id")
);

CREATE TABLE public."Transacoes" (
	"Id" uuid NOT NULL,
	"ClienteId" int4 NOT NULL,
	"Valor" int4 NOT NULL,
	"Tipo" bpchar(1) NOT NULL,
	"Descricao" varchar(10) NOT NULL,
	"Data" timestamptz NOT NULL,
	CONSTRAINT "PK_Transacoes" PRIMARY KEY ("Id")
);
CREATE INDEX "IX_Transacoes_ClienteId" ON public."Transacoes" USING btree ("ClienteId");
ALTER TABLE public."Transacoes" ADD CONSTRAINT "FK_Transacoes_Clientes_ClienteId" FOREIGN KEY ("ClienteId") REFERENCES public."Clientes"("Id") ON DELETE CASCADE;

INSERT INTO public."Clientes" ("Id", "Limite", "Saldo")
VALUES
    (1, 100000, 0),
    (2, 80000, 0),
    (3, 1000000, 0),
    (4, 10000000, 0),
    (5, 500000, 0)
