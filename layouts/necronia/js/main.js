$(document).ready(function() {	
	// Account Options
	$('#hide-char').live('click', function(e) {
		
		var hideChar = $(this);
		var id = hideChar.attr('data-id');
		//alert(id);
		
		$.ajax({
			url: 'ajaxmonteiro.php',
			type: 'POST',
			data: {
				action: 'hide-character',
				charID: id
			},
			dataType: "json",
			success: function(data) {
				if (data.status == "success") {
					if (data.act == "hide") {
						hideChar.find('i').removeClass('fa-eye-slash').addClass('fa-eye');
						hideChar.attr('title', 'Mostrar InformaÃ§Ãµes do Personagem');
					} else {
						hideChar.find('i').removeClass('fa-eye').addClass('fa-eye-slash');
						hideChar.attr('title', 'Esconder InformaÃ§Ãµes do Personagem');						
					}
				} 
			}
		});
		e.preventDefault();
	});
	
	// ComentÃ¡rio do personagem
	$('#info-char').live('click', function(e) {
		var $this = $(this);
		var id = $this.attr('data-id');
		
		$('#modal-' + id).modal();
		e.preventDefault();
		
	});
	
	$('#delete-char').live('click', function(e) {
		e.preventDefault();
		var delChar = $(this);
		var id = delChar.attr('data-id');
		
		$.ajax({
			url: 'ajaxmonteiro.php',
			type: 'POST',
			data: {
				action: 'del-character',
				charID: id
			},
			dataType: "json",
			success: function(data) {
				if (data.status == "success") {
					if (data.act == "deleted") {
						delChar.find('i').removeClass('fa-trash').addClass('fa-mail-reply');
						delChar.attr('title', 'Recuperar Personagem Deletado');
                        
                        swal({
                            title: 'Aviso',
                            text: 'O personagem serÃ¡ excluido em 3 dias. AtÃ© lÃ¡ vocÃª poderÃ¡ cancelar a exclusÃ£o.',
                            icon: 'info'
                        });
					} else {
						$('p#info-delete').hide();
						delChar.find('i').removeClass('fa-mail-reply').addClass('fa-trash');
						delChar.attr('title', 'Excluir Personagem');
                        
                         swal({
                            title: 'Aviso',
                            text: 'VocÃª recuperou o personagem, e ele nÃ£o serÃ¡ mais excluido.',
                            icon: 'success'
                        });											
					}
				} 
			}
		});
	});
	
	// Tab top level e guild top
	$('.side-tab a').on('click', function(e) {
		e.preventDefault();
		
		var currentAttrValue = $(this).attr('href');
		
		$('.side-tab-content ' + currentAttrValue).addClass('active').siblings().removeClass('active');
		$(this).parent('li').addClass('active').siblings().removeClass('active');
	});
	
	// Guilds
	$('.tabs-links li a').on('click', function(e) {
		e.preventDefault();
		
		var currentAttrValue = $(this).attr('href');
		
		$('.tabs-content ' + currentAttrValue).addClass('active').siblings().removeClass('active');
		$(this).parent('li').addClass('active').siblings().removeClass('active');
	});
    
    // Store
	$('.store-tabs-links li a').on('click', function(e) {
		e.preventDefault();
		
		var currentAttrValue = $(this).attr('href');
		
		$('.store-tabs-content ' + currentAttrValue).addClass('active').siblings().removeClass('active');
		$(this).parent('li').addClass('active').siblings().removeClass('active');
	});
	
	// Menu Account Tab
	$('.account-menu a').click(function(e) {
		e.preventDefault();
		var currentAttrValue = $(this).attr('href');
		
		$('.account-content ' + currentAttrValue).addClass('active').siblings().removeClass('active');		
		$(this).parent('li').addClass('active').siblings().removeClass('active');
	});
	
	// Login Dropdown
	$('#login-trigger').click(function() {
		$(this).parent().next('#login-content').slideToggle();
		$(this).toggleClass('active');
		
		if ($(this).hasClass('active'))
			$(this).find('i.fa').removeClass('fa-sort-down').addClass('fa-sort-up');
		else
			$(this).find('i.fa').removeClass('fa-sort-up').addClass('fa-sort-down');
	});
	
	// Login Dropdown
	$('.toggle').click(function(e) {
		e.preventDefault();

		var $this = $(this);

		if ($this.next().hasClass('show')) {
			$this.next().removeClass('show');
			$this.next().slideUp(350);
		} else {
			$this.parent().parent().find('li .accordion-content').removeClass('show');
			$this.parent().parent().find('li .accordion-content').slideUp(350);
			$this.next().toggleClass('show');
			$this.next().slideToggle(350);
		}
	});
	
	
	//Forum
	$(".remove-thread").on('click', function(e){
		e.preventDefault();
		
		var thread_id = $(this).attr('data-id');
		
		var sure = confirm("VocÃª tem certeza que deseja apagar este tÃ³pico?");
		
		if (sure) {
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				data: {
					action: "thread_delete",
					threadId: thread_id
				},
				dataType: "json",
				success: function(data) {
					if (data.status == "success") {
						location.reload();
					}
				}
			});
		}
	});
	
	$(".sticky-thread").on('click', function(e) {
		e.preventDefault();
		
		var thread_id = $(this).attr('data-id');
		
		$.ajax({
			url: 'ajaxmonteiro.php',
			type: 'POST',
			data: {
				action: "thread_sticky",
				threadId: thread_id
			},
			dataType: "json",
			success: function(data) {
				if (data.status == "success") {
					location.reload();
				}
			}
		});
	});
	
	$(".close-thread").on('click', function(e) {
		e.preventDefault();
		
		var thread_id = $(this).attr('data-id');
		
		$.ajax({
			url: 'ajaxmonteiro.php',
			type: 'POST',
			data: {
				action: "thread_close",
				threadId: thread_id
			},
			dataType: "json",
			success: function(data) {
				if (data.status == "success") {
					location.reload();
				}
			}
		});
	});
	
	$(".remove-post").on('click', function(e) {
		e.preventDefault();
		
		var thread_id = $(this).attr('data-id');
		var sure = confirm("VocÃª tem certeza que deseja apagar este tÃ³pico?");
		
		if (sure) {
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				data: {
					action: "remove_post",
					threadId: thread_id
				},
				dataType: "json",
				success: function(data) {
					if (data.status == "success") {
						location.reload();
					}
				}
			});
		}
	});
	
	
	$("a#map-photo").fancybox();
	$("a#wiki-pic").fancybox();
	$("a#houses-pic").fancybox();
});

