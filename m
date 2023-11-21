Return-Path: <linux-leds+bounces-48-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0A67F288D
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 10:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 854D51F23DC0
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 09:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE21933984;
	Tue, 21 Nov 2023 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847C8C1;
	Tue, 21 Nov 2023 01:19:06 -0800 (PST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r5MuO-0008PA-QI; Tue, 21 Nov 2023 10:19:04 +0100
Message-ID: <b9d4ab02-fe49-48ab-bf74-0c7a578e891a@leemhuis.info>
Date: Tue, 21 Nov 2023 10:19:03 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: sysfs: cannot create duplicate filename
 .../system76_acpi::kbd_backlight/color
Content-Language: en-US, de-DE
To: Takashi Iwai <tiwai@suse.de>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux LEDs <linux-leds@vger.kernel.org>,
 Tim Crawford <tcrawford@system76.com>, Jeremy Soller <jeremy@system76.com>,
 System76 Product Development <productdev@system76.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?Q?Johannes_Pen=C3=9Fel?= <johannes.penssel@gmail.com>
References: <b5646db3-acff-45aa-baef-df3f660486fb@gmail.com>
 <ZT25-gUmLl8MPk93@debian.me>
 <dc6264c4-d551-4913-a51b-72c22217f15a@traphandler.com>
 <ZUjnzB2RL2iLzIQG@debian.me> <87sf50pm34.wl-tiwai@suse.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <87sf50pm34.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700558346;75c0193b;
X-HE-SMSGID: 1r5MuO-0008PA-QI

Takashi, Jean-Jacques Hiblot, Lee,

On 20.11.23 14:53, Takashi Iwai wrote:
> On Mon, 06 Nov 2023 14:19:08 +0100,
> Bagas Sanjaya wrote:
>> On Sat, Nov 04, 2023 at 01:01:56PM +0100, Jean-Jacques Hiblot wrote:
>>> On 29/10/2023 02:48, Bagas Sanjaya wrote:
>>>> On Thu, Oct 26, 2023 at 02:55:06PM +0700, Bagas Sanjaya wrote:
>>>>> The culprit seems to be commit c7d80059b086c4986cd994a1973ec7a5d75f8eea, which introduces a new 'color' attribute for led sysfs class devices. The problem is that the system76-acpi platform driver tries to create the exact same sysfs attribute itself for the system76_acpi::kbd_backlight device, leading to the conflict. For testing purposes, I've just rebuilt the kernel with the system76-apci color attribute renamed to kb_color, and that fixes the issue.
>>>>
>>>> Jean-Jacques Hiblot, would you like to take a look on this regression,
>>>> since you authored the culprit?
>
>>> The offending commit stores the color in struct led_classdev and exposes it
>>> via sysfs. It was part of a series that create a RGB leds from multiple
>>> single-color LEDs. for this series, we need the color information but we
>>> don't really need to expose it it via sysfs. In order to fix the issue, we
>>> can remove the 'color' attribute from the sysfs.
>>
>> OK, see you in the patch!
> 
> Is there a patch available?

Not that I know of. Could not find anything on lore either.

> This bug hits for a few Logitech keyboard models, too, and it makes
> 6.6 kernel unsable for them, as hid-lg-g15 driver probe fails due to
> this bug:
>   https://bugzilla.kernel.org/show_bug.cgi?id=218155
> 
> We need a quick fix for 6.6.x.

Given that Jean-Jacques Hiblot (the author of the culprit) and Lee (who
committed it and sent it to Linus) know about this for a while already
without doing anything about it, I wonder if someone should just send a
revert to Linus (unless of course that is likely to introduce a
regression on its own).

Takashi, could you maybe do this, unless a fix shows up real soon?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: /me should have followed up on this earlier... :-/
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

