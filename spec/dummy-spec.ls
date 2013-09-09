require! '../src/dummy'

that = it

describe \dummy ->
  that \works ->
    expect dummy.dummy-method! .to-equal true