function removeClassError() {
	$('#account_create').removeClass("error");
	$('#password_create').removeClass("error");
	$('#password_create2').removeClass("error");
	$('#email_create').removeClass("error");
	$('#character_create').removeClass("error");
	$('#rules_create').removeClass("error");
	
	$('#account_errormessage').hide();
	$('#password_errormessage').hide();
	$('#email_errormessage').hide();
	$('#character_errormessage').hide();
	$('#rules_errormessage').hide();
}

$(document).ready(function() {
	
	// Alterar Senha da conta
	$('#change-password-btn').click(function(e) {
		e.preventDefault();
		
		var dados = {};
		var prosseguir = true;
		dados['action'] = 'changepassword';
		
		$.each($('#change-password input, #change-password select'), function(i, v) {
			if (v.type !== 'submit') {
				dados[v.name] = v.value;
			}
		});
		
		//validando dados, enviando/mostrando erros
		$.ajax({
			url: 'ajaxmonteiro.php',
			type: 'POST',
			dataType: 'json',
			data: dados,
			beforeSend: function() {
				$('#change-password input, #change-password select').prop("disabled", true);
				$('.loadingAccount').show();
			},
			success: function(resp) {
				if (resp.status) {
					$('.loadingAccount').hide();
					$('#change-password input, #change-password select').prop("disabled", false);					
					if ($('#change-password-btn').before('<input type="hidden" name="acao" value="processchangepassword">')) {					
						$('#change-password').submit();
					}
					return false;
				} else {
					$('#old_password').removeClass('error');
					$('#old_password_error').hide();
					$('#password_create').removeClass("error");
					$('#password_create2').removeClass("error");
					$('#password_errormessage').hide();
					
					$.each(resp.campos, function(i, v) {	
						
						if (i == "oldpassword") {
							$('#old_password').addClass('error');
							$('#old_password_error').html(v.erro).show();
						}
												
						if (i == "password") {
							$('#password_create').addClass("error");
							$('#password_create2').addClass("error");
							$('#password_errormessage').html(v.erro).show();
						}						
						//console.log(i + " => " + v.erro);
					});					
					$('.loadingAccount').hide();
					$('#change-password input, #change-password select').prop("disabled", false);
					return false;					
				}
			}
		});
	});
	
	// Registrando Conta
	$('#account-register-btn').click(function(e) {
		var dados = {}
		var prosseguir = true;
		dados['action'] = 'registeraccount';
		$.each($('#account-register input, #account-register select'), function(i, v) {
			if (v.type !== 'submit') {
				dados[v.name] = v.value;
			}
		});
		
		if (dados['first_name'] == "") {
			$('#fname-register').addClass('error');
			$('#fname-register .error-message').html('Ã‰ necessÃ¡rio colocar seu primeiro nome.').slideToggle();
			prosseguir = false;
		}
		
		if (dados['last_name'] == "") {
			$('#lname-register').addClass('error');
			$('#lname-register .error-message').html('Ã‰ necessÃ¡rio colocar um sobrenome.').slideToggle();
			prosseguir = false;
		}
		
		if (prosseguir) {
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				dataType: 'json',
				data: dados,
				beforeSend: function() {
					$('#account-register input, #account-register select').prop("disabled", true);
					$('.loadingAccount').show();
				},
				success: function(resp) {
					if (resp.status) {
						$("#field-info").slideToggle("slow");
						$("#field-rk").slideToggle("slow");
						$(".recovery-key").html(resp.rk);
						$('.loadingAccount').hide();
						$('#account-register-btn').hide();
					}
				}
			})
		}		

		$.each(dados, function(i, v) {
			console.log(i + " => " + v);
		});
		
		e.preventDefault();
	});
});

