const { Client, LocalAuth } = require('whatsapp-web.js');
const qrcode = require('qrcode-terminal');

const BOT_NAME = "Doctor Goods";
const BOT_AUTHOR = "Doctor Coringa Lunático";
const PREFIX = "!";

const client = new Client({
  authStrategy: new LocalAuth({ clientId: "doctor-goods-unique" }),
  puppeteer: { headless: true }
});

client.on('qr', qr => {
  console.log(`[${BOT_NAME}] Escaneie o QR Code para conectar:`);
  qrcode.generate(qr, { small: true });
});

client.on('ready', () => {
  console.log(`[${BOT_NAME}] Online! Autor: ${BOT_AUTHOR}`);
});

client.on('message', async msg => {
  if (msg.fromMe) return;

  if (!msg.body.startsWith(PREFIX)) return;

  const commandBody = msg.body.slice(PREFIX.length).trim();
  const args = commandBody.split(' ');
  const command = args.shift().toLowerCase();

  switch (command) {
    case 'ping':
      await msg.reply('pong');
      break;

    case 'info':
      await msg.reply(`${BOT_NAME}\nAutor: ${BOT_AUTHOR}\nPrefixo: ${PREFIX}`);
      break;

    case 'echo':
      if (args.length > 0) await msg.reply(args.join(' '));
      else await msg.reply('❌ Use: !echo <mensagem>');
      break;

    case 'enviarmensagem':
    case 'sendmsg':
      if (args.length < 2) {
        await msg.reply('❌ Use: !enviarmensagem <numero> <mensagem>\nEx: !enviarmensagem 5511999999999 Olá!');
        break;
      }
      const number = args.shift().replace(/[^\d]/g, '') + '@c.us';
      const text = args.join(' ');
      try {
        await client.sendMessage(number, text);
        await msg.reply(`✅ Mensagem enviada para +${number.replace('@c.us', '')}`);
      } catch (e) {
        await msg.reply(`❌ Erro ao enviar: ${e.message}`);
      }
      break;

    case 'skill':
      await msg.reply('Lista de skills:\n- !ping\n- !info\n- !echo\n- !enviarmensagem\n- !help');
      break;

    case 'help':
      await msg.reply(`Comandos:\n!ping - Testar bot\n!info - Sobre o bot\n!echo <msg> - Repete mensagem\n!enviarmensagem <num> <msg> - Enviar msg para número\n!skill - Lista comandos\n!help - Esta ajuda`);
      break;

    default:
      await msg.reply(`❌ Comando "${command}" não reconhecido. Use !help para ajuda.`);
      break;
  }
});

client.initialize();
