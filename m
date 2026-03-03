Return-Path: <linux-leds+bounces-7061-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7SshG/1Hp2lPgQAAu9opvQ
	(envelope-from <linux-leds+bounces-7061-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 03 Mar 2026 21:43:41 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F1C1F6E9C
	for <lists+linux-leds@lfdr.de>; Tue, 03 Mar 2026 21:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 105EA3095781
	for <lists+linux-leds@lfdr.de>; Tue,  3 Mar 2026 20:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489D7370D66;
	Tue,  3 Mar 2026 20:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Ur1sXLHa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199C9349B0A;
	Tue,  3 Mar 2026 20:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772570618; cv=none; b=f2TUx5ywEHaMi/ydVY0G7x3pbN7roV84bIKu/e5+EB1dQ6mR5P3oK/fXAVKPMPL5/hfC1/pJra/NWfc1TRWqw5m0x6DepWEuHvgqtcEVabwjjtEBXfoZCzIWhHjX5S6/1P8pEugr/f6Z6bCGPXQDN3+J0iKWqiCmMQBm+c5321U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772570618; c=relaxed/simple;
	bh=7bOWLefNoePuyVIbya0914ldN9jfCDNYYwxNKp6PS7c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=peGTnvg0dCaSDypQouJCL8Yi/BoxafLSCpFz+9xzXLXLZSA129VV4Jk5OaxYPwvmV5/r8o/oDLzhFQvGOlkuuRcXG7QMleYuPXGVvCCtWSurmPapiDAJ0XdxD0Sgn/zLFZnoUmz06HMI3YyQB5r8PPGWzS+NAsZF5/fbKU2gfHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Ur1sXLHa; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.24] (i5C75F679.versanet.de [92.117.246.121])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 1763C2FC004D;
	Tue,  3 Mar 2026 21:43:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772570613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/79h0D72UUGr7PmG9+5dbhPn+ERxCsvQnwNnMYoMws=;
	b=Ur1sXLHaqhVoDHsxFkP3z+ovFVbQsU/ppDcVTZ54GGsKwpMqbHJ/jyOJC/HVJC8WJddeyR
	Fmp9qpXZAiDUqMzSITWWFDeqxsOLHcyClY0Vzbua+3xfqlrFtytGuyKyAjW3gifXqSbF56
	NsD1q+SMOY7XOJHsWwNi0qcMqHxHR84=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <5a82f282-2ab6-4fa9-82fa-a38fdd99c386@tuxedocomputers.com>
Date: Tue, 3 Mar 2026 21:43:31 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Maximum values for multi_intensity sysfs attribute
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>, linux-leds@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Lee Jones <lee@kernel.org>,
 pavel@kernel.org
References: <2d91a44e-fce2-42dc-b529-133ab4a191f0@gmx.de>
 <2b5fa1b7-9d97-4f9b-b03e-6ecfa74c63ab@gmx.de>
 <c3b283c5-0433-4c2b-92cf-30dcfab5e0e9@tuxedocomputers.com>
Content-Language: en-US
In-Reply-To: <c3b283c5-0433-4c2b-92cf-30dcfab5e0e9@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B6F1C1F6E9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tuxedocomputers.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxedocomputers.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7061-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxedocomputers.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wse@tuxedocomputers.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action


Am 03.03.26 um 21:35 schrieb Werner Sembach:
>
> Am 03.03.26 um 21:11 schrieb Armin Wolf:
>> Am 14.02.26 um 20:15 schrieb Armin Wolf:
>>
>>> Hello,
>>>
>>> i am currently adding support for RGB keyboard backlight control to the 
>>> uniwill-laptop
>>> driver, and want to use the multicolor LED class for that. However the 
>>> hardware interface
>>> is a bit exotic:
>>>
>>> - 5 global brightness levels
>>> - 50 intensity levels for each R/G/B channel
>>>
>>> I am now asking myself how this should be mapped onto the multi_intensity 
>>> sysfs attribute.
>>> Should i set max_brightness to 5 and reject intensity values larger that 50? 
>>> Or should
>>> i set max_brightness to 50 and interpolate? What is the input range of 
>>> intensity values?
>>>
>>> Thanks,
>>> Armin Wolf 
>>
>> Any ideas on this? My current approach would be to use 5 for the max 
>> brightness and clamp intensity
>> values to 50.
> Another idea is to have multi_intensity values 0-255 and then map it to the 
> closest color so normal rgb values can be passed
this would also offer a hook point for some scaling: some uniwill devices have a 
noticeable color hue like pinkish or greenish because the leds max brightness is 
not well balanced, in tuxedo-drivers we sometimes apply some adjustments 
regulating 1 or 2 of the colors generally down like 5 or 10%
>>
>> Thanks,
>> Armin Wolf
>>

