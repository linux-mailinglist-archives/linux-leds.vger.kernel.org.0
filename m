Return-Path: <linux-leds+bounces-44-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4F27F14F6
	for <lists+linux-leds@lfdr.de>; Mon, 20 Nov 2023 14:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1298F2824B1
	for <lists+linux-leds@lfdr.de>; Mon, 20 Nov 2023 13:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA961B299;
	Mon, 20 Nov 2023 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xu8zQ08b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sCk0B1Yw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23CFD7D;
	Mon, 20 Nov 2023 05:53:53 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 78996218CE;
	Mon, 20 Nov 2023 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700488432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CTYLP+h8hmQrs9+7usiM0wn1wk+0APnN9HJqgLk7Tnw=;
	b=xu8zQ08b/CDnUNoWT9YB7z0JQDB2+QUTSb/Sr4QNpAt3bskAMSh5hu0eQc8ulSQUSc0N90
	54+U5UfKmwnnUZlbpv6W5/XHRIKoUhU3C6Y+adPyTg8k7byXQIHj+NjuWu/YMqvI5QYjCu
	9DhjJIvWVB4vw1ErUEEzjdtGqtzxxus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700488432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CTYLP+h8hmQrs9+7usiM0wn1wk+0APnN9HJqgLk7Tnw=;
	b=sCk0B1YwcnrFdjDaEAE3GcyGtQRt2vlOZn+mkOLJtmLBVGGImPgrS87UXBJAv7MqCOwlXl
	8mp334lh/fcDmZCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3328913499;
	Mon, 20 Nov 2023 13:53:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WGZ8C/BkW2VkDQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 20 Nov 2023 13:53:52 +0000
Date: Mon, 20 Nov 2023 14:53:51 +0100
Message-ID: <87sf50pm34.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,	Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,	Linux Regressions
 <regressions@lists.linux.dev>,	Linux LEDs <linux-leds@vger.kernel.org>,	Tim
 Crawford <tcrawford@system76.com>,	Jeremy Soller <jeremy@system76.com>,
	System76 Product Development <productdev@system76.com>,	Lee Jones
 <lee@kernel.org>,	Pavel Machek <pavel@ucw.cz>,	Johannes =?ISO-8859-1?Q?Pe?=
 =?ISO-8859-1?Q?n=DFel?= <johannes.penssel@gmail.com>
Subject: Re: Fwd: sysfs: cannot create duplicate filename .../system76_acpi::kbd_backlight/color
In-Reply-To: <ZUjnzB2RL2iLzIQG@debian.me>
References: <b5646db3-acff-45aa-baef-df3f660486fb@gmail.com>
	<ZT25-gUmLl8MPk93@debian.me>
	<dc6264c4-d551-4913-a51b-72c22217f15a@traphandler.com>
	<ZUjnzB2RL2iLzIQG@debian.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.30
X-Spamd-Result: default: False [0.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCVD_TLS_ALL(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-0.90)[86.01%];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 TO_DN_ALL(0.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,system76.com,kernel.org,ucw.cz];
	 RCVD_COUNT_TWO(0.00)[2];
	 SUSPICIOUS_RECIPS(1.50)[]

On Mon, 06 Nov 2023 14:19:08 +0100,
Bagas Sanjaya wrote:
> 
> On Sat, Nov 04, 2023 at 01:01:56PM +0100, Jean-Jacques Hiblot wrote:
> > 
> > 
> > On 29/10/2023 02:48, Bagas Sanjaya wrote:
> > > On Thu, Oct 26, 2023 at 02:55:06PM +0700, Bagas Sanjaya wrote:
> > > > The culprit seems to be commit c7d80059b086c4986cd994a1973ec7a5d75f8eea, which introduces a new 'color' attribute for led sysfs class devices. The problem is that the system76-acpi platform driver tries to create the exact same sysfs attribute itself for the system76_acpi::kbd_backlight device, leading to the conflict. For testing purposes, I've just rebuilt the kernel with the system76-apci color attribute renamed to kb_color, and that fixes the issue.
> > > 
> > > Jean-Jacques Hiblot, would you like to take a look on this regression,
> > > since you authored the culprit?
> > Hi,
> > 
> > The offending commit stores the color in struct led_classdev and exposes it
> > via sysfs. It was part of a series that create a RGB leds from multiple
> > single-color LEDs. for this series, we need the color information but we
> > don't really need to expose it it via sysfs. In order to fix the issue, we
> > can remove the 'color' attribute from the sysfs.
> > 
> 
> OK, see you in the patch!

Is there a patch available?

This bug hits for a few Logitech keyboard models, too, and it makes
6.6 kernel unsable for them, as hid-lg-g15 driver probe fails due to
this bug:
  https://bugzilla.kernel.org/show_bug.cgi?id=218155

We need a quick fix for 6.6.x.


Thanks!

Takashi