/********* CRIAÃ‡ÃƒO DA CONTA E DO PRIMEIRO PERSONAGEM *********/
var dados = {};
$(document).ready(function(){	
	$('#createAccountBtn').on('click', function(e){
		e.preventDefault();
		
		// pegando dados do formulario
		dados['acao'] = 'newaccount'; // seta acao da criaÃ§ao da conta
		$.each($('#createAccount input, #createAccount select'), function(i, v){
			if (v.type !== 'submit') {
				dados[v.name] = v.value;
			}
		});
		
		//validando dados, enviando/mostrando erros
		$.ajax({
			url: 'ajaxmonteiro.php',
			type: 'POST',
			dataType: 'json',
			data: dados,
			beforeSend: function() {
				$('#createAccount input, #createAccount select').prop("disabled", true);
				$('.loadingAccount').show();
			},
			success: function(resp) {
				if (resp.status) {
					$('.loadingAccount').hide();
					$('#createAccount input, #createAccount select').prop("disabled", false);					
					if ($('#createAccountBtn').before('<input type="hidden" name="acao" value="processaccount">')) {					
						$('#createAccount').submit();
					}
					return false;
				} else {
					removeClassError();
					$.each(resp.campos, function(i, v) {					
						$('#'+i+'_create').addClass("error");						
						if (i == "password") {
							$('#password_create2').addClass("error");
						}						
						$('#'+i+'_errormessage').html(v.erro).show();
						//console.log(i + " => " + v.erro);
					});					
					$('.loadingAccount').hide();
					$('#createAccount input, #createAccount select').prop("disabled", false);
					return false;					
				}
			}
		});
		
		
		
		$.each(dados, function(i, v) {
			console.log(i + " => " + v);
		});
		
		
		return false;
	});
});

$(document).ready(function () {
    var ckbox = $('input[name=rules]');

    $('input[name=rules]').on('click',function () {
        if (ckbox.is(':checked')) {
            $(this).val("yes");
        } else {
            $(this).val("no");
        }
    });
});

