# energized_id_web

A web app that uses [AngularDart](https://webdev.dartlang.org/angular) and
[AngularDart Components](https://webdev.dartlang.org/components).

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Help! It doesn't compile :(

Several people working on this project believe that open-sourcing the ID templates used at Energy Institute High School would be a potential security risk. We have therefore elected not to check the template (HTML) or style (SCSS) files for the IdPreviewComponent into source control. Let the bad actors spend their own hour-and-a-half recreating it, that's how long it took me...

If you need the template files to do actual work on this project, contact @quantumAssembly ~~TODO: give Micah the templates and direct inquiries his way~~ to be provided with the templates or functional equivalents. For the sake of reference, the missing files are:

```
lib/src/components/id_preview_component/id_preview_component.html
lib/src/components/id_preview_component/id_preview_component.scss
```

## Help! It still doesn't compile :( :( :(

The problem now is that our `[energized_id](https://github.com/energized-id/energized_id)` package, which provides classes that are shared between the client and server, relies on code generation from the `[json_serializable](https://pub.dev/packages/json_serializable)` package. This code generation never happens though because I guess the Dart build system isn't smart enough to build dependencies as well as the main package. To do it manually, navigate to your [pub cache](https://dart.dev/tools/pub/glossary#system-cache), find `energized_id` in the `git` folder, and run the following commands:

```
pub get
pub run build_runner build
```

Return to this package and try to build it again. If it _still_ doesn't work for you, I'm not sure what to say.

It works on my machine.
