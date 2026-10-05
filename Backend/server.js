const express = require('express');
const app = express();
const PORTA = 3000;

app.get('/saude', (req, res) => {
  res.json({ status: 'ok' });
});

app.get('/personagens', (req, res) => {
  const personagens = [
    { id: 1, nome: 'Thorin', classe: 'Guerreiro', nivel: 3 },
    { id: 2, nome: 'Lyra', classe: 'Maga', nivel: 5 },
  ];
  res.json(personagens);
});

app.listen(PORTA, () => {
  console.log(`Servidor rodando na porta ${PORTA}`);
});