///  Guild Page
$(document).ready(function() {
	// Deletando uma guild / by admin
	$('#del-guild').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var guildID = $this.attr('data-id');
		var sure = confirm("VocÃª tem certeza que deseja excluir essa Guild?");
		
		if (sure) {
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				data: {
					action: "delete_guild",
					guildId: guildID
				},
				dataType: "json",
				success: function(data) {
					if (data.status == "success") {
						//location.reload();
						$this.parent().parent().slideToggle("slow");
					}
				}
			});
		}
	});
	
	//Removendo membro da Guild
	$('#kick-guild-member').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var data = $this.attr('data-id').split('-');
		var guildID = data[0];
		var playerID = data[1];
		var sure = confirm("VocÃª tem certeza que deseja remover essa membro da Guild?");
		
		if (sure) {
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				data: {
					action: "remove_guild_member",
					guildId: guildID,
					playerId: playerID
				},
				dataType: "json",
				success: function(data) {
					if (data.status == "success") {
						//location.reload();
						$this.parent().parent().parent().slideToggle("slow");
					}
				}
			});
		}
	});
	
	//Cancelando convite de membro da Guild
	$('#cancel-guild-invite').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var data = $this.attr('data-id').split('-');
		var guildID = data[0];
		var playerID = data[1];
		var sure = confirm("VocÃª tem certeza que deseja cancelar o convite para esse membro entrar na Guild?");
		
		if (sure) {
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				data: {
					action: "cancel_guild_invite",
					guildId: guildID,
					playerId: playerID
				},
				dataType: "json",
				success: function(data) {
					if (data.status == "success") {
						//location.reload();
						$this.parent().parent().slideToggle("slow");
					}
				}
			});
		}
	});
	
	//Excluindo ranks da Guild
	$('#del-rank').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var data = $this.attr('data-id').split('-');
		var rankID = data[0];
		var guildID = data[1];
		var sure = confirm("VocÃª tem certeza que deseja excluir esse Rank da Guild?");
		
		if (sure) {
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				data: {
					action: "del_guild_rank",
					rankId: rankID,
					guildId: guildID
				},
				dataType: "json",
				success: function(data) {
					if (data.status == "success") {
						//location.reload();
						$this.parent().parent().slideToggle("slow");
					} else {
                        swal({
                            title: 'Erro',
                            text: data.erro,
                            icon: 'error'
                        });
					}
				}
			});
		}
	});
	
	//Aceitando Guild War
	$('#accept-guild-war').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var data = $this.attr('data-id').split('-');
		var guildID = data[0];
		var warID = data[1];
		var sure = confirm("VocÃª tem certeza que deseja o aceitar o convite para uma guerra com esta Guild?");
		
		if (sure) {
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				data: {
					action: "accept_guild_war",
					guildId: guildID,
					warId: warID
				},
				dataType: "json",
				success: function(data) {
					if (data.status == "success") {
						alert("VocÃª agora estÃ¡ em guerra!");
						location.reload();
					} else {
						alert(data.erro);
					}
				}
			});
		}
	});
	
	//Rejeitando Guild War
	$('#reject-guild-war').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var data = $this.attr('data-id').split('-');
		var guildID = data[0];
		var warID = data[1];
		var sure = confirm("VocÃª tem certeza que deseja rejeitar o convite para uma guerra com esta Guild?");
		
		if (sure) {
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				data: {
					action: "reject_guild_war",
					guildId: guildID,
					warId: warID
				},
				dataType: "json",
				success: function(data) {
					if (data.status == "success") {
						alert("VocÃª rejeitou o convite para uma guerra com essa Guild.");
						location.reload();
					} else {
						alert(data.erro);
					}
				}
			});
		}
	});
	
	//Cancelando Guild War
	$('#cancel-guild-war').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var data = $this.attr('data-id').split('-');
		var guildID = data[0];
		var warID = data[1];
		var sure = confirm("VocÃª tem certeza que deseja cancelar o convite para uma guerra com esta Guild?");
		
		if (sure) {
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				data: {
					action: "cancel_guild_war",
					guildId: guildID,
					warId: warID
				},
				dataType: "json",
				success: function(data) {
					if (data.status == "success") {
						alert("VocÃª cancelou o convite para uma guerra com essa Guild.");
						location.reload();
					} else {
						alert(data.erro);
					}
				}
			});
		}
	});
	
	//Alterando Nick do Membro da Guild
	$('.change-guild-nick').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var data = $this.parent().find('input[name=data-id]').val().split('-');
		var nick = $this.parent().find('input[name=guildnick]').val();
		var guildID = data[0];
		var playerID = data[1];
		
		
		$.ajax({
			url: 'ajaxmonteiro.php',
			type: 'POST',
			data: {
				action: "change_guild_nick",
				guildId: guildID,
				playerId: playerID,
				guildNick: nick
			},
			dataType: "json",
			success: function(data) {
				if (data.status == "success") {
					location.reload();
				}
			}
		});
	});
});

/********* FIM CRIAÃ‡ÃƒO DA CONTA E DO PRIMEIRO PERSONAGEM *********/

/********* CRIAÃ‡ÃƒO DO PERSONAGEM NA CONTA JA CRIADA *********/
$(document).ready(function(){
	$('#newCharacter').on('click', function() {
		dados['acao'] = 'newcharacter'; // seta acao da criaÃ§ao da conta
		
		$.each($('#createNewCharacter input, #createNewCharacter select'), function(i, v){
			if (v.type !== 'submit') {
				dados[v.name] = v.value;
			}
		});
		
		/*
		$.each(dados, function(i, v) {
			console.log(i + " => " + v);
		});
		*/
		
		$.ajax({
			url: 'ajaxmonteiro.php',
			type: 'POST',
			dataType: 'json',
			data: dados,
			beforeSend: function() {
				$('#createNewCharacter input, #createNewCharacter select').prop("disabled", true);
				$('.loadingAccount').show();
			},
			success: function(resp) {
				if (resp.status) {
					$('.loadingAccount').hide();
					
					$('#createNewCharacter input, #createNewCharacter select').prop("disabled", false);					
					$('#createNewCharacter').submit();
					return false;
				} else {										
					$('#character_create').addClass("error");
					$('#character_errormessage').html(resp.erro).show();					
					
					$('.loadingAccount').hide();
					$('#createNewCharacter input, #createNewCharacter select').prop("disabled", false);
					return false;
					
				}
			}
		});		
		return false;
	});
});
/********* FIM DA CRIAÃ‡ÃƒO DO PERSONAGEM NA CONTA JA CRIADA *********/

// Donate

