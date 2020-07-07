//////////////////////////////////////////////////////////////////////////////////
// Engineer: Rafael de Oliveira Calçada (rafaelcalcada@gmail.com) 
// 
// Create Date: 06.07.2020 21:30:07
// Module Name: bus_arbiter
// Project Name: Steel SoC 
// Description: Bus arbiter 
// 
// Dependencies: -
// 
// Version 0.01
// 
//////////////////////////////////////////////////////////////////////////////////

/*********************************************************************************

MIT License

Copyright (c) 2020 Rafael de Oliveira Calçada

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

-----------------------------------------------------------------------------

Licença MIT

Copyright (c) 2019 Rafael de Oliveira Calçada

Permissão é concedida, gratuitamente, a qualquer pessoa que obtenha uma
cópia deste software e dos arquivos de documentação associados
(o "Software"), para negociar sobre o Software sem restrições, incluindo,
sem limitação, os direitos de uso, cópia, modificação, fusão, publicação, 
distribuição, sublicenciamento e/ou venda de cópias do Software e o direito
de permitir que pessoas a quem o Software seja fornecido o façam, sob as
seguintes condições:

O aviso de direitos autorais acima e este aviso de permissão devem ser
incluídos em todas as cópias ou partes substanciais do Software.

O SOFTWARE É FORNECIDO "TAL COMO ESTÁ", SEM GARANTIA DE QUALQUER TIPO,
EXPRESSA OU IMPLÍCITA, INCLUINDO, MAS NÃO SE LIMITANDO A GARANTIAS DE
COMERCIALIZAÇÃO, ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA E NÃO INFRAÇÃO.
EM NENHUM CASO OS AUTORES OU TITULARES DE DIREITOS AUTORAIS SERÃO
RESPONSÁVEIS POR QUALQUER REIVINDICAÇÃO, DANOS OU OUTRA RESPONSABILIDADE,
SEJA EM AÇÕES CIVIS, PENAIS OU OUTRAS, PROVENIENTE, FORA OU EM CONEXÃO
COM O SOFTWARE OU O USO RELACIONADO AO SOFTWARE.

********************************************************************************/

`timescale 1ns / 1ps

module bus_arbiter(
    input wire CLK,
    input wire RESET,
    
    // Connection with the core
    input wire [31:0] D_ADDR,
    input wire [31:0] DATA_OUT,
    input wire WR_REQ,
    input wire [3:0] WR_MASK,
    output wire [31:0] DATA_IN,
    
    // PORT #1 - Connected to GPIO
    output wire [31:0] D_ADDR_1,
    output wire [31:0] DATA_OUT_1,
    output wire WR_REQ_1,
    output wire [3:0] WR_MASK_1,
    input wire [31:0] DATA_IN_1,
    
    // PORT #2 - Connected to MAIN MEMORY
    output wire [31:0] D_ADDR_2,
    output wire [31:0] DATA_OUT_2,
    output wire WR_REQ_2,
    output wire [3:0] WR_MASK_2,
    input wire [31:0] DATA_IN_2
    );
    
    reg last_access;
    wire gpio_access = &D_ADDR[31:10];
    
    always @(posedge CLK or posedge RESET)
    begin
        if(RESET) last_access <= 1'b0;
        else last_access <= gpio_access;
    end
    
    assign D_ADDR_1 = gpio_access ? D_ADDR : 32'b0;
    assign DATA_OUT_1 = gpio_access ? DATA_OUT : 32'b0;
    assign WR_REQ_1 = gpio_access ? WR_REQ : 1'b0;
    assign WR_MASK_1 = gpio_access ? WR_MASK : 4'b0;
    
    assign D_ADDR_2 = ~gpio_access ? D_ADDR : 32'b0;
    assign DATA_OUT_2 = ~gpio_access ? DATA_OUT : 32'b0;
    assign WR_REQ_2 = ~gpio_access ? WR_REQ : 1'b0;
    assign WR_MASK_2 = ~gpio_access ? WR_MASK : 4'b0;
    
    assign DATA_IN = last_access ? DATA_IN_1 : DATA_IN_2;
    
endmodule