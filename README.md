# Code challenge: Byg et lille DSL til at skrive HTML i Ruby

Når vi om mange uger er færdige vil man kunne lave omfattende markup i stil med:

```ruby
html do
  button class: 'btn btn-primary', data: {action: 'click->modal#open'}

  div class: 'modal fade', data: {target: 'modal.modal', modal_form_url: user_path(user)} do
    h5 'Edit user', class: 'modal-title'
    div class: 'modal-content' do
      form do
        input type: 'text', name: 'fullname'
        textarea row: 50, cols: 50, data: {behavior: 'autogrowing-textarea'}
      end
    end
    div class: 'modal-footer' do
      button 'Close', class: 'btn btn-secondary', data: {action: 'click->modal#close'}
      button 'Close', class: 'btn btn-primary', data: {action: 'click->modal#save'}
    end
  end
end
```

Men vi starter i det små, og bygger lidt oven på, uge for uge.

Kør TDD, og lad testene fortælle jer hvad I mangler at lave, så I ikke kommer til at gøre det mere kompliceret end det behøver at være, eller kommer til at lave features der måske først er nødvendige om mange uger.

Idéen er at man får testene til at lyse grønt i løbet af ugen, og at vi hver fredag samler op, og laver et lille code review, hvor vi kan se på hinandens løsninger og blive inspireret og måske lære nogle nye Ruby-tricks vi ikke kendte 🙂

Når vi er færdige med ugens code review tilføjer jeg flere tests med nye krav til `test/functional/dsl_test.rb`, som vi så kigger på ugen efter.

Det er meningen at det skal være sjovt, så hvis man sidder helt fast, eller der er noget som ikke giver mening, må råber man selvfølgelig bare højt.

Håber at I har lyst til at give det et skud! 🙂 Happy coding ⌨️

## Ugentlige challenges

- [ ] Week 1: Nested elements and attributes
- [ ] Week 2: TBA

## Guidelines

#### Tests
Kør test suiten med `rake test`.

Tilføj alle de tests I har lyst til under mapperne `test/unit/` og `test/functional/`

#### Interaktiv konsol
I kan starte en interaktiv konsol med `bin/console` hvor I kan eksperimentere og prikke lidt til jeres kode.

#### Dependencies
De ugentlige challenges er designet til at kunne løses uden at bruge tredjepartskode.
