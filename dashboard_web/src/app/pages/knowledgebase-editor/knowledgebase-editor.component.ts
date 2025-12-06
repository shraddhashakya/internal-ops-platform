import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { AngularEditorModule, AngularEditorConfig } from '@kolkov/angular-editor';

@Component({
  selector: 'app-knowledge-editor',
  standalone: true,
  // Import all modules needed for standalone component
  imports: [
    CommonModule,
    FormsModule,
    HttpClientModule,
    AngularEditorModule
  ],
  templateUrl: './knowledgebase-editor.component.html',
  styleUrl: './knowledgebase-editor.component.css'
})
export class KnowledgebaseEditorComponent {
  editorContent: string = `<p>Use the toolbar to make text <strong>bold</strong>, <em>italic</em>, or <u>underline</u>. Tailwind handles the layout and responsiveness.</p>`;

  config: AngularEditorConfig = {
    editable: true,
    spellcheck: true,
    height: '200px',
    minHeight: '5rem',
    placeholder: 'Enter your knowledge article content here...',
    defaultParagraphSeparator: 'p',
    // Hide all complex buttons
    toolbarHiddenButtons: [
      ['link', 'unlink', 'insertImage', 'insertVideo'],
      ['fontSize', 'fontName', 'color', 'justifyLeft', 'justifyCenter', 'justifyRight', 'justifyFull'],
      ['indent', 'outdent', 'subscript', 'superscript'],
      ['clearFormatting', 'toggleEditorMode']
    ],
    customClasses: []
  };

  constructor() { }
}