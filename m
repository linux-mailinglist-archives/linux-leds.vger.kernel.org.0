Return-Path: <linux-leds+bounces-1890-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B09063B1
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 08:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FADC1F22A50
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 06:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CB41304B7;
	Thu, 13 Jun 2024 06:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="BhYfJ2RQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3700437C;
	Thu, 13 Jun 2024 06:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718258506; cv=none; b=sj3XIXDCnjI4haFpmlMob6kK3/3I16j2X0QKvbLdONF8brSHfDpfIv95QqTIyr8juiGKcJq3wY+c4tbeX3sInNXQPMtpQJ/73T+yD86mx7Y0cH1uve4MDDqO1a5kBHKYLSEwU+y+H9BkxeWWWKuDazj5KNiotpSEf0+WjOnYCwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718258506; c=relaxed/simple;
	bh=VDyY0lmwRe0rWjIOr32imsF5aAyZwpJKRIGVp3Fq27k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=up9sZ4nhgISrbl/OF76XWkOpwmtt0m0XxcRTOHCT7iqOrf/9aMXzxrrQ/JyVBdGF9cBdU1kIqmtLSDAxniXl4Ta0aFxq/qkqIOMxoIqkIlF0taFg2xvXEIvii4NDQ9ydRDnBSdxgxfJQrVBiq5uy6p3tATha5k8iG3I9SoZVTrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=BhYfJ2RQ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=DjAortrBMsooQvo+oS5HLqOjhjZQ6sHhlWU7CDiPpck=;
	t=1718258504; x=1718690504; b=BhYfJ2RQf+cct7yglQ95/xf1cPzkp2jP/w9pk9M0AZqIeiu
	CnGK9z2OjBa/s1/usQTo58TGLV+14Nu1Jzrj5joszPlAdDAsKxr3aebwD43HMq0AmtukPXjb3bNy3
	slvxLgQNWeYpRyq0FRIxnOKv2I+fwTpWVaIbaV6oQiJQFLzLzaghyuKI5dYi6K0LKQ8Ia6C8TTr26
	SjhhpW8UzAdMG6sc+Ns0BI9G9h25b/3ng+lDZB/p0tssINVUIupUH6DNd6G2K277KhwM9bjkHHooc
	eC929vXzQsixKKyKHSxuHrThSAZKNmOtgjFzNlXoUzJHSlUq9uHrqxWpm4kfgctQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sHdWn-00027V-An; Thu, 13 Jun 2024 08:01:41 +0200
Message-ID: <1ae0cbc0-c87f-409b-abe2-13c76414f5ba@leemhuis.info>
Date: Thu, 13 Jun 2024 08:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: class: Revert: "If no default trigger is given,
 make hw_control trigger the default trigger"
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
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20240612152635.GF1504919@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1718258504;5627492e;
X-HE-SMSGID: 1sHdWn-00027V-An

On 12.06.24 17:26, Lee Jones wrote:
> On Wed, 12 Jun 2024, Hans de Goede wrote:
>> On 6/12/24 4:58 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>
>>> Hans, from your point of view, how fast should we try to mainline this
>>> revert? I got the impression that you want it merged there rather sooner
>>> than later -- and that sounds appropriate to me.
>>
>> There are at least 2 separate bug reports from 6.9 users who are gettinhg
>> stuck tasks which should be fixed by this, so yes this should go upstream
>> soon.
>>
>>> So should we maybe ask
>>> Linus on Friday to pick this up from here? Ideally of course with an ACK
>>> from Pavel or Lee.
>>
>> Indeed having an ack from Lee or Pavel here would be great!
> 
> Acked-by: Lee Jones <lee@kernel.org>

Thx everyone. In that case: why wait till Friday. :-D

Linus, could you please pick the revert up this thread is about? You can
find it here at the start of this thread, which is:

https://lore.kernel.org/all/20240607101847.23037-1-hdegoede@redhat.com/

You can see the Ack from Lee above and there is a Reviewed-by: from
Andrew in the first reply as well.

Tia! Ciao, Thorsten