// mouse over effect for products
  function MouseOverServiceID(a_ServiceID)
  {
    $('#coin-over-' + a_ServiceID).css('background-image', 'url(layout/img/donate/coinpacket-container-over.png)');
  }

  // mouse out effect for products
  function MouseOutServiceID(a_ServiceID)
  {
    $('#coin-over-' + a_ServiceID).css('background-image', '');
  }

function ChangeService(a_ServiceID) {    
    $('#ServiceID-' + a_ServiceID).attr('checked', 'checked');
    $('.coinspacket-container').css('background-color', '');
    
    $('.coinspacket-selected').css('background-image', '');
    $('#coin-selected-' + a_ServiceID).css('background-image', 'url(layout/img/donate/coinpacket-selected.png)');
    
    $('#packetID').val('packet-' + a_ServiceID);
}

// mouse over effect for payment methods
  function MouseOverPMCID()
  {
    $('.payment-over').css('background-image', 'url(layout/img/donate/payment-container-over.png)');
  }

  // mouse out effect for payment methods
  function MouseOutPMCID()
  {
    $('.payment-over').css('background-image', '');
  }
  
  function ChangePMC(a_PaymentID) {    
    $('#PaymentID-' + a_PaymentID).attr('checked', 'checked');
    $('.main-payment-container').css('background-color', '');
    
    $('.payment-selected').css('background-image', '');
    $('#payment-selected-' + a_PaymentID).css('background-image', 'url(layout/img/donate/coinpacket-selected.png)');
	
	$('#paymentID').val(a_PaymentID);
}

$(document).ready(function() {
    $('#donateNow').click(function(e) {
        e.preventDefault();
        
        var service = '';
		var payment = '';
        var donateRef = $('#buyREF').val();
        
        if ($('#packetID').val() != "") {
            service = $('#packetID').val();
        }
		
		 if ($('#paymentID').val() != "") {
            payment = $('#paymentID').val();
        }
        
        $.ajax({
            url: 'ajaxmonteiro.php',
			type: 'POST',
			dataType: 'json',
            data: {
                action: "donating-check",
                packetId: service,
				paymentId: payment,
                donateREF: donateRef
            },
            beforeSend: function() {
				$('.loadingAccount').show();
			},
            success: function(c) {
                $('.loadingAccount').hide();
                if (c.status) {
					
					if (c.pmtype == "pagseguro") {
						// pagseguro
						
						$('#donateSystem').append('<input type="hidden" name="itemAmount1" type="hidden" value="'+c.price+'.00">');
						$('#donateSystem').append('<input type="hidden" name="itemQuantity1" value="1">');
						
						$('#donateSystem').submit();
					} else {
						// transf
						
						var url_atual = window.location.href;
						window.location.assign(url_atual + "&action=transfer&bank=" + c.transferbank + "&reference=" + c.payref);
					}             
                } else {
					swal({
                        title: 'Erro',
						text: c.msg,
                        icon: 'error'
                    });
                }
            }
        });
        
        //alert(service);
    });
});

// Donate Finish

// Admin Panel

