Return-Path: <linux-leds+bounces-7060-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFDtK05Gp2kFgQAAu9opvQ
	(envelope-from <linux-leds+bounces-7060-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 03 Mar 2026 21:36:30 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C69B1F6E04
	for <lists+linux-leds@lfdr.de>; Tue, 03 Mar 2026 21:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52EE6301CF8E
	for <lists+linux-leds@lfdr.de>; Tue,  3 Mar 2026 20:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A879E1D555;
	Tue,  3 Mar 2026 20:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="QeglGqfc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBA6226863;
	Tue,  3 Mar 2026 20:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772570122; cv=none; b=XPM4qaDgcFg4ieJmfKhRMgoM/A3VZIBWa6SQiz6bJl8QBWrOpGlkChTX93CwfVyHY6OM32GXd82D5Lpp5oX75ImIWdjNVdrcu8PMOm91LfYWwt2Y9YXlPA9ZpzrshHXOu2QJSFMSQVv7d7DK3WJbxmGxsxy6tFhBicb7VOKmp40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772570122; c=relaxed/simple;
	bh=lQzBQ2ezcdD9qMGM64dJxOYRrITB9F0x2LBkPNNA7I0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGHdGu1Ji4d2rIKlziPqjfwVtrKs2467ulDcS2fRkOFqkloQ7hJsYotgpnKBPGKiELJ7sx+8yFGG/tadN/JDG2IqeeYYj9LOvgIbqA0sHgDDnAaTMjrVL783zW+FrTBL/rW/fjk+BkNZezlCZv/IUiXDpDEvCgENgnKsNKvlXZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=QeglGqfc; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.24] (i5C75F679.versanet.de [92.117.246.121])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 19B3F2FC004D;
	Tue,  3 Mar 2026 21:35:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772570117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cggWhPutfcBisXL+rPJqt7TrV4IaYKOgxXnGqu115OU=;
	b=QeglGqfcGoyeOMvCcRrYxEuj8JKcv+ToAxoluLatb5AJVWwzpEyDIekeepqv0kHrMByczG
	Hy8yI1NCNpM1r6OKz9Js+Mivd6rPR9Uw4HylkJQbCaM0xMHefHSvAG93tA1aUbbBF1BKNG
	AFN2NAKC5MKZTihrKNLVULLBpQCBuK0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <c3b283c5-0433-4c2b-92cf-30dcfab5e0e9@tuxedocomputers.com>
Date: Tue, 3 Mar 2026 21:35:15 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Maximum values for multi_intensity sysfs attribute
To: Armin Wolf <W_Armin@gmx.de>, linux-leds@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Lee Jones <lee@kernel.org>,
 pavel@kernel.org
References: <2d91a44e-fce2-42dc-b529-133ab4a191f0@gmx.de>
 <2b5fa1b7-9d97-4f9b-b03e-6ecfa74c63ab@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <2b5fa1b7-9d97-4f9b-b03e-6ecfa74c63ab@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0C69B1F6E04
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tuxedocomputers.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxedocomputers.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7060-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wse@tuxedocomputers.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxedocomputers.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,tuxedocomputers.com:dkim,tuxedocomputers.com:mid]
X-Rspamd-Action: no action


Am 03.03.26 um 21:11 schrieb Armin Wolf:
> Am 14.02.26 um 20:15 schrieb Armin Wolf:
>
>> Hello,
>>
>> i am currently adding support for RGB keyboard backlight control to the 
>> uniwill-laptop
>> driver, and want to use the multicolor LED class for that. However the 
>> hardware interface
>> is a bit exotic:
>>
>> - 5 global brightness levels
>> - 50 intensity levels for each R/G/B channel
>>
>> I am now asking myself how this should be mapped onto the multi_intensity 
>> sysfs attribute.
>> Should i set max_brightness to 5 and reject intensity values larger that 50? 
>> Or should
>> i set max_brightness to 50 and interpolate? What is the input range of 
>> intensity values?
>>
>> Thanks,
>> Armin Wolf 
>
> Any ideas on this? My current approach would be to use 5 for the max 
> brightness and clamp intensity
> values to 50.
Another idea is to have multi_intensity values 0-255 and then map it to the 
closest color so normal rgb values can be passed
>
> Thanks,
> Armin Wolf
>

