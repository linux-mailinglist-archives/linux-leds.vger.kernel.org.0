Return-Path: <linux-leds+bounces-4869-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F69AE31BE
	for <lists+linux-leds@lfdr.de>; Sun, 22 Jun 2025 21:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C8F316D8ED
	for <lists+linux-leds@lfdr.de>; Sun, 22 Jun 2025 19:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C18B1F2B90;
	Sun, 22 Jun 2025 19:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="g/xW99Ie"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDED31A8F60;
	Sun, 22 Jun 2025 19:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750620012; cv=none; b=EP0VJ3w7qGO4WdVuzwkKEbWuOYNUgAFF6P4AdDvEJJMG6XJYmACC3lw15SijZaOkv7Q9B/lOAYB9EEehE5PuH9QyfJvI30kOUd3CtK1PKM9rw9lur4v00Z5Qx2OE9Kf5Qe3nu+47gFbYuHcRaSSUe2/dQ7Ia14Hv5yhNG0jKpLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750620012; c=relaxed/simple;
	bh=WeOG+MjzdIsxy/CWwpwMD2pDWBrpkmsWHu8soZ4CLMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVIULebwVZycyIrQZqw4bthn7ZF2WzHK/SSVMUKRQtzRmLqp3KimJdvGBmbGHFHzrnR79tMmRAkPBr8gq8mUlwRM11Tn+rBaTckqg0OhccoFBn7fp8fMbiTvLkGGCn/d0TSmSDPm7tFWy/ip+rFwLRgN1X5+kIyvEK0iybaOGsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=g/xW99Ie; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750620001; x=1751224801; i=w_armin@gmx.de;
	bh=lll09mEnZfyJBByfpKGMz7/npbWC/hm4DjReGgJOgCM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=g/xW99Iebj9T1WJ+j30aXjSPqqto4kyMSNVr6ipKJsKISZVbikgKvZktlfwk/B2h
	 IY6G/L7Im22bomjX/8R7fRlWOQcCr6pO4G2HPj4OaUwyji+LCuFzRe8bzcVc84L9R
	 ZnSZgcgkCIK6XCRDT61raFpmGtLQBiU/Yf7rR47xoCmDDe0jtDoA6THDD3IJBtZ0n
	 zBIhX16Rs8Q/INYdNY9OYHyAHDDWV3XwVvs8U4/U37SQqQND2VatteE2pMHA/KuIu
	 VJ5dqbLg77GqS8CKx7QRtPUtzTyqK/cHDAOt3CDnYFQn6U396F8vQ+mMbBP6On4jt
	 sTQPLGtBscw5qGmBgQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2DxE-1utNMt05K2-0118K9; Sun, 22
 Jun 2025 21:20:01 +0200
Message-ID: <71b50cf8-5798-4a00-a908-e6c9e741dc30@gmx.de>
Date: Sun, 22 Jun 2025 21:19:56 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>, ilpo.jarvinen@linux.intel.com,
 chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de, ggo@tuxedocomputers.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <41de4cd4-2a27-4b14-a1c0-e336a3cec317@tuxedocomputers.com>
 <d645ba09-1820-4473-96bb-8550ed0b0a26@gmx.de>
 <20250619094757.GB587864@google.com>
 <ebd9489d-2783-468a-ad07-e7d1c04fb165@kernel.org>
 <20250619151714.GJ795775@google.com>
 <7c5b6512-1374-41c9-be9a-ac05b573e2cd@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7c5b6512-1374-41c9-be9a-ac05b573e2cd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:npnkzj5qX/JQbDhHXyCZGfYPZW2AiQ2/k0u1cinjwo888pGD4LV
 WK0agvLtH0uKsdy9/RT+OSwFuEeHn85ZxpvdIiWycIhZDzPZTdCNOJ/zT7Yb0Uva3WZLoDb
 FTBgzrcqNaJ3uiOGQbnf7D3MVBCDXoBIoftisCyxDD6N3VKCFPRG9f7FnKVIHFkwM7gUPIv
 d1ugSWoPVzrgdoqB5Aqgg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cTKaCFfLzjo=;9IOcCc3f4rJJOL4MvrYvsQTx9J9
 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
 hZCtpZqL5LhUEDu1oWquXg2cWk+1PhgnG4yAaw==