$(document).ready(function() {
	
	$('#create-ticker').click(function(e) {
		e.preventDefault();
		
		var icon = $('#ticker-icon').val();
		var ticker = $('#ticker-text').val();
		var char = $('#ticker-char').val();
		var prosseguir = true;
		
		if (icon == 0) {
			$('#ticker-error').html("Ã‰ necessÃ¡rio selecionar uma categoria para qual seu ticker sera criado.").slideDown();
			prosseguir = false;
		}
		
		if  (prosseguir) {
			if (ticker == "") {
				$('#ticker-error').html("Ã‰ necessÃ¡rio incluir um texto ao seu Ticker.").slideDown();
				prosseguir = false;
			}
		}
		
		if  (prosseguir) {
			if (char == 0) {
				$('#ticker-error').html("Ã‰ necessÃ¡rio escolher um personagem antes de criar seu Ticker.").slideDown();
				prosseguir = false;
			}
		}
		
		if  (prosseguir) {
			$('#ticker-error').hide();
			
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				dataType: 'json',
				data: {
					action: "ticker-create",
					tickerIcon: icon,
					tickerText: ticker,
					tickerChar: char
				},
				success: function(c) {
					if (c.status) {
						location.reload();
					}
				}
			});
		}
	});
	
	$('#delete-ticker').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var tickerID = $this.attr('data-id');
		var sure = confirm("VocÃª tem certeza que deseja excluir esse Ticker?");
		
		if (sure) {
			$.ajax({
				url: 'ajaxmonteiro.php',
				type: 'POST',
				data: {
					action: "ticker-delete",
					tickerId: tickerID
				},
				dataType: "json",
				success: function(data) {
					if (data.status) {
						location.reload();
					}
				}
			});
		}
	});
	
	// Store Category Status
	$('#change-store-category-status').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var catID = $this.attr('data-id');
		
		$.ajax({
			url: 'ajaxmonteiro.php',
			type: 'POST',
			data: {
				action: "cat-status",
				catId: catID
			},
			dataType: "json",
			success: function(data) {
				if (data.status) {
					if (data.cat == 0) {
						$this.removeClass('remove-btn').addClass('success-btn');
						$this.text('Ativar');
					} else {
						$this.removeClass('success-btn').addClass('remove-btn');
						$this.text('Desativar');
					}

					swal({
						title: 'Status Alterado',
						text: 'VocÃª alterou com sucesso o status dessa categoria.',
						icon: "success",
					});
				}
			}
		});
	});
	
	$('#delete-last-offer').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var offerID = $this.attr('data-id');
		
		swal({
		  title: "VocÃª tem certeza?",
		  text: "Depois de excluida essa oferta nÃ£o poderÃ¡ mais ser vista in-game!",
		  icon: "warning",
		  buttons: ["Cancelar", "Sim, excluir!"],
		  dangerMode: true,
		})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: {
						action: "last-offer-del",
						offerId: offerID
					},
					dataType: "json",
					success: function(data) {
						if (data.status) {
							$this.parent().parent().remove();
							swal("Oferta excluida com sucesso!", {
							  	icon: "success",
							});
						}
					}
				});
			}
		});
	});
	
	$('#delete-offer').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var offerID = $this.attr('data-id');
		
		swal({
		  title: "VocÃª tem certeza?",
		  text: "Depois de excluida essa oferta nÃ£o poderÃ¡ mais ser vista in-game!",
		  icon: "warning",
		  buttons: ["Cancelar", "Sim, excluir!"],
		  dangerMode: true,
		})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: {
						action: "offer-del",
						offerId: offerID
					},
					dataType: "json",
					success: function(data) {
						if (data.status) {
							$this.parent().parent().slideUp();
							swal("Oferta excluida com sucesso!", {
							  	icon: "success",
							});
						}
					}
				});
			}
		});
	});
	
	// Store Offer Status
	$('#change-offer-status').live('click', function(e) {
		e.preventDefault();
		
		var $this = $(this);
		var offerID = $this.attr('data-id');
		
		$.ajax({
			url: 'ajaxmonteiro.php',
			type: 'POST',
			data: {
				action: "offer-status",
				offerId: offerID
			},
			dataType: "json",
			success: function(data) {
				if (data.status) {
					if (data.offer == 0) {
						$this.removeClass('remove-btn').addClass('success-btn');
						$this.text('Ativar');
					} else {
						$this.removeClass('success-btn').addClass('remove-btn');
						$this.text('Desativar');
					}

					swal({
						title: 'Status Alterado',
						text: 'VocÃª alterou com sucesso o status dessa categoria.',
						icon: "success",
					});
				}
			}
		});
	});
	
	$('#downloadinfo').click(function(e) {
		e.preventDefault();
		
		swal({
			title: "Como Instalar", 
			text: "Descompacte o arquivo Automap.rar na pasta AppData/\Roaming/\Tibia para que vocÃª tenha o mapa do Efferus totalmente liberado.\n\n Caso vocÃª nÃ£o goste de spoilers, nÃ£o prossiga!\n\n Ã‰ recomendado que se faÃ§a um backup da pasta Automap jÃ¡ existente a fim de evitar futuras complicaÃ§Ãµes.\n\n Em nome da equipe de Efferus,\n Bom jogo!", 
			icon: "info"
		});
	});
	
	$('#client11info').click(function(e) {
		e.preventDefault();
		
		swal({
			title: "Usando o Cliente 11", 
			text: "Descompacte o arquivo em um lugar de sua preferÃªncia, depois disso entre em packages/Tibia/bin e execute o client.exe. VocÃª pode criar um atalho na Ã¡rea de trabalho para tornar mais prÃ¡tico o uso de seu cliente.\n\n Em nome da equipe de Efferus,\n Bom jogo!", 
			icon: "info"
		});
	});
    
    $('#admin-restart-server').click(function(e) {
        e.preventDefault();
        
        swal({
		  title: "VocÃª tem certeza?",
		  text: "O servidor serÃ¡ reiniciado em no mÃ¡ximo 10 segundos!",
		  icon: "warning",
		  buttons: ["Cancelar", "Sim, reiniciar!"],
		  dangerMode: true,
		})
		.then((willRestart) => {
			if (willRestart) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: { action: "restart-server" },
					dataType: "json",
					success: function(data) {
						if (data.status) {
							swal("O servidor foi reiniciado com sucesso!", {
							  	icon: "success",
							});
						}
					}
				});
			}
		});
    });
    
    $('#admin-save-server').click(function(e) {
        e.preventDefault();
        
        swal({
		  title: "Salvar Servidor",
		  text: "O servidor terÃ¡ seu estado atual salvo em no mÃ¡ximo 10 segundos!",
		  buttons: ["Cancelar", "Sim, salvar!"]
		})
		.then((willSave) => {
			if (willSave) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: { action: "save-server" },
					dataType: "json",
					success: function(data) {
						if (data.status) {
							swal("O servidor foi salvo com sucesso!", {
							  	icon: "success",
							});
						}
					}
				});
			}
		});
    });
    
    $('#admin-reload').live('click', function(e) {
        e.preventDefault();
        
        var $this = $(this);
        var service = $this.attr('data-name');
        
        swal({
		  title: "Atualizar ServiÃ§o",
		  text: "Tem certeza que deseja atualizar este serviÃ§o?",
		  buttons: ["Cancelar", "Sim, atualizar!"]
		})
		.then((willReload) => {
			if (willReload) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: { action: "admin-reload", serviceName: service },
					dataType: "json",
					success: function(data) {
						if (data.status) {
							swal("O serviÃ§o foi atualizado com sucesso!", {
							  	icon: "success",
							});
						} else {
                            swal(data.msg, {
							  	icon: "error",
							});
                        }
					}
				});
			}
		});
    });
    
    $('#admin-raid').live('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        var raid = $this.attr('data-name');
        
        swal({
		  title: "Iniciar InvasÃ£o",
		  text: "VocÃª tÃªm certeza que deseja inicar a invasÃ£o "+raid+"?",
		  icon: "warning",
		  buttons: ["Cancelar", "Sim, iniciar!"],
		  dangerMode: true,
		})
		.then((willRestart) => {
			if (willRestart) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: { action: "start-raid", raidName: raid },
					dataType: "json",
					success: function(data) {
						if (data.status) {
							swal("A invasÃ£o foi inciada com sucesso! Lembre-se de apenas inciar outra invasÃ£o depois que essa terminar!", {
							  	icon: "success",
							});
						}
					}
				});
			}
		});
    });
    
    $('#admin-player-temple-teleport').live('click', function(e) {
        e.preventDefault();
        var playerName = $('input[name=playerName]').val();
        
        swal({
		  title: "Teleportar Jogador",
		  text: "VocÃª tÃªm certeza que deseja teleportar esse jogador para o templo?",
		  icon: "info",
		  buttons: ["Cancelar", "Sim, teleportar!"],
		})
		.then((willRestart) => {
			if (willRestart) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: { action: "admin-player-teleport-temple", name: playerName },
					dataType: "json",
					success: function(data) {
						if (data.status) {
							swal("O player foi teleportado para o templo com sucesso!", {
							  	icon: "success",
							});
						}
					}
				});
			}
		});
    });
    
    $('#admin-player-teleport').click(function(e) {
        e.preventDefault();
        var playerName = $('input[name=playerName]').val();
        var posX = $('input[name=posX]').val();
        var posY = $('input[name=posY]').val();
        var posZ = $('input[name=posZ]').val();
        
        var position = posX + "-" + posY + "-" + posZ;
        
        swal({
		  title: "Teleportar Jogador",
		  text: "VocÃª tÃªm certeza que deseja teleportar esse jogador para a posiÃ§Ã£o " + position,
		  icon: "info",
		  buttons: ["Cancelar", "Sim, teleportar!"],
		})
		.then((willRestart) => {
			if (willRestart) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: { action: "admin-player-teleport", name: playerName, pos: position },
					dataType: "json",
					success: function(data) {
						if (data.status) {
							swal("O player foi teleportado com sucesso!", {
							  	icon: "success",
							});
						}
					}
				});
			}
		});
    });
    
    $('#admin-player-msg').click(function(e) {
        e.preventDefault();
        var playerName = $('input[name=playerName]').val();
        var message = $('input[name=messageToPlayer]').val();
        
        swal({
		  title: "Mensagem para Jogador",
		  text: "VocÃª tÃªm certeza que deseja enviar essa mensagem ao jogador?",
		  icon: "info",
		  buttons: ["Cancelar", "Sim, enviar!"],
		})
		.then((willRestart) => {
			if (willRestart) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: { action: "admin-player-msg", name: playerName, msg: message },
					dataType: "json",
					success: function(data) {
						if (data.status) {
							swal("A mensagem foi enviada ao jogador com sucesso!", {
							  	icon: "success"
							});
						}
					}
				});
			}
		});
    });
    
    $('#admin-player-ban').click(function(e) {
        e.preventDefault();
        var playerName = $('input[name=playerName]').val();
        var reasonBan = $('input[name=banReason]').val();
        var banDays = $('input[name=banDays]').val();
        
        swal({
		  title: "Banir Jogador",
		  text: "VocÃª tÃªm certeza que deseja banir este jogador?",
		  icon: "warning",
		  buttons: ["Cancelar", "Sim, banir!"],
		  dangerMode: true,
		})
		.then((willRestart) => {
			if (willRestart) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: { action: "admin-player-ban", name: playerName, reason: reasonBan, days: banDays },
					dataType: "json",
					success: function(data) {
						if (data.status) {
							swal("O jogador foi banido com sucesso!", {
							  	icon: "success",
							});
						}
					}
				});
			}
		});
    });
    
    $('#admin-player-coins').click(function(e) {
        e.preventDefault();
        var playerName = $('input[name=playerName]').val();
        var coinsQtd = $('input[name=coinsToPlayer]').val();
        
        swal({
		  title: "Coins para Jogador",
		  text: "VocÃª tÃªm certeza que deseja dar coins a esse jogador?",
		  icon: "info",
		  buttons: ["Cancelar", "Sim, dar coins!"],
		})
		.then((willRestart) => {
			if (willRestart) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: { action: "admin-player-coins", name: playerName, coins: coinsQtd },
					dataType: "json",
					success: function(data) {
						if (data.status) {
							swal("Os coins foram creditados na conta desse jogador com sucesso!", {
							  	icon: "success"
							});
						}
					}
				});
			}
		});
    });
});

