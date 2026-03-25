Return-Path: <linux-leds+bounces-7497-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBFtGIVIxGn5xwQAu9opvQ
	(envelope-from <linux-leds+bounces-7497-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 21:41:41 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A7032BEFC
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 21:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5C393005654
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 20:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDD9372EF6;
	Wed, 25 Mar 2026 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U724P3T4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E440372EC0
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 20:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774471298; cv=none; b=I9d1wCXkcxa4VTnMGhnoc8nAzUw5sDGnzfOhBlYrDxnOFSWqSSUVINYOgRVeEA06yjKOII72ilOe7g1coBYZyPg/mbx3Rwqp6VC8RhoKxwRIB5oh6W0W5mQ35FPrrfIyV7bEgi7LmKlLrHgidfgcTJxReYCdCY7NOiiiRU+HZSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774471298; c=relaxed/simple;
	bh=VVqlxxHZRb8tZz7boU+dlmsJ/0Syk+ZaUNbpJjU3WX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VkCzpnWpD5MXOs6mgad+8hTaPS5FPLqmSNJkvOIEY73ixqZ98f03IrVBaLHffwfd1W7r4CyEVkcl9zV9IO0vd/4HZ4e8DpZKpH6mOtK2Mgvad4QdUM/fPrnUNjEYaSfbQ+EUjg1VPtVBtlRzqKmI0w+vgR4CREpl9tmt3eLYmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U724P3T4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so2572685e9.3
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 13:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774471295; x=1775076095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+jLlAQMFJeoih+XE7tLpkictTKxnhNTWJHKi8OqzAA=;
        b=U724P3T45RJC2d4Z1hSbP7gJa4CMMNTbuJlajn5tzNW+q9fmQjE1KOSltxCcUI5sBc
         fSmYYA2k86eqz7hOEXQtu/EbcqsoIvxTdOa3AxM2rA+CDooE1XsgFZcPxjPoDBPS3Sz9
         dFpC85PTSPDwi2LUtzknujzPIXfolL+rT0zb24rUgyGovRUOoI+twQsTWOj/sr7aQE+f
         O1f0AgXqYkj/EppHosIO6t80e+BHB8AviL0qTSS9E8H6cvAm0OAlVMdhby/Dqr1sk/yh
         mUIIhVfk434FKUE2pKltoPEebTt05zhvf9/uWurTNXk+oK5Rjpf+zIBjR8+JQaoAgoLl
         rFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774471295; x=1775076095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+jLlAQMFJeoih+XE7tLpkictTKxnhNTWJHKi8OqzAA=;
        b=cB8MkrMgz3op+dZ7A05sKyz16N7bS7beWUabatc8RHzofr+6qVVpp4TORsd4iOouob
         CQJyA8tDR2WC6BnBKMbEUI47VX+AtjBcldtqAiKM/OMPVJNaOMxT784nD85JSVrmIRpB
         gz7clvyXku+Nt4FYmm/hEL+uk00jFft9Vgh87xv2BQOFF8c7jmAcvzXWxKBGuxmHMzYC
         9rV1kDzQ8X018qvhKQXTYkdEgSgHZZVT8cjwhV9BuGWbagV7Gd0JRbTCgZEbhqoeIkrb
         d9O2hY4jHrayyud4r9LDtmCpX6NjWOQke9joLETHiRpDZTi1MFC45uBTHtMXAP2DTPJF
         b4Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUqAKqGF4ka5JQgYGQ3Yv1nPwJmj11XY9tUvNvGYZT1sFRu6UZgJhn6SfqgJLwHclye3EX6LfUhLncO@vger.kernel.org
X-Gm-Message-State: AOJu0YwJHxRNOkx8kX7wbCrBLJG8wPRY0fU89ey6fCr/v3uz2H8pxqou
	m88h57snIDattuRw9Lx4za1QPWao9QwYwfLf1XQa7U/p7FL4/2SLdGcq0uR9YA==
X-Gm-Gg: ATEYQzwMk8DMJWVmWd7q+d1VmzuIVX/yeOBu0aPBva8CA1IgQduMwUs0yQUsrVB6zf3
	GX+vULKExSNM/edkYAP0AW7HyH3HmaPTqZzhilpGIm8STS884OFNTiOtMFCBLkg37BVi8SGI7HG
	jEIHckMjWcnNoLfTTSUwlIML/45CB9xk/mqMevW41TjCWjlEqvW9wzWskP+i/cCHsd9eCISGR/Y
	lZQTVcw6QwXNfB8quVRZRgJ65NJ0gYlZug3N26CB+4ppL6ZXtQ0jENaDsWN/9kbQFelDmthnAfE
	u88YlCj7QvJN8hkWk6Y5T8VOsbFGGhkKkS2w0bKC9F2avYbCjudj4OwyfF6b8uBxzkRTvSOp9qs
	ZlWoOOS6PcMZwiQY7Jxib7sMJKeYBbgOYaEwd6w7229GocZs9iouLZdCb7S0HaoprwK2dG2mt5p
	ux+yKI44uvWlKwhdzp/+B1VzPJZBqKBEeUhQSFH33nFJc8Vw==
X-Received: by 2002:a05:600c:35c6:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-4871603508fmr80589005e9.19.1774471295365;
        Wed, 25 Mar 2026 13:41:35 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fb3fc8esm6706615e9.11.2026.03.25.13.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 13:41:34 -0700 (PDT)
Message-ID: <a4f5f16a-3188-4f23-87b4-b068fd9ccf00@gmail.com>
Date: Wed, 25 Mar 2026 21:41:33 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
 wse@tuxedocomputers.com, pobrn@protonmail.com, m.tretter@pengutronix.de
References: <20260324202751.6486-1-W_Armin@gmx.de>
 <20260324202751.6486-2-W_Armin@gmx.de>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20260324202751.6486-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7497-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,protonmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacekanaszewski@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gmx.de:email]
X-Rspamd-Queue-Id: E9A7032BEFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Armin,

Thanks for the update.

On 3/24/26 9:27 PM, Armin Wolf wrote:
> Some multicolor LEDs support global brightness control in hardware,
> meaning that the maximum intensity of the color components is not
> connected to the maximum global brightness. Such LEDs cannot be
> described properly by the current multicolor LED class interface,
> because it assumes that the maximum intensity of each color component
> is described by the maximum global brightness of the LED.
> 
> Fix this by introducing a new sysfs attribute called
> "multi_max_intensity" holding the maximum intensity values for the
> color components of a multicolor LED class device. Drivers can use
> the new max_intensity field inside struct mc_subled to tell the
> multicolor LED class code about those values. Intensity values written
> by userspace applications will be limited to this maximum value.
> 
> Drivers for multicolor LEDs that do not support global brightness
> control in hardware might still want to use the maximum global LED
> brightness supplied via devicetree as the maximum intensity of each
> individual color component. Such drivers should set max_intensity
> to 0 so that the multicolor LED core can act accordingly.
> 
> The lp50xx and ncp5623 LED drivers already use hardware-based control
> for the global LED brightness. Modify those drivers to correctly
> initalize .max_intensity to avoid being limited to the maximum global
> brightness supplied via devicetree.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
>   Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
>   drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++++-
>   drivers/leds/leds-lp50xx.c                    |  1 +
>   drivers/leds/rgb/leds-ncp5623.c               |  4 +-
>   include/linux/led-class-multicolor.h          | 30 +++++++++++-
>   6 files changed, 113 insertions(+), 9 deletions(-)
Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski


