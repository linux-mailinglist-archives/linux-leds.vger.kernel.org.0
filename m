Return-Path: <linux-leds+bounces-5452-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF7B4A5EA
	for <lists+linux-leds@lfdr.de>; Tue,  9 Sep 2025 10:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DC504E6212
	for <lists+linux-leds@lfdr.de>; Tue,  9 Sep 2025 08:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8060F26FA52;
	Tue,  9 Sep 2025 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="M+dxBd0n"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEA81A3166;
	Tue,  9 Sep 2025 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407789; cv=none; b=SY/fVUq6aRrudxOVBr9pn9IMgwrc4HzUec6C7fBr77HpjlAyDEM91tzQzRIdzMBZg2KFBEjEw31whLHcp9wVPpNwi9f8xUmGuNfIIl2tOEquo4ZM8SaoFLrV9s/t7x3tX093fLF2K9eyr0FIFtGEqcGUZLMYpbK+wJfpNA5UG+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407789; c=relaxed/simple;
	bh=U25/owoSrzhIxMHSI97lUXuNNRgb83tQCnaAv3qpKog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5vn3QUfEKACgQUJhkSqSjdXPqfx4USbn0Jds4aMQiBSD4a/+2cFT8QtrC3ENst+CqmKQe6d8yumPUsAM4sTN1Zx9h5tPZP8npzE6PkwwCQSwfT576va8AZOt/Fo1yTaP/qERn/ssrzinCApl8r/w6b8TpOhX9aXz6aDb4OtH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=M+dxBd0n; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5de4594b.dip0.t-ipconnect.de [93.228.89.75])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 251F12FC004A;
	Tue,  9 Sep 2025 10:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1757407777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bppQV6AkR/A5IUC3YmhzDjEpwAY2Y3fezHekpCr7vc=;
	b=M+dxBd0nwspH7i31hBK+NftFn+6usNMpph46Ths5SFTEKQ/OinivHZ+Yl6PfxqCvWWBls5
	Nre9C7QVfX0T73W+EgZBvLbs0I3q6DEzqeRvLmEIZPXuVzJEH68LOZK0M1rShT+5UV5uSE
	kQZRa9Ph/Sp/QnzkT83Ixr19QO3uj5I=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <7e640ad2-4502-4741-95bc-10045499066e@tuxedocomputers.com>
Date: Tue, 9 Sep 2025 10:49:36 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: Add Uniwill laptop driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
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
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <8d6f8cf4-3c60-4b5b-87d1-e4fe4bce06e7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 05.09.25 um 20:46 schrieb Armin Wolf:
> Am 03.09.25 um 19:08 schrieb Werner Sembach:
>
>> Hi,
>>
>> started to look into the driver regarding TUXEDO NB02 devices support, 
>> starting with the FN-Keys:
>>
>> Am 31.08.25 um 21:27 schrieb Armin Wolf:
>>> +static const struct key_entry uniwill_keymap[] = {
>>> +    /* Reported via keyboard controller */
>>> +    { KE_IGNORE,    UNIWILL_OSD_CAPSLOCK,                   { KEY_CAPSLOCK }},
>>> +    { KE_IGNORE,    UNIWILL_OSD_NUMLOCK,                    { KEY_NUMLOCK }},
>>> +
>>> +    /* Reported when the user locks/unlocks the super key */
>>> +    { KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,      { KEY_UNKNOWN }},
>>> +    { KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,     { KEY_UNKNOWN }},
>>
>> Can you also add
>>
>> { KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,     { KEY_UNKNOWN }},
>>
>> ?
>>
>> UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE and UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE are 
>> always sent in pair with UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED (at least on my 
>> test device) and without this line an unknown key event is generated (as that 
>> is not explicitly marked as KE_IGNORE without the line).
>
> OK.
I found more similar cases that probably don't happen on your devices, but i 
will just create a patch once this got merged. I think that will be easier.
>
>>
>>> +
>>> +    /* Reported in manual mode when toggling the airplane mode status */
>>> +    { KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL }},
>>> +
>>> +    /* Reported when user wants to cycle the platform profile */
>>> +    { KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN }},
>> This is a physical button on the gaming devices from Uniwill, my suggestion 
>> would be to bind it to F14 (because another ODM has a very similar key that 
>> already sends F14 by default) and then let userspace handle it (KDE for 
>> example has energy profiles that could be bound to it).
>>> +
>>> +    /* Reported when the user wants to adjust the brightness of the 
>>> keyboard */
>>> +    { KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { 
>>> KEY_KBDILLUMDOWN }},
>>> +    { KE_KEY,       UNIWILL_OSD_KBDILLUMUP,                 { 
>>> KEY_KBDILLUMUP }},
>>> +
>>> +    /* Reported when the user wants to toggle the microphone mute status */
>>> +    { KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE }},
>>> +
>>> +    /* Reported when the user locks/unlocks the Fn key */
>>> +    { KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC }},
>>> +
>>> +    /* Reported when the user wants to toggle the brightness of the 
>>> keyboard */
>>> +    { KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { 
>>> KEY_KBDILLUMTOGGLE }},
>>> +
>>> +    /* FIXME: find out the exact meaning of those events */
>>> +    { KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN }},
>>> +    { KE_IGNORE,    UNIWILL_OSD_BAT_ERM_UPDATE,             { KEY_UNKNOWN }},
>>> +
>>> +    /* Reported when the user wants to toggle the benchmark mode status */
>>> +    { KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN }},
>>> +
>>> +    { KE_END }
>>> +};
>>
>> Any reason for still having KEY_* defines even on the ignored events? Looking 
>> at other drivers KE_IGNORE events usually don't have it.
>>
>> Best regards,
>>
>> Werner
>
> I decided to ignore UNIWILL_OSD_FN_LOCK because i do not know if the Fn + Esc 
> key presses are filtered by the EC or also received by the OS.

Sorry for the misunderstanding.

What i meant was: Why is it for example

{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC }},

and

{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN }},

instead of just

{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK},

and

{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE},

?

>
> Thanks,
> Armin Wolf
>

