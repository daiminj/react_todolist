const axios = require('axios')

axios.post('https:api.thegraph.com/subgraphs/name/sameepsi/quickswap03', {
  query: `
  query{
    mints(orderBy: timestamp, orderDirection: desc, where: { to: '0x662546dcc9f158a9abb4d1c3b369b07bc67969d6' }) {
      id
      transaction {
        id
        timestamp
        __typename
      }
      pair {
        id
        token0 {
          id
          symbol
          __typename
        }
        token1 {
          id
          symbol
          __typename
        }
        __typename
      }
      to
      liquidity
      amount0
      amount1
      amountUSD
      __typename
    }
  }
  `
})
.then((res) => {
  console.log(res.data)
})
.catch((error) => {
  console.error(error)
})
