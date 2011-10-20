/*--------------------------------------------------------------------
	*	jQuery.inputHint() by antiplaka
	*	options = {
	*	hint : string 				// supplied hint
	*	wrap : boolean 	//wrap element into div.inputHint-wrapper
	*	}
--------------------------------------------------------------------*/
(function()
{
  $.fn.inputHint = function( options ) {
  if (this.size() == 1 && (this[0].nodeName === "INPUT" || this[0].nodeName === "TEXTAREA") )
    {
			var $input = this;

      var $hint = $('<span class="hint">'+options.hint +'</span>').css({
				cursor : 'text',
				position : 'absolute'
			});

			if (options.wrap === true)
			{
				var $wrapper = $('<div class="inputHint-wrapper"></div>').css(
					{
						position : 'relative'
					});
				$input.wrap($wrapper);
			}

      if ($input.val() != '') $hint.css('display', 'none');
      $input.before($hint);

      $hint.bind('click', function(){
        $hint.hide();
        $input.focus();
      });
      $input.bind('focus', function(){
        $hint.hide();
        });
      $input.bind('blur', function(){
        if ($input.val() === '')
          $hint.show();
        });
    }
    else
      if (window.console) console.log( "$.inputHint says : not proceed : "+this.selector+" : only single <input> ot <textarea> element allowed! " );
	}
}
)();

/*--------------------------------------------------------------------
	*	initButtons() snippet by e.chernov and antiplaka
--------------------------------------------------------------------*/
function initButtons() {
$('.button')
        .hover(function() {
            var $button = $(this);
            if (!$button.hasClass('faded')) {
                $button.toggleClass('hover');
            }
        })
        .bind('click', function(event) {
            var $button = $(this);
            if ($button.hasClass('can-push')) {
                $button.toggleClass('pushed');
            }
        })
        .bind('mousedown', function(event) {
            var $button = $(this);
            if (!$button.hasClass('faded')) {
                $button.addClass('click');
            }
        })
        .bind('mouseup', function(event) {
            var $button = $(this);
            if (!$button.hasClass('faded')) {
                $button.removeClass('click');
            }
        });

    $('.toggle').hover(function() {
        $(this).toggleClass('hover');
    });

    $('.toggle').bind('mousedown', function(event) {
        var $el = $(this);

        $el.parents('.toggle-group').find('.toggle').each(function(){
            $(this).removeClass('toggled');
        });

        $el.addClass('toggled');
    });
}

// -------------------------------------------------------------------
// markItUp!
// -------------------------------------------------------------------
// Copyright (C) 2008 Jay Salvat
// http://markitup.jaysalvat.com/
// -------------------------------------------------------------------
// MarkDown tags example
// http://en.wikipedia.org/wiki/Markdown
// http://daringfireball.net/projects/markdown/
// -------------------------------------------------------------------
// Feel free to add more tags
// -------------------------------------------------------------------
mySettings = {
	previewParserPath:	'',
	onShiftEnter:		{keepDefault:false, openWith:'\n\n'},
	markupSet: [
		{name:'Heading', key:'1', openWith:'### ', placeHolder:'Your title here...' },
		{separator:'---------------' },
		{name:'Bold', key:'B', openWith:'**', closeWith:'**'},
		{name:'Italic', key:'I', openWith:'_', closeWith:'_'},
		{separator:'---------------' },
		{name:'Bulleted List', openWith:'- ' },
		{name:'Numeric List', openWith:function(markItUp) {
			return markItUp.line+'. ';
		}},
		{separator:'---------------' },
		{name:'Picture', key:'P', replaceWith:'![[![Alternative text]!]]([![Url:!:http://]!] "[![Title]!]")'},
		{name:'Link', key:'L', openWith:'[', closeWith:']([![Url:!:http://]!] "[![Title]!]")', placeHolder:'Your text to link here...' },
		{separator:'---------------'},
		{name:'Quotes', openWith:'> '},
		{name:'Code Block / Code', openWith:'(!(\t|!|`)!)', closeWith:'(!(`)!)'}
	]
}

// mIu nameSpace to avoid conflict.
miu = {
	markdownTitle: function(markItUp, char) {
		heading = '';
		n = $.trim(markItUp.selection||markItUp.placeHolder).length;
		for(i = 0; i < n; i++) {
			heading += char;
		}
		return '\n'+heading;
	}
}


/*--------------------------------------------------------------------
	*	our tiny ui scripts
--------------------------------------------------------------------*/
$('document').ready(function() {
    // common initialization
    initButtons();
    $(".markdown-editor").add('.markdown-editor-holder>textarea').markItUp(mySettings);

    // now we will call template-specific functions
    if (app.templates.formLogin) {
        $(".side-block #fields-email").inputHint({hint:'email', wrap: true});
        $(".side-block #fields-password").inputHint({hint:'password', wrap: true});
    }

    if (app.templates.discussion) {
        var ajaxReadDiscussion = function() {
            $.ajax({
                type: 'POST',
                url: '/async/discussion-read/',
                data: {
                    'fields[member]': app.memberId,
                    'fields[discussion]': app.discussionId
                },
                dataType : 'xml',
                success: function(response) {
                    if (window.console) window.console.log($(response).find('response'));
                }
            });
        }

        if (app.memberId && app.discussionId) {
            ajaxReadDiscussion();
        }
    }
});





















