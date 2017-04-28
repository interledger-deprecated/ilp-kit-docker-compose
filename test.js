const ILP = require('ilp')
const Plugin = require('ilp-plugin-bells')

async function run () {
  const factory = new Plugin.Factory({
    adminUsername: 'admin',
    adminPassword: 'admin',
    adminAccount: 'http://localhost:3010/ledger/accounts/admin',
  })

  console.log('connecting factory...')
  await factory.connect()
  console.log('connected.\n')

  console.log('creating plugin for alice...')
  const alice = await factory.create({ username: 'alice' })
  console.log('created alice.\n')

  console.log('quoting with alice...')
  const quote = await ILP.ILQP.quote(alice, {
    destinationAddress: 'g.dev.docker.test',
    destinationAmount: '10'
  })
  console.log('quoted alice->test:', quote)

  process.exit(0)
}

run().catch((e) => {
  console.error(e)
  process.exit(1)
})
