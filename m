Return-Path: <linux-leds+bounces-1883-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2198905601
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 16:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 898EC286AF8
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 14:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7477B17FACA;
	Wed, 12 Jun 2024 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="x2cidWkf"
X-Original-To: linux-leds@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FA417B417;
	Wed, 12 Jun 2024 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718204321; cv=none; b=Rp5aIbBZeVMIYmH4o78iLkImDUaMD16jp+zopWfhgwpazfu8Z4mgAomDK7E2qe4j6yD6/KyhiT4rEGqD6Eg02CtyuNyJkOLpuE1M2KmKNIJLBLoKTZ47XbOrrwovmPcRw6QRBnkto3zp0nKgx6onMYqhmkl2NTx77HGViQUAtus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718204321; c=relaxed/simple;
	bh=P3lAQ3kIRQkCOj7DRfGLWPOBbZm345wjFECYZkfk6+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhW0Y4qJnv5WyiQg8A8Fwyx3bZ7sY12DJRyGEWrIk5Y3AL3DD5s9QJakcHLKGIlKJaZxjkQihmQv3zWMcn7saEp9rQf66WLuE9LPolvnhDjRKgzR2YDje1Rqy9rtCv8hASHilcPGRnd/JCvNt41f65LBCRchwIt3cV4HvpoF8Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=x2cidWkf; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=sRUfZnuqjz5+rgiu6KxuI/qjUJuItzxhDVkejZZpkpA=;
	t=1718204319; x=1718636319; b=x2cidWkf2wdbc1nq2LbSXZ/XRHkgxTaO80YjF6C7nFo3Ot7
	AzU4lk9oIT7Ev1ka3ntWEU70T057XDHO6/XAVojfEnR+onlIgCJTV5VrGcExvig29fDoLEUOJQ8c6
	33AP8Ehy5r9m5QBO0nAS2s2zJIogtIl4us05EbbhUJbMZWwr03J+03lBzTs5yTMbsDQgw2pHsy++L
	kdqrD/c2MAQ8CgWROLiDzTmnLFgxyT+8ncIAbkqswDvntQxMRO9nMIVPJiVP3Sa3Cwg5FSD7HZ/xx
	0RkgNaACe8ZxEzeVYtwzaVTIYGtiFUN98iW+kDFJQ8M4cJCExMM5K11xP5K79WbA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sHPQp-0008GV-Gk; Wed, 12 Jun 2024 16:58:35 +0200
Message-ID: <5e93d4ea-0247-4803-9c0e-215d009fb9d3@leemhuis.info>
Date: Wed, 12 Jun 2024 16:58:32 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: class: Revert: "If no default trigger is given,
 make hw_control trigger the default trigger"
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 regressions@lists.linux.dev, linux-leds@vger.kernel.org,
 Genes Lists <lists@sapience.com>, =?UTF-8?Q?Johannes_W=C3=BCller?=
 <johanneswueller@gmail.com>, stable@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>
References: <20240607101847.23037-1-hdegoede@redhat.com>
 <6ebdcaca-c95a-48bc-b1ca-51cc1d7a86a5@lunn.ch>
 <7a73693e-87b4-4161-a058-4e36f50e1376@redhat.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <7a73693e-87b4-4161-a058-4e36f50e1376@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1718204319;76933d68;
X-HE-SMSGID: 1sHPQp-0008GV-Gk

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Hans, from your point of view, how fast should we try to mainline this
revert? I got the impression that you want it merged there rather sooner
than later -- and that sounds appropriate to me. So should we maybe ask
Linus on Friday to pick this up from here? Ideally of course with an ACK
from Pavel or Lee.

Ciao, Thorsten
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

On 07.06.24 17:26, Hans de Goede wrote:
> On 6/7/24 2:03 PM, Andrew Lunn wrote:
>> On Fri, Jun 07, 2024 at 12:18:47PM +0200, Hans de Goede wrote:
>>> Commit 66601a29bb23 ("leds: class: If no default trigger is given, make
>>> hw_control trigger the default trigger") causes ledtrig-netdev to get
>>> set as default trigger on various network LEDs.
>>>
>>> This causes users to hit a pre-existing AB-BA deadlock issue in
>>> ledtrig-netdev between the LED-trigger locks and the rtnl mutex,
>>> resulting in hung tasks in kernels >= 6.9.
>>>
>>> Solving the deadlock is non trivial, so for now revert the change to
>>> set the hw_control trigger as default trigger, so that ledtrig-netdev
>>> no longer gets activated automatically for various network LEDs.
>>>
>>> The netdev trigger is not needed because the network LEDs are usually under
>>> hw-control and the netdev trigger tries to leave things that way so setting
>>> it as the active trigger for the LED class device is a no-op.
>>>
>>> Fixes: 66601a29bb23 ("leds: class: If no default trigger is given, make hw_control trigger the default trigger")
>>> Reported-by: Genes Lists <lists@sapience.com>
>>> Closes: https://lore.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com/
>>> Reported-by: "Johannes Wüller" <johanneswueller@gmail.com>
>>> Closes: https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> I'm not sure i agree with the Closes: All this does is make it less
>> likely to deadlock. The deadlock is still there.
> 
> I agree that the deadlock which is the root-cause is still there. But
> with this revert ledtrig-netdev will no longer get activated by default.
> 
> So now the only way to actually get the code-paths which may deadlock
> to run is by the user or some script explicitly activating the netdev
> trigger by writing "netdev" to the trigger sysfs file for a LED classdev.
> So most users will now no longer hit this, including the reporters of
> these bugs.
> 
> The auto-activating of the netdev trigger is what is causing these
> reports when users are running kernels >= 6.9 . 
> So now the only way to actually get the code-paths which may deadlock
> to run is by the user or some script explicitly activating the netdev
> trigger by writing "netdev" to the trigger sysfs file for a LED classdev.
> So most users will now no longer hit this, including the reporters of
> these bugs.
> 
> The auto-activating of the netdev trigger is what is causing these
> reports when users are running kernels >= 6.9 .
> 
>> But:
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>


