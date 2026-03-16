Return-Path: <linux-leds+bounces-7367-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBmyIT0uuGnhZgEAu9opvQ
	(envelope-from <linux-leds+bounces-7367-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 17:22:21 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF61F29D429
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 17:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BDE0300952E
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 16:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E599833507C;
	Mon, 16 Mar 2026 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="DfKA3gWY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91883346A0;
	Mon, 16 Mar 2026 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677908; cv=none; b=mWuMg/Ve3Q8LIoBOkl4lX4FgEOSpy13qUNizX9uvzQOLPkR+ews7YPJzKg78X+Qb3TwpfA+55onuSxHxUkS4tK30C9/z2XbZCkWLBEgBOTw2lQWlabHWeYTpF2NUJfetAdsfVjsrIcVTZkoFWNqkV8DHXb2yXdMgvu+MnVqdvJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677908; c=relaxed/simple;
	bh=0DlVtIcON1/R/+j6z/egOmUOETC/HgD02QJD3WimoNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsmpLXRMERPFS1lp97kvwm4XjYPdDvEt0envThjJItelgBqkp6ApT/Xa3OE79tJQ4SeFVv3jddebJnNofRhzqutQp17ABpaOOEWdp6kR3IbPY619y9HMpfAAiiRsiloJbhfBmDdW5NosFgivIrSuUfDF8VFtR8WNj63q6+CBf0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=DfKA3gWY; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.25] (i5C75F495.versanet.de [92.117.244.149])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 29B702FC004D;
	Mon, 16 Mar 2026 17:18:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773677903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYutiQTVw2l3cQZd3bAZ7ad+7FSI27pld21EAuEkQWo=;
	b=DfKA3gWY/xMvBDttK5E7czkerlFfrBBwiZ4z53duSXfjoNDZUc0MKEQYBFSU0ODsT5M7a+
	rFSKTeYrgjcEODVjHjUYcpBBXBNJtR13Xuji09+MvUf5ls+PljbY9ZrV0zEKwqJCKgFvh7
	e4Qvi+vxwDCdOAtLzL9uAfx73a6Syjk=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <fc23b61e-af8e-4ec7-a023-517db70a4d30@tuxedocomputers.com>
Date: Mon, 16 Mar 2026 17:18:22 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] leds: Introduce the multi_max_intensity sysfs
 attribute
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, pobrn@protonmail.com
References: <20260314230107.65444-1-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260314230107.65444-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tuxedocomputers.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxedocomputers.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,vger.kernel.org,protonmail.com];
	FREEMAIL_TO(0.00)[gmx.de,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7367-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[tuxedocomputers.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wse@tuxedocomputers.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EF61F29D429
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Am 15.03.26 um 00:01 schrieb Armin Wolf:
> This patch series was born out of of a mailing list thread [1] where
> i asked how to properly model a RGB LED as a multicolor LED. Said
> LED has some exotic properties:
>
> 1. 5 global brightness levels.
> 2. 50 intensity levels for each R/G/B color components.
>
> The current sysfs interface mandates that the maximum intensity value
> for each color component should be the same as the maximum global
> brightness. This makes sense for LEDs that only emulate global
> brightness using led_mc_calc_color_components(), but causes problems
> for LEDs that perform global brightness control in hardware.
>
> Faking a maximum global brightness of 50 will not work in this case,
> as the hardware can change the global brightness on its own. Userspace
> applications might also prefer to know the true maximum brightness
> value.
+1 from me for this change, found it strange that it wasn't already the case.
>
> Because of this i decided to add a new sysfs attribute called
> "multi_max_intensity". This attribute is similar to the
> "max_brightness" sysfs attribute, except that it targets the intensity
> values inside the "multi_intensity" sysfs atribute. I also decided to
> cap intensity values comming from userspace to said maximum intensity
> values to relieve drivers from doing it themself. This was already
> proposed in a unrelated patch [2] and might break some misbehaving
> userspace applications that do not respect max_brightness.

Also +1, max_brightness is checked too in the generic part of the code, 
multi_max_intensity should behave the same.

Since writing a wrong intensity does not return an error but just caps the 
value, the risk of breakage should be minimal i think? It might even repair some 
misbehaving userspace applications by avoiding undefined behavior.

Best regards,

Werner

>
> [1] https://lore.kernel.org/linux-leds/2d91a44e-fce2-42dc-b529-133ab4a191f0@gmx.de/
> [2] https://lore.kernel.org/linux-leds/20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de/
>
> Armin Wolf (1):
>    leds: Introduce the multi_max_intensity sysfs attribute
>
>   .../ABI/testing/sysfs-class-led-multicolor    | 16 +++++++--
>   Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++++-
>   drivers/hid/hid-lg-g15.c                      |  3 ++
>   drivers/hid/hid-playstation.c                 |  3 ++
>   drivers/leds/flash/leds-mt6360.c              |  8 ++---
>   drivers/leds/led-class-multicolor.c           | 36 +++++++++++++++++--
>   drivers/leds/leds-blinkm.c                    |  3 ++
>   drivers/leds/leds-cros_ec.c                   |  1 +
>   drivers/leds/leds-lp50xx.c                    |  1 +
>   drivers/leds/leds-lp55xx-common.c             |  7 ++--
>   drivers/leds/leds-max77705.c                  |  1 +
>   drivers/leds/leds-sun50i-a100.c               |  3 ++
>   drivers/leds/leds-turris-omnia.c              |  1 +
>   drivers/leds/rgb/leds-group-multicolor.c      |  1 +
>   drivers/leds/rgb/leds-ktd202x.c               |  1 +
>   drivers/leds/rgb/leds-lp5812.c                |  1 +
>   drivers/leds/rgb/leds-mt6370-rgb.c            |  8 ++---
>   drivers/leds/rgb/leds-ncp5623.c               |  4 +--
>   drivers/leds/rgb/leds-pwm-multicolor.c        |  1 +
>   drivers/leds/rgb/leds-qcom-lpg.c              |  1 +
>   drivers/platform/x86/silicom-platform.c       | 30 ++++++++++++++++
>   drivers/platform/x86/uniwill/uniwill-acpi.c   |  4 +--
>   include/linux/led-class-multicolor.h          | 32 ++++++++++++++++-
>   23 files changed, 164 insertions(+), 23 deletions(-)
>

