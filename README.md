# Code challenge: Byg et lille DSL til at skrive HTML i Ruby

Når vi er færdige med projektet vil man kunne lave omfattende markup i stil med:

```ruby
html do
  button 'Open modal', class: 'btn btn-primary', data: {action: 'click->modal#open'}

  div class: 'modal fade', data: {target: 'modal.modal', modal_form_url: users_path} do
    h5 'Edit user', class: 'modal-title'
    div class: 'modal-content' do
      form do
        input type: 'text', name: 'fullname'
        input type: 'hidden', name: 'bio', id: 'trix'
        tag :trix_editor, input: 'trix'
      end
    end
    div class: 'modal-footer' do
      button 'Close', class: ['btn', 'btn-secondary'], data: {action: 'click->modal#close'}
      button 'Save', class: ['btn', 'btn-primary'], data: {action: 'click->modal#save'}
    end
  end
end
```

Vi starter i det små, og bygger lidt oven på, uge for uge.

Oprindeligt var der en noget længere introduktion. Hvis man vil læse den igen, findes den [her](INTRODUCTION.md).

Håber at I har lyst til at give det et skud! 🙂 Happy coding ⌨️

## Ugentlige challenges
Hver uge lægger jeg nye tests i `test/weekly/` som stiller nye krav til vores gem.

- [ ] Week 1: Nested elements and attributes
- [ ] Week 2: TBA

## Guidelines

#### Tests
Kør test suiten med `rake test`.

Tilføj alle de tests I har lyst til under mapperne `test/unit/` og `test/functional/`

Brug TDD, og lad testene fortælle jer hvad I mangler at lave, så I ikke kommer til at gøre det mere kompliceret end det behøver at være, eller kommer til at lave features der måske først er nødvendige om mange uger.

#### Interaktiv konsol
I kan starte en interaktiv konsol med `bin/console` hvor I kan eksperimentere og prikke lidt til jeres kode.

#### Dependencies
De ugentlige challenges er designet til at kunne løses uden at bruge tredjepartskode.

Det er selvfølgelig tilladt at bruge hele Ruby's standard library!
