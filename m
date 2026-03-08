Return-Path: <linux-leds+bounces-7155-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHFNJLS1rWmi6QEAu9opvQ
	(envelope-from <linux-leds+bounces-7155-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 08 Mar 2026 18:45:24 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 835D823177C
	for <lists+linux-leds@lfdr.de>; Sun, 08 Mar 2026 18:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B227300D93E
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2026 17:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56453603E2;
	Sun,  8 Mar 2026 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="M/+WkjmN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="r6gUqcoh"
X-Original-To: linux-leds@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B015B274B46;
	Sun,  8 Mar 2026 17:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772991920; cv=none; b=pJl7xnD2viDcV8RZWNtqTPoKf/hclanS947n5fcr2vwhjdkAt98pdkgQBuRz8ITLbNEP8YmgOTYXoDdWDfJNu8z0l/ehAkE4whnCy6KqPbojc4JaL5bG8IeqJLxkw4FqRCbg+LM06oKWp5x2atTZE2OKFWtCIAjkvWdNUOQsPCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772991920; c=relaxed/simple;
	bh=yrFUgIP7+VB2m83c7k5kHbOB7apeWVineCaA4kJBT5I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PpEkXM5vrZVdMTagSh4IVrACKVPajCgTCXn0OTeIdj/RRGZ5BFnc6QiulpFbddMeNCdw1ZWm5238ny9XjzdvbdLm09y9SH4ImHLYGqmTDYlFchPxWSaZGMGoCBrsU23aapxDD99LWUNvze3D+BtyB01Ztuz37SdJEVXrG2+ikgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=M/+WkjmN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=r6gUqcoh; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EA5C1140008A;
	Sun,  8 Mar 2026 13:45:16 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sun, 08 Mar 2026 13:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1772991916;
	 x=1773078316; bh=2zx5exB9jHDCNoCH36/G6J4X/4kxohEZ5etYuJS51ig=; b=
	M/+WkjmNbteN3xolkVgP6I67M1ybHCfy6aj1rZC6pU9wk9xsiTmj9LVZgKzZw3rt
	xgcax0pKcglhTTlnHoFWcEQG9mH+MzfBp5xPVRbLoErX8+0zwXnsN6copUAXmCAl
	3SSY8SEKZD0JetSiXEAsoElZZp4uLBXcka1E995WXRRBtDfKtIeASdDwzo5csEa3
	OljevfQ9CQR2LHCYoqHyDF/X7eUzf9KDst09n3f8Tiz/1l2ysGSY6E6SZWloAvqV
	xxemK5LSW9LDViMwJSeoii3LhobOtXOnnI/RNV4aJBeUi4LenJLouAIeKYDR7xCD
	VTDf7FI/IwIQLHTx7ZLP+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772991916; x=
	1773078316; bh=2zx5exB9jHDCNoCH36/G6J4X/4kxohEZ5etYuJS51ig=; b=r
	6gUqcohZZBJCWp736b2QhvwvvvVF244R31PCqiKOrGrMaEgnm0dLPB0gJ11zXLgL
	XjROYXOYTXWV3SHEMbylZlZRga+ioAHmodVubmQOoHhALSxfRxqbO5N8v7p8/J+0
	5bkL4XJ7J/SwFfsLw7N+mBz2wOaaJvqOSCXzIM963w6ZJXrrmDQBQU2+yCIuL1HD
	ogjnDZPjZvd+Z1+ONxstgV9XoPe5ny+kFPkg7llaKqM8kVoYv5HKLwsZv4eT6ddk
	T9vA26iASCi5wUdcJc70yzAs/9tAgFvSIP4iU8maLwDfWTOwNICDtpCI/p0tyd7Q
	xeldNMkPj47JdVCAQRD2g==
X-ME-Sender: <xms:rLWtac65gSKWzQ-HcFITpdXiDfber0_W_2DzOvrY6TT-fctBOjsJ3Q>
    <xme:rLWtaYsEogfmyEWXWA5cPn1VuXGje98MVkyP9cE_rsM_58HWnnDDyK9YI2Nmgw7EG
    wTx0XegttZg7fiCIryr87EUZ5ARDCFaiBqOwRZHyVrBv5Z1n338jQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeehkedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpedtffevgfethfevteduvdefleevkedtuddvlefghefg
    ieekffejteejveffkedthfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepudejpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopegslhgvuhhnghestghhrhhomhhiuhhmrdhorhhg
    pdhrtghpthhtohepghhrohgvtghksegthhhrohhmihhumhdrohhrghdprhgtphhtthhope
    guvghrvghkjhhohhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhk
    vghprghnhhgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhishhhnhhuohgtvhesgh
    hmrghilhdrtghomhdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehkrggsvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvggvsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehprghvvghlsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rLWtaRQvnMxXXCs13bauf4Z4SKTgd-fhciP6Rcjb2U_kyTi9jmQWwg>
    <xmx:rLWtaVfc4VFyCQzKB4cB5Ojgi3rALf6IsKJKiA7y-G-8AT3DGA4HcQ>
    <xmx:rLWtadetFGi-jLNwcwoedxJxRv7RLwtUntr9vGbyKOkeR4rW0Rxypg>
    <xmx:rLWtaT_KWTZgqMmV8N-8H211s7xkySWdya91kG7HvxJZVnRXyUyFkg>
    <xmx:rLWtaeLP6oigrjP0rfU98DS3AQgPS37ObvBJbTiuMrDP_XZ1GTqJZGzd>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 58B8A2CE0072; Sun,  8 Mar 2026 13:45:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AkcZMBcLD6IV
Date: Sun, 08 Mar 2026 13:44:54 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Benson Leung" <bleung@chromium.org>, "Guenter Roeck" <groeck@chromium.org>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Ike Panhc" <ikepanhc@gmail.com>
Cc: "Vishnu Sankar" <vishnuocv@gmail.com>,
 "Vishnu Sankar" <vsankar@lenovo.com>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <de19c814-c1b8-4916-a516-fdc4693d572f@app.fastmail.com>
In-Reply-To: <baf1e52379ffaaa284a934520b377f5c68ac76a6.camel@rong.moe>
References: <20260227190617.271388-1-i@rong.moe>
 <b1d43b71-38c1-48cb-91ae-4598ecd2f588@app.fastmail.com>
 <baf1e52379ffaaa284a934520b377f5c68ac76a6.camel@rong.moe>
Subject: Re: [RFC PATCH 0/9] leds: Add support for hw initiated hw control trigger
 transition
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 835D823177C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[squebb.ca:s=fm2,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[rong.moe,kernel.org,weissschuh.net,chromium.org,gmail.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[squebb.ca];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-7155-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[squebb.ca:+,messagingengine.com:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpearson-lenovo@squebb.ca,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.995];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,app.fastmail.com:mid]
X-Rspamd-Action: no action



On Thu, Mar 5, 2026, at 7:37 AM, Rong Zhang wrote:
> Hi Mark,
>
> On Wed, 2026-03-04 at 15:05 -0500, Mark Pearson wrote:
>> Hi Rong,
>> 
>> On Fri, Feb 27, 2026, at 2:05 PM, Rong Zhang wrote:
>> > Hi all,
>> > 
>> > Some laptops can tune their keyboard backlight according to ambient
>> > light sensors (auto mode). This capability is essentially a hw control
>> > trigger. Meanwhile, such laptops also offer a shrotcut for cycling
>> > through brightness levels and auto mode. For example, on ThinkBook,
>> > pressing Fn+Space cycles keyboard backlight levels in the following
>> > sequence:
>> > 
>> >   1 => 2 => 0 => auto => 1 ...
>> > 
>> > Recent ThinkPad models should have similar sequence too.
>> > 
>> > However, there are some issues preventing us from using hw control
>> > trigger:
>> > 
>> > 1. We want a mechanism to tell userspace which trigger is the hw control
>> >    trigger, so that userspace can determine if auto mode is on/off or
>> >    turing it on/off programmatically without obtaining the hw control
>> >    trigger's name via other channels
>> > 2. Turing on/off auto mode via the shortcut cannot activate/deactivate
>> >    the hw control trigger, making the software state out-of-sync
>> > 3. Even with #1 resolved, deactivating the hw control trigger after
>> >    receiving the event indicating "auto => 1" has a side effect of
>> >    emitting LED_OFF, breaking the shortcut cycle
>> > 
>> > This RFC series tries to demonstrate a path on solving these issues:
>> > 
>> > - Introduce an attribute called trigger_may_offload, so that userspace
>> >    can determine:
>> >    - if the LED device supports hw control (supported => visible)
>> >    - which trigger is the hw control trigger
>> >    - if the hw control trigger is selected
>> >    - if the hw control trigger is in hw control (i.e., offloaded)
>> >      - A callback offloaded() is added so that LED triggers can report
>> >        their hw control state
>> > - Add led_trigger_notify_hw_control_changed() interface, so that LED
>> >   drivers can notify the LED core about hardware initiated hw control
>> >   state transitions. The LED core will then determine if the transition
>> >   is allowed and turning on/off the hw control trigger accordingly
>> > - Tune the logic of trigger deactivation so that it won't emit LED_OFF
>> >   when the deactivation is triggered by hardware
>> > 
>> > The last two patches are included into the RFC series to demonstrate how
>> > to utilize these interfaces to add support for auto keyboard backlight
>> > to ThinkBook. They will be submitted separately once the dust settles.
>> > 
>> > Currently no Kconfig entry is provided to disable either interface. If
>> > needed, I will add one later.
>> > 
>> > [ Summary of other approaches ]
>> > 
>> > < custom attribute >
>> > 
>> > Pros:
>> > - simplicity, KISS
>> > - no need to touch the LED core
>> > - extensible as long as it has a sensor-neutral name
>> >   - a sensor-related name could potentially lead to a mess if a future
>> >     device implements auto mode based on multiple different sensors
>> > 
>> > Cons:
>> > - must have zero influence on brightness_set[_blocking] callbacks
>> >   in order not to break triggers
>> >   - potential interference with triggers and the brightness attribute
>> > - weird semantic (an attribute other than "brightness" and "trigger"
>> >   changes the brightness)
>> > 
>> > < hw control trigger (this series) >
>> > 
>> > Pros:
>> > - mutually exclusive with other triggers (hence less chaos)
>> > - semantic correctness
>> > - acts as an aggregate switch to turn on/off auto mode even a future
>> >   device implements auto mode based on multiple different sensors
>> >   - extensibility (through trigger attributes)
>> > 
>> > Cons:
>> > - complexity
>> > 
>> > [ Previous discussion threads ]
>> > 
>> > https://lore.kernel.org/r/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fastmail.com
>> > 
>> > https://lore.kernel.org/r/1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe
>> > 
>> > Thanks,
>> > Rong
>> > 
>> > Rong Zhang (9):
>> >   leds: Load trigger modules on-demand if used as hw control trigger
>> >   leds: Add callback offloaded() to query the state of hw control
>> >     trigger
>> >   leds: cros_ec: Implement offloaded() callback for trigger
>> >   leds: turris-omnia: Implement offloaded() callback for trigger
>> >   leds: trigger: netdev: Implement offloaded() callback
>> >   leds: Add trigger_may_offload attribute
>> >   leds: trigger: Add led_trigger_notify_hw_control_changed() interface
>> >   platform/x86: ideapad-laptop: Decouple HW & cdev brightness for kbd
>> >     backlight
>> >   platform/x86: ideapad-laptop: Fully support auto kbd backlight
>> > 
>> >  .../obsolete/sysfs-class-led-trigger-netdev   |  15 ++
>> >  Documentation/ABI/testing/sysfs-class-led     |  22 ++
>> >  .../testing/sysfs-class-led-trigger-netdev    |  13 --
>> >  Documentation/leds/leds-class.rst             |  72 ++++++-
>> >  drivers/leds/led-class.c                      |  23 +++
>> >  drivers/leds/led-triggers.c                   | 176 +++++++++++++++-
>> >  drivers/leds/leds-cros_ec.c                   |   6 +
>> >  drivers/leds/leds-turris-omnia.c              |   7 +
>> >  drivers/leds/leds.h                           |   3 +
>> >  drivers/leds/trigger/ledtrig-netdev.c         |  10 +
>> >  drivers/platform/x86/lenovo/Kconfig           |   1 +
>> >  drivers/platform/x86/lenovo/ideapad-laptop.c  | 194 ++++++++++++++----
>> >  include/linux/leds.h                          |   6 +
>> >  13 files changed, 492 insertions(+), 56 deletions(-)
>> >  create mode 100644 Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev
>> > 
>> > 
>> > base-commit: a75cb869a8ccc88b0bc7a44e1597d9c7995c56e5
>> > -- 
>> > 2.51.0
>> 
>> Thanks for your work on this.
>> 
>> For the series: As it's a RFC, I'm not bothering with notes on any typo's or grammer stuff.
>> 
>> Overall I think the implementation works and I understand it better from our initial discussions. Thank you for putting this together.
>> 
>> I'm not a huge fan of the term offloaded - I would lean towards just calling it hw_control (or similar). But I see it was used in the ledtrig-netdev driver so I don't feel strongly about this.
>> 
>
> FYI, "hw control" is a historical and internal term. I used it because
> it's used a lot in the documentation to the doc consistent. Otherwise
> "offload(ed)" should be used. See commit 44f0fb8dfe26 ("leds: trigger:
> netdev: rename 'hw_control' sysfs entry to 'offloaded'").
>
> I admit that I was somewhat lost in the terminological soup and there
> may be some room for rephrasing in my documentation and commit
> messages.
>
Fair enough :) I think that overrides my mild preferences.

Mark

