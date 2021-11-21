function tinymce_init_callback(editor)
{
    editor.settings.rel_list =  [
        {
            "title": "None",
            "value": ""
        },
        {
            "title": "No Follow",
            "value": "nofollow"
        },
        {
            "title": "No Opener",
            "value": "noopener"
        },
        {
            "title": "No Referrer",
            "value": "noreferrer"
        }
    ];
}