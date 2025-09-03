Return-Path: <linux-leds+bounces-5379-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4371AB4279B
	for <lists+linux-leds@lfdr.de>; Wed,  3 Sep 2025 19:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D70AA1B21F6A
	for <lists+linux-leds@lfdr.de>; Wed,  3 Sep 2025 17:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CBF31A57A;
	Wed,  3 Sep 2025 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="CtpPerlR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42F5313E1D;
	Wed,  3 Sep 2025 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756919308; cv=none; b=ugfACrW53AFnhmmPOAscTu4+6hS654SO3bWDcSnRWb2+WW+QMi0Er4XU7wCMusFSKXuhUTrYAWMX5sFwdeVBP1kxQIqnv9nU8tmvzQICjk1sFjBLqrC3nDCzwBaB9iyO2EvA2vpxWLbj3IHBxCoHyyTioRG7N1+aKuRqL3LI/8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756919308; c=relaxed/simple;
	bh=NB8QgCqzFMNbHyvhlII7K/CnDnXfXYtmILcedNKdDtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhWsC3cm1Q75bL+x6YqHoqcJbUVzz9f22GawXwG6m0TTUjoVuA3D3XOh3jahL+vW0/O9cfWEyHbljjdAe0HcZyymKmEKd4niWxRB1tyR9+2k6jQg2anLjRWI172ybKTsPsE7NqJTWzSV9aPH7Sl4So9H4jaPMP95D6gr6t/bBu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=CtpPerlR; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5de4594b.dip0.t-ipconnect.de [93.228.89.75])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 9FB932FC005B;
	Wed,  3 Sep 2025 19:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1756919295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRqRfjYcBm2bOUiZmVAHhsKibPriU5ZkVd7sC+K84j8=;
	b=CtpPerlRlxjQIRKNMcJ46hAzI9agXWcJwijTM2Z2k5bm7uuK79fMStKBhncldFge2E6qXk
	3Y/yBbdE2JO4RDojY7JeB33jYAmQxCz4Lo6lKfGBceR5hw8k86t5ShQQ+h7uHiVvVdE0Sy
	k2kCQEmKANHqOnr+w2zo3uSulV5KqPw=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <003d760c-0314-4ea2-b2b5-860021e0daf8@tuxedocomputers.com>
Date: Wed, 3 Sep 2025 19:08:14 +0200
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
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250831192708.9654-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

started to look into the driver regarding TUXEDO NB02 devices support, starting 
with the FN-Keys:

Am 31.08.25 um 21:27 schrieb Armin Wolf:
> +static const struct key_entry uniwill_keymap[] = {
> +	/* Reported via keyboard controller */
> +	{ KE_IGNORE,    UNIWILL_OSD_CAPSLOCK,                   { KEY_CAPSLOCK }},
> +	{ KE_IGNORE,    UNIWILL_OSD_NUMLOCK,                    { KEY_NUMLOCK }},
> +
> +	/* Reported when the user locks/unlocks the super key */
> +	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,      { KEY_UNKNOWN }},
> +	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,     { KEY_UNKNOWN }},

Can you also add

{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,     { KEY_UNKNOWN }},

?

UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE and UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE are 
always sent in pair with UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED (at least on my test 
device) and without this line an unknown key event is generated (as that is not 
explicitly marked as KE_IGNORE without the line).

> +
> +	/* Reported in manual mode when toggling the airplane mode status */
> +	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL }},
> +
> +	/* Reported when user wants to cycle the platform profile */
> +	{ KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN }},
This is a physical button on the gaming devices from Uniwill, my suggestion 
would be to bind it to F14 (because another ODM has a very similar key that 
already sends F14 by default) and then let userspace handle it (KDE for example 
has energy profiles that could be bound to it).
> +
> +	/* Reported when the user wants to adjust the brightness of the keyboard */
> +	{ KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { KEY_KBDILLUMDOWN }},
> +	{ KE_KEY,       UNIWILL_OSD_KBDILLUMUP,                 { KEY_KBDILLUMUP }},
> +
> +	/* Reported when the user wants to toggle the microphone mute status */
> +	{ KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE }},
> +
> +	/* Reported when the user locks/unlocks the Fn key */
> +	{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC }},
> +
> +	/* Reported when the user wants to toggle the brightness of the keyboard */
> +	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLUMTOGGLE }},
> +
> +	/* FIXME: find out the exact meaning of those events */
> +	{ KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN }},
> +	{ KE_IGNORE,    UNIWILL_OSD_BAT_ERM_UPDATE,             { KEY_UNKNOWN }},
> +
> +	/* Reported when the user wants to toggle the benchmark mode status */
> +	{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN }},
> +
> +	{ KE_END }
> +};

Any reason for still having KEY_* defines even on the ignored events? Looking at 
other drivers KE_IGNORE events usually don't have it.

Best regards,

Werner