Am 19.06.25 um 22:03 schrieb Hans de Goede:

> Hi Lee,
>
> On 19-Jun-25 5:17 PM, Lee Jones wrote:
>> On Thu, 19 Jun 2025, Hans de Goede wrote:
>>
>>> Hi Lee,
>>>
>>> On 19-Jun-25 11:47 AM, Lee Jones wrote:
>>>> On Tue, 17 Jun 2025, Armin Wolf wrote:
>>>>
>>>>> Am 16.06.25 um 14:46 schrieb Werner Sembach:
>>>>>
>>>>>> Hi, small additon
>>>>>>
>>>>>> Am 15.06.25 um 19:59 schrieb Armin Wolf:
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 functionality.
>>>>>>> +
>>>>>>> +What: /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-=
X]/rainbow_animation
>>>>>>> +Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Juni 2025
>>>>>>> +KernelVersion:=C2=A0=C2=A0=C2=A0 6.17
>>>>>>> +Contact:=C2=A0=C2=A0=C2=A0 Armin Wolf <W_Armin@gmx.de>
>>>>>>> +Description:
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Forces the integrated =
lightbar to display a rainbow
>>>>>>> animation when the machine
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is not suspended. Writ=
ing "enable"/"disable" into this file
>>>>>>> enables/disables
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this functionality.
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading this file retu=
rns the current status of the rainbow
>>>>>>> animation functionality.
>>>>>>> +
>>>>>>> +What: /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-=
X]/breathing_in_suspend
>>>>>>> +Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Juni 2025
>>>>>>> +KernelVersion:=C2=A0=C2=A0=C2=A0 6.17
>>>>>>> +Contact:=C2=A0=C2=A0=C2=A0 Armin Wolf <W_Armin@gmx.de>
>>>>>>> +Description:
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Causes the integrated =
lightbar to display a breathing
>>>>>>> animation when the machine
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has been suspended and=
 is running on AC power. Writing
>>>>>>> "enable"/"disable" into
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this file enables/disa=
bles this functionality.
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading this file retu=
rns the current status of the
>>>>>>> breathing animation
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 functionality.
>>>>>> maybe this would be better under the /sys/class/leds/*/ tree if pos=
sible
>>>>> I CCed the LED mailing list so that they can give us advice on which=
 location is the preferred one for new drivers.
>>>> No need to involve the LED subsystem for a hardware function controll=
ed
>>>> by a single register value just because the interface involves an LED=
.
>>> Lee, the question here is where put the sysfs attribute to put the lig=
htbar
>>> in breathing mode e.g. which of these 2 should be used?  :
>>>
>>> 1. /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breat=
hing_in_suspend
>>> 2. /sys/class/leds/uniwill-lightbar/breathing_in_suspend
>>>
>>> I think this is a fair question and since 2. involves the LED class us=
erspace
>>> API I also think that asking for the LED maintainers input is reasonab=
le.
>>>
>>> FWIW I'm not sure myself. 2. is the more logical place / path. But 2. =
adds
>>> a custom sysfs attr the LED class device. Whereas 1. adds a custom sys=
fs attr
>>> in a place where these are more or less expected.
>> Right.  It was a reasonable question.  Did I imply otherwise?
> Sorry, my bad, I interpreted your "No need to involve the LED
> subsystem for a hardware function ..." remark as meaning that
> you did not understand why you were Cc-ed.
>
> I now realize that you meant that you believe the control for
> this does not need to be under /sys/class/leds/
>
>> If it wasn't clear, my vote (this is not a dictatorship) is for 1.
> Ok, 1. works for me and that is what the patch is already doing,
> so lets keep it as as.
>
> Regards,
>
> Hans

Fine with me.

Armin Wolf