function seeTicker(ticker_id) {
	
	$.ajax({
		url: 'ajaxmonteiro.php',
		type: 'POST',
		data: {
			action: "ticker-see",
			tickerId: ticker_id
		},
		dataType: "json",
		success: function(data) {
			if (data.status) {
				swal({
					text: data.tickerText,
					button: "Fechar Ticker"
				});
			}
		}
	});
}

// Admin Panel Fim


$(function(){
	$("#wiki-tab").tabs();
	$("#wiki-tab > ul li a").click(function (e) {					
		location.hash = $(this).attr('href');
		if (location.hash) {
			window.scrollTo(0, 0);
		}
	});
				
});

function getOnlinPlayers() {
	$.ajax({  
        type: "POST", url: 'ajaxmonteiro.php', data: "action=get-online",  
        complete: function(data){  
            var data = data.responseText;
            $("#players_online").html(data);               
        }          
    })
};

$(document).ready(function() {
	setInterval('getOnlinPlayers()', 3000);
});

function show_hide(flip) {
	var tmp = $('#' + flip);
	if (tmp) {
		tmp.slideToggle("slow");
	}				
}

$(document).ready(function() {
	$('#eye').click(function(e){
		var typeAttr = $('#drop-pass').attr("type");
		if (typeAttr == "password") {
			$('#drop-pass').prop('type', 'text');
		} else {
			$('#drop-pass').prop('type', 'password');
		}
	});
});

