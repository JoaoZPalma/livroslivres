// api/process.js
export default async function handler(req, res) {
  if (req.method === 'POST') {
    const { data } = req.body;
    // Processar os dados
    res.status(200).json({ message: 'Dados processados', data });
  } else {
    res.status(405).json({ message: 'Método não permitido' });
  }
}
