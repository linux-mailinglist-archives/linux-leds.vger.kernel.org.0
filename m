Return-Path: <linux-leds+bounces-1954-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF01909D26
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 13:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57D2C1C20404
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 11:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6182D186E34;
	Sun, 16 Jun 2024 11:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="FYaCFovl"
X-Original-To: linux-leds@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DFD6A008;
	Sun, 16 Jun 2024 11:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718538009; cv=none; b=cWA4S9Pzf+L4e7YGsiuI8C9ov0XG/Kn6dtK5oGzrDK70j8XT6ApcT/o+vkb2hfIuSk+3F/WpkbH97hFYBPlP51+7v/t7U0YZCKYD/phPSY7pdoMHXzDpEjDCF7JMZ70/H6OecUGXiBT+gUMFnaSfe6yieZ5GaRk/fTpkS1kwP0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718538009; c=relaxed/simple;
	bh=+5eIDvy+PDwnqeOYVylOAaTLLrsv5Q/pp+zj2Pwx934=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SKrLKz6/+fm580h7t0MMxrzGG/C+3UNBiz5ptjTgyaU99MV/BUvJYH6+BiU86i7D3YSzb4AMz6B64nAkMd/UpXFpn24VBF80wVHdnDUkzgUoQ37GWAYrUDaSH42PCDkTUaWoyZFlWEqSwa7ORaTxdPPG1WrY+oJ2/6xxlJ1Zap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=FYaCFovl; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Tv02ePHCK570oFv+99PrlvHMKfm0UUy8eAo3neEsjog=; t=1718538006;
	x=1718970006; b=FYaCFovlO35k7/sO6KocEbjm8gtobv+6Lj3Blaopd6R9Pd1/Hx0wFVq6FyRVE
	OWzMOJnDkeLMDIX5h+2a7Q+FE0jymuV4lfi/lPt0OeA2lUusBXG6anyJ+KDf4WO1bf4OvSPEaj84P
	5FAhA0f35JYSwJAu2oU3amS+u7g8dH1MvTR2aF/VFxo7c88rXXl0UJm4Wf75e+g4Wx2PIKEG81XkC
	AqXHg0ix5I5lRilM8ivWPL2eykyHiZSJe+G+S40WfDurpAJtpqdO3A7t3DMywKGQnMVU+gKTIOHdI
	9Ise+4XuqipeNvnOqClI+HuCRDAvSFtxW9eJqf9Yd4SVNHdsKg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sIoEt-0007ug-DJ; Sun, 16 Jun 2024 13:40:03 +0200
Message-ID: <1a69c1d0-0065-4f3b-923a-4e35a8a9d212@leemhuis.info>
Date: Sun, 16 Jun 2024 13:40:02 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: class: Revert: "If no default trigger is given,
 make hw_control trigger the default trigger"
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pavel Machek <pavel@ucw.cz>, Jakub Kicinski <kuba@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-leds@vger.kernel.org,
 Genes Lists <lists@sapience.com>, =?UTF-8?Q?Johannes_W=C3=BCller?=
 <johanneswueller@gmail.com>, stable@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Hans de Goede <hdegoede@redhat.com>,
 Lee Jones <lee@kernel.org>
References: <20240607101847.23037-1-hdegoede@redhat.com>
 <6ebdcaca-c95a-48bc-b1ca-51cc1d7a86a5@lunn.ch>
 <7a73693e-87b4-4161-a058-4e36f50e1376@redhat.com>
 <5e93d4ea-0247-4803-9c0e-215d009fb9d3@leemhuis.info>
 <0cdc9042-2cad-48d4-8eb6-0732cf9e7dfa@redhat.com>
 <20240612152635.GF1504919@google.com>
 <1ae0cbc0-c87f-409b-abe2-13c76414f5ba@leemhuis.info>
Content-Language: en-US, de-DE
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <1ae0cbc0-c87f-409b-abe2-13c76414f5ba@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1718538006;cd2c3720;
X-HE-SMSGID: 1sIoEt-0007ug-DJ

[resending this request, I fear my earlier mail triggered a spam filter]

Linus, could you please merge the revert at this thread's start, e.g.:
https://lore.kernel.org/all/20240607101847.23037-1-hdegoede@redhat.com/

It fixes a regression that causes some trouble.

You can see the Ack from Lee (who merged and mainlined the patch that is
reverted) below; there is a Reviewed-by: from Andrew in the first reply
as well. Heiner, who authored the culprit, did not reply afaics.

Ciao, Thorsten

On 13.06.24 08:01, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 12.06.24 17:26, Lee Jones wrote:
>> On Wed, 12 Jun 2024, Hans de Goede wrote:
>>> On 6/12/24 4:58 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>
>>>> Hans, from your point of view, how fast should we try to mainline this
>>>> revert? I got the impression that you want it merged there rather sooner
>>>> than later -- and that sounds appropriate to me.
>>>
>>> There are at least 2 separate bug reports from 6.9 users who are gettinhg
>>> stuck tasks which should be fixed by this, so yes this should go upstream
>>> soon.
>>>
>>>> So should we maybe ask
>>>> Linus on Friday to pick this up from here? Ideally of course with an ACK
>>>> from Pavel or Lee.
>>>
>>> Indeed having an ack from Lee or Pavel here would be great!
>>
>> Acked-by: Lee Jones <lee@kernel.org>
> 
> Thx everyone. In that case: why wait till Friday. :-D
> 
> Linus, could you please pick the revert up this thread is about? You can
> find it here at the start of this thread, which is:
> 
> https://lore.kernel.org/all/20240607101847.23037-1-hdegoede@redhat.com/
> 
> You can see the Ack from Lee above and there is a Reviewed-by: from
> Andrew in the first reply as well.
> 
> Tia! Ciao, Thorsten

