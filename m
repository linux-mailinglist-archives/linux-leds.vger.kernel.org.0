Return-Path: <linux-leds+bounces-1725-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3B78D5CF3
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 10:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804491C238D7
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 08:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D38150989;
	Fri, 31 May 2024 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="QIC+VDbT"
X-Original-To: linux-leds@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1BE187567;
	Fri, 31 May 2024 08:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717144797; cv=none; b=Rth7HvCmWPjzsen2LzghF6NyVq4t7aYWCBbRCRkUqEySNXBcI5t+wUVHTN2C7W2FPgDKReGqXDrDV3iWyC1TfCWyT+J15N8wtMN075hcEwJJfOtIoAim8ACniFDlinGptlIIngxKCjGEqPmO8YUiFN9N43Z9YOT8S3h8/gPPRv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717144797; c=relaxed/simple;
	bh=HZYCsKjMSc/EqPpUCUY+p9VaVxhaFBNBTLb4Frz7Asg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HI/8j+ocU7TbzwxplMrvnshw5Dxc3lNeEpedaEE4Tv533UG14yfWXw/HMpk2rQWZuMA774ZexElLYU00bJo/beDoekSSamxNjlOOzkMApSf3TSOnhNmcUAfnqFPMbNWbx5zuvbDZrhrFZJ5whqEg3vr8c7Wjgkqt9MPCWKDK7+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=QIC+VDbT; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=hfDzAvU8xDKFTc19pK9dW0rwA+QcQVLK4v1h8Qtw0Fs=;
	t=1717144795; x=1717576795; b=QIC+VDbT23zvgu93nYy1Aw9r2kfqwfOAxweuCVs4Om3Fhyu
	668zxbnpElfmXiZyxeEtQYvUgr3mdMzVNffOSOJkQHg/nDGELXr3Bz7dFz+0bTap9PX/4F9k27CRh
	2wi2CR4IvUZnV7p2co+MEdPbOxztW+AjeIksy2ldpr8KM11sTsoE3iz+jyMiFoDI3f0zrb6DHZFaJ
	H8T7AyPKlvKCcoGWxMz4MTaBaT9EXlN0ocSs6IKyDkiTtarL+/4I4Y9kPOJkTkcOH59QZtXBG1GGE
	VCqHxvwgPTsuCBX0YX+gBdfxj42xt6MaloWrxhS5W1OBpxiR3rtxt6btXzneokeg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sCxnj-0005SD-1R; Fri, 31 May 2024 10:39:51 +0200
Message-ID: <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
Date: Fri, 31 May 2024 10:39:40 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Hung tasks due to a AB-BA deadlock between the leds_list_lock rwsem
 and the rtnl mutex (was: 6.9.3 Hung tasks)
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linux LEDs <linux-leds@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, johanneswueller@gmail.com,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Genes Lists <lists@sapience.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717144795;124009fb;
X-HE-SMSGID: 1sCxnj-0005SD-1R

[adding the LED folks and the regressions list to the list of recipients]

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Lee, Pavel, could you look into below regression report please? Thread
starts here:
https://lore.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com/

Another report with somewhat similar symptom can be found here:
https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/

See also Russell's analysis of that report below (many many thx for
that, much appreciated Russel!).

To my untrained eyes all of this sounds a lot like we still have a 6.9
regression related to the LED code somewhere. Reminder, we had earlier
trouble, but that was avoided through other measures:

* 3d913719df14c2 ("wifi: iwlwifi: Use request_module_nowait") /
https://lore.kernel.org/lkml/30f757e3-73c5-5473-c1f8-328bab98fd7d@candelatech.com/

* c04d1b9ecce565 ("igc: Fix LED-related deadlock on driver unbind") /
https://lore.kernel.org/all/ZhRD3cOtz5i-61PB@mail-itl/

* 19fa4f2a85d777 ("r8169: fix LED-related deadlock on module removal")

That iwlwifi commit even calls it self "work around". The developer that
submitted it bisected the problem to a LED merge, but sadly that was the
end of it. :-/

Ciao, Thorsten

On 30.05.24 16:04, Russell King (Oracle) wrote:
> On Thu, May 30, 2024 at 09:36:45AM -0400, Genes Lists wrote:
>> On Thu, 2024-05-30 at 08:53 -0400, Genes Lists wrote:
>> This report for 6.9.1 could well be the same issue:
>> https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/
> 
> The reg_check_chans_work() thing in pid 285 is likely stuck on the
> rtnl lock. The same is true of pid 287.
> 
> That will be because of the thread (pid 663) that's stuck in
> __dev_open()...led_trigger_register(), where the rtnl lock will have
> been taken in that path. It looks to me like led_trigger_register()
> is stuck waiting for read access with the leds_list_lock rwsem.
> 
> There are only two places that take that rwsem in write mode, which
> are led_classdev_register_ext() and led_classdev_unregister(). None
> of these paths are blocking in v6.9.
> 
> Pid 641 doesn't look significant (its probably waiting for either
> pid 285 or 287 to complete its work.)
> 
> Pid 666 looks like it is blocked waiting for exclusive write-access
> on the leds_list_lock - but it isn't holding that lock. This means
> there must already be some other reader or writer holding this lock.
> 
> Pid 722 doesn't look sigificant (same as pid 641).
> 
> Pid 760 is also waiting for the rtnl lock.
> 
> Pid 854, 855 also doesn't look sigificant (as pid 641).
> 
> And then we get to pid 858. This is in set_device_name(), which
> was called from led_trigger_set() and led_trigger_register().
> We know from pid 663 that led_trigger_register() can take a read
> on leds_list_lock, and indeed it does and then calls
> led_match_default_trigger(), which then goes on to call
> led_trigger_set(). Bingo, this is why pid 666 is blocked, which
> then blocks pid 663. pid 663 takes the rtnl lock, which blocks
> everything else _and_ also blocks pid 858 in set_device_name().
> 
> Lockdep would've found this... this is a classic AB-BA deadlock
> between the leds_list_lock rwsem and the rtnl mutex.
> 
> I haven't checked to see how that deadlock got introduced, that's
> for someone else to do.

P.S.:

#regzbot report: /
#regzbot introduced: f5c31bcf604d
#regzbot duplicate:
https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/
#regzbot summary: leds: Hung tasks due to a AB-BA deadlock between the
leds_list_lock rwsem and the rtnl mutex