$(document).ready(function() {
	$('#cancelDonating').live('click', function(e) {
		e.preventDefault();
		
		var donateID = $(this).attr('data-ref');
		
		 swal({
		  title: "Cancelar DoaÃ§Ã£o",
		  text: "VocÃª tÃªm certeza que deseja cancelar essa doaÃ§Ã£o? ",
		  icon: "info",
		  buttons: ["NÃ£o", "Sim, cancelar!"],
		}).then((cancelDonate) => {
			if (cancelDonate) {
				$.ajax({
					url: 'ajaxmonteiro.php',
					type: 'POST',
					data: { action: "cancel-donating", donateId: donateID },
					dataType: "json",
					success: function(data) {
						if (data.status) {
							$(this).parent().parent().fadeOut();
							
							swal("Essa doaÃ§Ã£o foi cancelada com sucesso!", {
							  	icon: "success"
							});
						} else {
							swal(data.msg, {
							  	icon: "error",
							});
						}
					}
				});
			}
		});
	});
});	

jQuery(document).ready(function (e) {
    function t(t) {
        e(t).bind("click", function (t) {
            t.preventDefault();
            e(this).parent().fadeOut()
        })
    }
    e(".dropdown-toggle").click(function () {
        var t = e(this).parents(".container-login").children(".login-dropdown").is(":hidden");
        e(".container-login .login-dropdown").hide();
        e(".dropdown-toggle").removeClass("active");
        if (t) {
            e(this).parents(".container-login").children(".login-dropdown").toggle().parents(".container-login").children(".dropdown-toggle").addClass("active")
        }
    });
    e(document).bind("click", function (t) {
        var n = e(t.target);
        if (!n.parents().hasClass("container-login")) e(".container-login .login-dropdown").hide();
    });
    e(document).bind("click", function (t) {
        var n = e(t.target);
        if (!n.parents().hasClass("container-login")) e(".container-login .dropdown-toggle").removeClass("active");
    })
});