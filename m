Return-Path: <linux-leds+bounces-5534-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23287B871B9
	for <lists+linux-leds@lfdr.de>; Thu, 18 Sep 2025 23:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1803582686
	for <lists+linux-leds@lfdr.de>; Thu, 18 Sep 2025 21:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4D32FE05D;
	Thu, 18 Sep 2025 21:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="PK0kzJp+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E54E2FCBFD;
	Thu, 18 Sep 2025 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230462; cv=none; b=XTUIQgOf0Io11kMD6KiO+t2RR2q8eXkcvJ7Xg5eiq0Wzb4ERZEntVYjt3IM80xUsIlXIdTOXU5c3IR3Crm9JWW6llE8BIo5YJYi6t3eRgTZ9tIQCFV4C7Rv/t5mee0GS1B4Q8/IAWE9Q8zGXUARAMFfKBjl8Wi2S8ba+Mrw7Sxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230462; c=relaxed/simple;
	bh=FQeD8D3CCPwO2Im/socKCqy5ALQs3vcTSNf8ODj0Tt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMchjOKAJRM2oHT8lISCSSaZ4GryEYOtBfFCgVX5y/xecTESXgXh7QBqflE+VIKWB4VL8AQjVL935x2Y3iAGSS+UBGFfvEtkpy7Wtm1cTejGcgA2UOFm1axBF3fhpRHZMflCjqvRpuP8dJWN7d/rWHYMGQKg1M8VHwwZ8UhGtyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=PK0kzJp+; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1758230441; x=1758835241; i=w_armin@gmx.de;
	bh=FQeD8D3CCPwO2Im/socKCqy5ALQs3vcTSNf8ODj0Tt4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PK0kzJp+l+qsy8neHeOl09QS5SbNVj1tRYZ3mlP7POjLOy1Izgg4Hw/v87C3lvAd
	 YeI5o1qdimTafG1AlkouISMxvkw77EUVuxe9x0s/cCssdVNSxF4Ar9GWHGg/aWh2W
	 lxl6zQ7vvMup4zAWZBo1pBCm970MQaWgfGZPkV+vJSsOt5WIFgqf+9sRBU2ZwcECW
	 +sjdBflP0QPY1elAXq2sHb0hmcBnfUwUXx4pjJkrvgD+SX5ISESSyFGWPQAISCEk/
	 z0q1t9NdCX0s/pDdoJ/hyQMQeQNLaKllQzYhOmGAQsRsUXrK8H8Z7YQQHlV/J9AC2
	 +31gycUCqdRF7gJoaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDhlV-1v7py337Cx-00F6pJ; Thu, 18
 Sep 2025 23:20:41 +0200
Message-ID: <c2f0b7ec-f409-41d5-9407-f5a2b43311f4@gmx.de>
Date: Thu, 18 Sep 2025 23:20:36 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: Add Uniwill laptop driver
To: Werner Sembach <wse@tuxedocomputers.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
 alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org, lee@kernel.org,
 pobrn@protonmail.com
References: <20250831192708.9654-1-W_Armin@gmx.de>
 <20250831192708.9654-2-W_Armin@gmx.de>
 <003d760c-0314-4ea2-b2b5-860021e0daf8@tuxedocomputers.com>
 <8d6f8cf4-3c60-4b5b-87d1-e4fe4bce06e7@gmx.de>
 <7e640ad2-4502-4741-95bc-10045499066e@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7e640ad2-4502-4741-95bc-10045499066e@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5N93FeRemndDN0SbqEmYQ5tCrksGoOlP2xL04ihT5Vi2hf8R6Sf
 A69gGYbc1vYlTTcXMTMpPKGU+tMh2sUiatfGWX8aZptRXs/ERsim5ijlaHL3w71FVOo03Jn
 +0OncOq9WH1W/WO4En9kcaZ5p+0ACBy8LFXduB2GYGwBmZc5+jssnrXmupuqp6PM5S+/yJr
 wGWiwcxqv1RhcHgxBM1Og==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HGHou/lR9rg=;BYQW2t+aPovn7V/3ztTiKfLH68C
 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

Am 09.09.25 um 10:49 schrieb Werner Sembach:

>
> Am 05.09.25 um 20:46 schrieb Armin Wolf:
>> Am 03.09.25 um 19:08 schrieb Werner Sembach:
>>
>>> Hi,
>>>
>>> started to look into the driver regarding TUXEDO NB02 devices=20
>>> support, starting with the FN-Keys:
>>>
>>> Am 31.08.25 um 21:27 schrieb Armin Wolf:
>>>> +static const struct key_entry uniwill_keymap[] =3D {
>>>> +=C2=A0=C2=A0=C2=A0 /* Reported via keyboard controller */
>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_CAPSLO=
CK, { KEY_CAPSLOCK }},
>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_NUMLOC=
K, { KEY_NUMLOCK }},
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user locks/unlocks the super=
 key */
>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_SUPER_=
KEY_LOCK_ENABLE, {=20
>>>> KEY_UNKNOWN }},
>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_SUPER_=
KEY_LOCK_DISABLE, {=20
>>>> KEY_UNKNOWN }},
>>>
>>> Can you also add
>>>
>>> { KE_IGNORE,=C2=A0 =C2=A0 UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,=C2=A0 =
=C2=A0 =C2=A0{=20
>>> KEY_UNKNOWN }},
>>>
>>> ?
>>>
>>> UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE and=20
>>> UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE are always sent in pair=20
>>> with=C2=A0UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED (at least on my test devi=
ce)=20
>>> and without this line an unknown key event is generated (as that is=20
>>> not explicitly marked as KE_IGNORE without the line).
>>
>> OK.
> I found more similar cases that probably don't happen on your devices,=
=20
> but i will just create a patch once this got merged. I think that will=
=20
> be easier.

Alright, but i will still include UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED insid=
e the next revision.

Thanks,
Armin Wolf

>>
>>>
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Reported in manual mode when toggling the airp=
lane mode=20
>>>> status */
>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_OSD_RFKILL, { KEY_RFKILL }},
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Reported when user wants to cycle the platform=
 profile */
>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_PERFOR=
MANCE_MODE_TOGGLE, {=20
>>>> KEY_UNKNOWN }},
>>> This is a physical button on the gaming devices from Uniwill, my=20
>>> suggestion would be to bind it to F14 (because another ODM has a=20
>>> very similar key that already sends F14 by default) and then let=20
>>> userspace handle it (KDE for example has energy profiles that could=20
>>> be bound to it).
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to adjust the bri=
ghtness of=20
>>>> the keyboard */
>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_OSD_KBDILLUMDOWN, { KEY_KBDILLUMDOWN }},
>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_OSD_KBDILLUMUP, { KEY_KBDILLUMUP }},
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to toggle the mic=
rophone mute=20
>>>> status */
>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_OSD_MIC_MUTE, { KEY_MICMUTE }},
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user locks/unlocks the Fn ke=
y */
>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_FN_LOC=
K, { KEY_FN_ESC }},
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to toggle the bri=
ghtness of=20
>>>> the keyboard */
>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_OSD_KBDILLUMTOGGLE, {=20
>>>> KEY_KBDILLUMTOGGLE }},
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* FIXME: find out the exact meaning of those eve=
nts */
>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_BAT_CH=
ARGE_FULL_24_H, {=20
>>>> KEY_UNKNOWN }},
>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_BAT_ER=
M_UPDATE, { KEY_UNKNOWN }},
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to toggle the ben=
chmark mode=20
>>>> status */
>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_BENCHM=
ARK_MODE_TOGGLE, {=20
>>>> KEY_UNKNOWN }},
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 { KE_END }
>>>> +};
>>>
>>> Any reason for still having KEY_* defines even on the ignored=20
>>> events? Looking at other drivers KE_IGNORE events usually don't have=
=20
>>> it.
>>>
>>> Best regards,
>>>
>>> Werner
>>
>> I decided to ignore UNIWILL_OSD_FN_LOCK because i do not know if the=20
>> Fn + Esc key presses are filtered by the EC or also received by the OS.
>
> Sorry for the misunderstanding.
>
> What i meant was: Why is it for example
>
> { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_FN_LOCK,=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 { KEY_FN_ESC }},
>
> and
>
> { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 { KEY_UNKNOWN }},
>
> instead of just
>
> { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_FN_LOCK},
>
> and
>
> { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_BENCHMARK_MODE_TOGGLE},
>
> ?
>
The FN lock definition does map to a standard keycode, so i wanted to use =
KEY_FN_ESC
if this key definition is used in the future. The other usages of KEY_UNKN=
OWN exist
because i wanted to ensure that all field of the key definitions are prope=
rly initialized.

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf
>>
>

