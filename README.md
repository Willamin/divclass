# divclass

_an HTML preprocessor for custom css-based elements_

## Usage

When using a CSS framework that revolves around applying classes, your markup often becomes overwhlemed with divs. Why isn't there a tool for writing a little less? I bring you Divclass! (working name)

It lets you write this sort of thing in your markup:
```
<card>
  <card-header>Some card title</card-header>
  <card-body>
    Some example text
  </card-body>
</card>
```
and transform it into this:
```
<div class="card">
  <div class="card-header">Some card title</div>
  <div class="card-body">
    Some example text
  </div>
</div>
```

## Contributing

1. Fork it ( https://github.com/willamin/divclass/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [willamin](https://github.com/willamin) Will Lewis - creator, maintainer
