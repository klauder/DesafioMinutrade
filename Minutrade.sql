create database klauder;
use klauder;

create table Cliente (
  Id int not null identity (1,1),
  Nome varchar (100) not null,
  Endereco varchar(255) not null,
  TelefoneResidencial varchar (30)not null,
  TelefoneCelular varchar (30)null,
  DataNascimento date null  
);

alter table Cliente add 
constraint PK_Cliente primary key (Id);

insert into Cliente 
  (Nome,Endereco,TelefoneResidencial)
values
('Jo�o Lucas Silva','Av. Afonso Pena,1212,Centro,Belo Horizonte,MG','(31) 3246-0987'),
('Frederico Santos Silva','Rua Walter Ianni,255,Bloco E - Salas 101,S�o Gabriel,Belo Horizonte-MG','(31) 2516-8764'),
('Jos� Maria Reis','Av. Ant�nio Carlos,1212,Lagoinha,Belo Horizonte-MG','(31) 2986-0010'),
('Larice Furtado Santos','Rua Pereira de Almeida,88,Nil�polis,Rio de janeiro-RJ','(21) 2432-6543'),
('Rubens Fonseca do Carmo','Av. Sete de Setembro,4847,Batel,Curitiba-PR','(41) 3462-1109'),
('Ist�fani Aparecida do Consola��o','Rua Fernando de Noronha,1534,Santa C�ndida,Curitiba-PR','(41) 3425-9987');
('Lucas Fonseca Dias','Rua Um,15,Santa C�ndida,S�o Luis-MA','(65) 3425-8587'),
('Klauder Felipe Dias','Rua Braz Molina,854,Hortol�ndia,S�o Paulo-SP','(11) 1145-9854'),
('Joaquim Silv�rio dos Reis','Rua Tiradentes,741,Centro,Tiradentes-MG','(32) 2568-9654'),
('Maria Aparecida Santos','Rua Santa M�nica,74,Santa C�ndida,Vit�ria-ES','(27) 2564-8744');

/* Cria o StoredProcedure [dbo].[AtualizaCliente] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Klauder Dias>
-- Create date: <04/12/13>
-- Description:	<Procedure que atualiza os dados do cliente informado>
-- =============================================

CREATE PROCEDURE [dbo].AtualizaCliente( 
@id VARCHAR(20) = NULL, 
@dataNascimento DATETIME = NULL,
@telefoneCelular VARCHAR(30) = NULL)
AS 
UPDATE Cliente 
SET DataNascimento = @dataNascimento,
    TelefoneCelular = @telefoneCelular
WHERE Id = @id
GO

/*Cria o StoredProcedure [dbo].[ObterClientes]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Klauder Dias>
-- Create date: <04/12/13>
-- Description:	<Procedure que obt�m os clientes com a data de nascimento e/ou 
--              telefone celular nulos>
-- =============================================

CREATE PROCEDURE [dbo].ObterClientes
AS
SELECT * FROM Cliente
WHERE TelefoneCelular is null 
  AND DataNascimento is null
GO


/*Cria o StoredProcedure [dbo].[ObterClientes]*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Klauder Dias>
-- Create date: <04/12/13>
-- Description:	<Procedure que retorna os clientes com a data de nascimento e/ou 
--              telefone celular nulos de acordo com o valor informado no par�metro @pesquisa>
-- =============================================
CREATE PROCEDURE [dbo].PesquisaCliente
(@pesquisa VARCHAR(100) = NULL)
AS
SELECT * FROM Cliente
WHERE TelefoneCelular is not null 
  AND DataNascimento is not null
  AND 
  (Nome like '' +@pesquisa + ''
    or TelefoneResidencial like '' +@pesquisa + ''
    or DataNascimento like '' +@pesquisa + '')    
GO