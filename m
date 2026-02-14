Return-Path: <linux-leds+bounces-6947-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG0BHufJkGnbcwEAu9opvQ
	(envelope-from <linux-leds+bounces-6947-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 14 Feb 2026 20:15:51 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EAA13D028
	for <lists+linux-leds@lfdr.de>; Sat, 14 Feb 2026 20:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67A123004619
	for <lists+linux-leds@lfdr.de>; Sat, 14 Feb 2026 19:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9532FF148;
	Sat, 14 Feb 2026 19:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GVmiJqi+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C13D38FA3;
	Sat, 14 Feb 2026 19:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771096546; cv=none; b=WbdmgxNvaLv0zTcFbqbSh4phGSyldKE1oItm6rspEB4eJgE+oud+CFav3OZ5BQkofeLy592A4BEOykoYgFXpfrPDuOjHaSC3RmeD4k+Cu5N6xxQmemVfeeMkw8dPVWg+2yYNizQJKwD2H/QEvigGyIAdVtawfARyCqlgNlLgEP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771096546; c=relaxed/simple;
	bh=m0ZaTeu+irKaJeGYYOp+BkFqiwgOOJSuUuaydMXsoSk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=cmvUblApcIhJZ7F3UJcf6HnSdeKknQWv/1ziKN++UW4XDN1pYQBrDpBjlQTEBElddW1FvhgXfCG1WIWZogAGQNfTuwmnfu453ywo0NsLNKOu9UXyGXzj2lCkEOoUnZ/OT6xJkiEoa6/0XlMTVXRXPX+dicTfcYMuOck+QLhowIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=GVmiJqi+; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771096541; x=1771701341; i=w_armin@gmx.de;
	bh=m0ZaTeu+irKaJeGYYOp+BkFqiwgOOJSuUuaydMXsoSk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GVmiJqi+z7nbYwcLLL9k6k9frgOfOcDPnwLvzUh4jboJ4rOP5afLh7yaO2v49LTg
	 WO/Gtc47yIoP92KyBWgjMUtxAOuAQNoQldsPQANQZI6FmJD2o67exDKzxG6LvNvcu
	 fUPtDbCsAQTGUKN4352+u1BEu7JSxXUDpewjylqRCWbz+/746kLyk2s/ISKoz1aGH
	 NtTkHnFyF9/dARCus/it0HaHJFZ2xiYeA/J++lGfnMi8g3H/V+U6cn7ZReKOq0WE0
	 NAGjQYuGhd5tViczU4bbSheOgkh6m//uUJw8n5fTaEJkU7U5XVBLzuTwZ/2FKv1aT
	 C69inGD/qNe6dta/nQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.242.224]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQnP-1vzMOm13DJ-00BMMW; Sat, 14
 Feb 2026 20:15:41 +0100
Message-ID: <2d91a44e-fce2-42dc-b529-133ab4a191f0@gmx.de>
Date: Sat, 14 Feb 2026 20:15:40 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-leds@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
Subject: Maximum values for multi_intensity sysfs attribute
Cc: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:sYl2XdDpkB7zUcF9et54UryR0XTgk/3V/mMjap3ssbVWvcuR8zP
 D2WNeTEK7FnORQ0AvuCCuVLLsiP22UBhwWsdx7MnPNEj4X+Aby8h4j3sAK4YMWm7bSeBSI4
 lLn3hPcE0G97/NJ6AI5FwjYOeBITqBD77QfJzIgoaBDiPlJCVrn4s3b4jECpFgGYvvorjh4
 6lEvTmyFHkfNbBOlTctiA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tsFceOTLX3k=;XSm24XI1/AOuoc/MwbNqN1vk3sO
 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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6947-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: 89EAA13D028
X-Rspamd-Action: no action

Hello,

i am currently adding support for RGB keyboard backlight control to the uniwill-laptop
driver, and want to use the multicolor LED class for that. However the hardware interface
is a bit exotic:

- 5 global brightness levels
- 50 intensity levels for each R/G/B channel

I am now asking myself how this should be mapped onto the multi_intensity sysfs attribute.
Should i set max_brightness to 5 and reject intensity values larger that 50? Or should
i set max_brightness to 50 and interpolate? What is the input range of intensity values?

Thanks,
Armin Wolf


