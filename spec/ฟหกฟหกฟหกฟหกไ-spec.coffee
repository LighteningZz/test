ฟหกฟหกฟหกฟหกไ = require '../lib/ฟหกฟหกฟหกฟหกไ'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "ฟหกฟหกฟหกฟหกไ", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('ฟหกฟหกฟหกฟหกไ')

  describe "when the ฟหกฟหกฟหกฟหกไ:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
      # Before the activation event the view is not on the DOM, and no panel
      # has been created
      expect(workspaceElement.querySelector('.ฟหกฟหกฟหกฟหกไ')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'ฟหกฟหกฟหกฟหกไ:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.ฟหกฟหกฟหกฟหกไ')).toExist()

        ฟหกฟหกฟหกฟหกไElement = workspaceElement.querySelector('.ฟหกฟหกฟหกฟหกไ')
        expect(ฟหกฟหกฟหกฟหกไElement).toExist()

        ฟหกฟหกฟหกฟหกไPanel = atom.workspace.panelForItem(ฟหกฟหกฟหกฟหกไElement)
        expect(ฟหกฟหกฟหกฟหกไPanel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'ฟหกฟหกฟหกฟหกไ:toggle'
        expect(ฟหกฟหกฟหกฟหกไPanel.isVisible()).toBe false

    it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.ฟหกฟหกฟหกฟหกไ')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'ฟหกฟหกฟหกฟหกไ:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        # Now we can test for view visibility
        ฟหกฟหกฟหกฟหกไElement = workspaceElement.querySelector('.ฟหกฟหกฟหกฟหกไ')
        expect(ฟหกฟหกฟหกฟหกไElement).toBeVisible()
        atom.commands.dispatch workspaceElement, 'ฟหกฟหกฟหกฟหกไ:toggle'
        expect(ฟหกฟหกฟหกฟหกไElement).not.toBeVisible()
