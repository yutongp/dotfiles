commands.addUserCommand(['curbufferlist'], 'show buffer list around current buffer',
		function(args) {
			if(args[0]==undefined) {
				args[0] = 0;
			}
			var tindex = config.tabbrowser.mCurrentTab._tPos;
			tabs.list();
			var title_height = commandline._multilineOutputWidget.contentDocument.body.childNodes[0].childNodes[0].childNodes[1].clientHeight;
			var element_height = commandline._multilineOutputWidget.contentDocument.body.childNodes[0].childNodes[0].childNodes[3].clientHeight;
			commandline._multilineOutputWidget.contentWindow.scrollTo(0, (tindex - args[0]) * element_height + title_height);
		},{}
		);

commands.addUserCommand(['curbufferlistx'], 'show buffer list around current buffer x',
		function(args) {
			commandline.open("", "buffer! ", modes.EX);
		},{}
		);
