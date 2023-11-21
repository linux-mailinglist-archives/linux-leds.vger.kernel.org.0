Return-Path: <linux-leds+bounces-63-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 921E07F3212
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 16:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4404D282AC2
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 15:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9020C56761;
	Tue, 21 Nov 2023 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBxIKDa8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D96756753;
	Tue, 21 Nov 2023 15:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E39C433C8;
	Tue, 21 Nov 2023 15:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700579754;
	bh=o0D6VcCQZpUAwPWm8y5zZoRGK+djRokQuhzQmDc1Ots=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QBxIKDa855ZF2oYvMAHfBA2AvBeRZ62tqOpz8pVOxERO8DX69gyhW+e9uVJbKIKEt
	 oyCQKUjuxoOU2iXDlti9IrDaj0eVX86fI0wigkMFcstMzdOqeIOz1Oka1ClE8WYkML
	 TFQxNGTJVI/03aveXtVufVZEPI2sWy1ka1aD4t2xdmVWa2CVIJkrwVB9a2fvStgYsW
	 8gAhcYPM3SjkKlBVw8AQMS0pK5d7VfHTqrbYgd4GBOKRsNOMnwwUgSfVgsqW4RpBFD
	 N0F/FLf896AEroD6V0BWf2aJhxKlLUGLJcnc1ozI35y5XX8Xf3TItZUiA+WvDm1RkR
	 b1M9wHZ8LHWQQ==
Date: Tue, 21 Nov 2023 15:15:49 +0000
From: Lee Jones <lee@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux LEDs <linux-leds@vger.kernel.org>,
	Tim Crawford <tcrawford@system76.com>,
	Jeremy Soller <jeremy@system76.com>,
	System76 Product Development <productdev@system76.com>,
	Pavel Machek <pavel@ucw.cz>,
	Johannes =?iso-8859-1?Q?Pen=DFel?= <johannes.penssel@gmail.com>
Subject: Re: Fwd: sysfs: cannot create duplicate filename
 .../system76_acpi::kbd_backlight/color
Message-ID: <20231121151549.GA173820@google.com>
References: <b5646db3-acff-45aa-baef-df3f660486fb@gmail.com>
 <ZT25-gUmLl8MPk93@debian.me>
 <dc6264c4-d551-4913-a51b-72c22217f15a@traphandler.com>
 <ZUjnzB2RL2iLzIQG@debian.me>
 <87sf50pm34.wl-tiwai@suse.de>
 <b9d4ab02-fe49-48ab-bf74-0c7a578e891a@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9d4ab02-fe49-48ab-bf74-0c7a578e891a@leemhuis.info>

On Tue, 21 Nov 2023, Thorsten Leemhuis wrote:

> Takashi, Jean-Jacques Hiblot, Lee,
> 
> On 20.11.23 14:53, Takashi Iwai wrote:
> > On Mon, 06 Nov 2023 14:19:08 +0100,
> > Bagas Sanjaya wrote:
> >> On Sat, Nov 04, 2023 at 01:01:56PM +0100, Jean-Jacques Hiblot wrote:
> >>> On 29/10/2023 02:48, Bagas Sanjaya wrote:
> >>>> On Thu, Oct 26, 2023 at 02:55:06PM +0700, Bagas Sanjaya wrote:
> >>>>> The culprit seems to be commit c7d80059b086c4986cd994a1973ec7a5d75f8eea, which introduces a new 'color' attribute for led sysfs class devices. The problem is that the system76-acpi platform driver tries to create the exact same sysfs attribute itself for the system76_acpi::kbd_backlight device, leading to the conflict. For testing purposes, I've just rebuilt the kernel with the system76-apci color attribute renamed to kb_color, and that fixes the issue.
> >>>>
> >>>> Jean-Jacques Hiblot, would you like to take a look on this regression,
> >>>> since you authored the culprit?
> >
> >>> The offending commit stores the color in struct led_classdev and exposes it
> >>> via sysfs. It was part of a series that create a RGB leds from multiple
> >>> single-color LEDs. for this series, we need the color information but we
> >>> don't really need to expose it it via sysfs. In order to fix the issue, we
> >>> can remove the 'color' attribute from the sysfs.
> >>
> >> OK, see you in the patch!
> > 
> > Is there a patch available?
> 
> Not that I know of. Could not find anything on lore either.
> 
> > This bug hits for a few Logitech keyboard models, too, and it makes
> > 6.6 kernel unsable for them, as hid-lg-g15 driver probe fails due to
> > this bug:
> >   https://bugzilla.kernel.org/show_bug.cgi?id=218155
> > 
> > We need a quick fix for 6.6.x.
> 
> Given that Jean-Jacques Hiblot (the author of the culprit) and Lee (who
> committed it and sent it to Linus) know about this for a while already
> without doing anything about it, I wonder if someone should just send a
> revert to Linus (unless of course that is likely to introduce a
> regression on its own).

You seem to have gone from DEFCON 4 to DEFCON 2 there.  The middle step
is to submit a patch to fix the issue and follow the usual patch flow.

-- 
Lee Jones [李琼斯]

