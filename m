Return-Path: <linux-leds+bounces-5537-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA3BB92184
	for <lists+linux-leds@lfdr.de>; Mon, 22 Sep 2025 17:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39203A8028
	for <lists+linux-leds@lfdr.de>; Mon, 22 Sep 2025 15:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CED2D876A;
	Mon, 22 Sep 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="NrV5dwJL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30D32DECB1;
	Mon, 22 Sep 2025 15:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758556682; cv=none; b=h6NLPsrnPnr5UtFs9LBfH+S8c4ZziW4TdAOyw6F8+7/jpJgIRE29yOT5QOyf7eT9HFbtY6nPRK7ODiMoRWuzNpo7sSI5fc37cqhzrvuJQMGcVsEb76zMQ9J/FUByTIJA89yHjN4Od6CnGUEq8U0LGElScblbSJ2FUN9nyjKLeik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758556682; c=relaxed/simple;
	bh=n9xgFK5rkFNKevOXz1p0NEJsRgwDnk5JXwaz7pCx8I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nw+wjjdJGZ0AWfgzfEzp9SuLk8NC8LtxOJHmyhC64Ao66mOvDWc4UEH+zm9jQmin8geb4F+Ef37a92OZTrqcvVEoal+M+RxxUmWJ+3yMafSpEasrlanKx9oC9LeXCFbfiJiPvH5C/rBajOhMahQ4w9m1IQ7Ts44d90+RTmOTGIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=NrV5dwJL; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5de45015.dip0.t-ipconnect.de [93.228.80.21])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id A49182FC0050;
	Mon, 22 Sep 2025 17:57:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1758556670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n4TadjzD9MQHct2ugabvX290PEUi8xkIhn3g/gIB7Lc=;
	b=NrV5dwJLat3CaDwyCUzwpkDbTRjkN7uLrJfTua008GLLis6YuljmvGl4fFXciCNZusHBmN
	/agsB55MYJiVR5iM/qiOeEpwZhxuDnqtp37sw1SCiikPsXuzoPF3G+a4T9iEWb137d2o9u
	NoIyIPjD2ujqGAhH4OMdcK1EVK+tTs8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <bdf1490f-b4cf-4ed3-b21f-584ce310a213@tuxedocomputers.com>
Date: Mon, 22 Sep 2025 17:57:49 +0200
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
 <7e640ad2-4502-4741-95bc-10045499066e@tuxedocomputers.com>
 <c2f0b7ec-f409-41d5-9407-f5a2b43311f4@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <c2f0b7ec-f409-41d5-9407-f5a2b43311f4@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 18.09.25 um 23:20 schrieb Armin Wolf:
> Am 09.09.25 um 10:49 schrieb Werner Sembach:
>
>>
>> Am 05.09.25 um 20:46 schrieb Armin Wolf:
>>> Am 03.09.25 um 19:08 schrieb Werner Sembach:
>>>
>>>> Hi,
>>>>
>>>> started to look into the driver regarding TUXEDO NB02 devices support, 
>>>> starting with the FN-Keys:
>>>>
>>>> Am 31.08.25 um 21:27 schrieb Armin Wolf:
>>>>> +static const struct key_entry uniwill_keymap[] = {
>>>>> +    /* Reported via keyboard controller */
>>>>> +    { KE_IGNORE,    UNIWILL_OSD_CAPSLOCK, { KEY_CAPSLOCK }},
>>>>> +    { KE_IGNORE,    UNIWILL_OSD_NUMLOCK, { KEY_NUMLOCK }},
>>>>> +
>>>>> +    /* Reported when the user locks/unlocks the super key */
>>>>> +    { KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE, { KEY_UNKNOWN }},
>>>>> +    { KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE, { KEY_UNKNOWN }},
>>>>
>>>> Can you also add
>>>>
>>>> { KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,     { KEY_UNKNOWN }},
>>>>
>>>> ?
>>>>
>>>> UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE and UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE 
>>>> are always sent in pair with UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED (at least 
>>>> on my test device) and without this line an unknown key event is generated 
>>>> (as that is not explicitly marked as KE_IGNORE without the line).
>>>
>>> OK.
>> I found more similar cases that probably don't happen on your devices, but i 
>> will just create a patch once this got merged. I think that will be easier.
>
> Alright, but i will still include UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED inside 
> the next revision.
ack
>
> Thanks,
> Armin Wolf
>
>>>
>>>>
>>>>> +
>>>>> +    /* Reported in manual mode when toggling the airplane mode status */
>>>>> +    { KE_KEY,       UNIWILL_OSD_RFKILL, { KEY_RFKILL }},
>>>>> +
>>>>> +    /* Reported when user wants to cycle the platform profile */
>>>>> +    { KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE, { KEY_UNKNOWN }},
>>>> This is a physical button on the gaming devices from Uniwill, my suggestion 
>>>> would be to bind it to F14 (because another ODM has a very similar key that 
>>>> already sends F14 by default) and then let userspace handle it (KDE for 
>>>> example has energy profiles that could be bound to it).
>>>>> +
>>>>> +    /* Reported when the user wants to adjust the brightness of the 
>>>>> keyboard */
>>>>> +    { KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN, { KEY_KBDILLUMDOWN }},
>>>>> +    { KE_KEY,       UNIWILL_OSD_KBDILLUMUP, { KEY_KBDILLUMUP }},
>>>>> +
>>>>> +    /* Reported when the user wants to toggle the microphone mute status */
>>>>> +    { KE_KEY,       UNIWILL_OSD_MIC_MUTE, { KEY_MICMUTE }},
>>>>> +
>>>>> +    /* Reported when the user locks/unlocks the Fn key */
>>>>> +    { KE_IGNORE,    UNIWILL_OSD_FN_LOCK, { KEY_FN_ESC }},
>>>>> +
>>>>> +    /* Reported when the user wants to toggle the brightness of the 
>>>>> keyboard */
>>>>> +    { KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE, { KEY_KBDILLUMTOGGLE }},
>>>>> +
>>>>> +    /* FIXME: find out the exact meaning of those events */
>>>>> +    { KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H, { KEY_UNKNOWN }},
>>>>> +    { KE_IGNORE,    UNIWILL_OSD_BAT_ERM_UPDATE, { KEY_UNKNOWN }},
>>>>> +
>>>>> +    /* Reported when the user wants to toggle the benchmark mode status */
>>>>> +    { KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE, { KEY_UNKNOWN }},
>>>>> +
>>>>> +    { KE_END }
>>>>> +};
>>>>
>>>> Any reason for still having KEY_* defines even on the ignored events? 
>>>> Looking at other drivers KE_IGNORE events usually don't have it.
>>>>
>>>> Best regards,
>>>>
>>>> Werner
>>>
>>> I decided to ignore UNIWILL_OSD_FN_LOCK because i do not know if the Fn + 
>>> Esc key presses are filtered by the EC or also received by the OS.
>>
>> Sorry for the misunderstanding.
>>
>> What i meant was: Why is it for example
>>
>> { KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC }},
>>
>> and
>>
>> { KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN }},
>>
>> instead of just
>>
>> { KE_IGNORE,    UNIWILL_OSD_FN_LOCK},
>>
>> and
>>
>> { KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE},
>>
>> ?
>>
> The FN lock definition does map to a standard keycode, so i wanted to use 
> KEY_FN_ESC
> if this key definition is used in the future. The other usages of KEY_UNKNOWN 
> exist
> because i wanted to ensure that all field of the key definitions are properly 
> initialized.
>
> Thanks,
> Armin Wolf
>
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>

