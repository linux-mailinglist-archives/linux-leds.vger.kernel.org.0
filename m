Return-Path: <linux-leds+bounces-8892-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H1kpBUHrRmoFfgsAu9opvQ
	(envelope-from <linux-leds+bounces-8892-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:50:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 538AC6FD4DC
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:50:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Evw/+lLf";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8892-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8892-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2DB4301052A
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568093C3C01;
	Thu,  2 Jul 2026 22:49:25 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EE733F37A
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 22:49:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783032565; cv=none; b=CnNNhAjWXsTzab1pG4NAbSNJ1/8Giy5o5Io2eiK5mrk7at7EJtb3E0YroDhwlO+VqOib4VxnzjeTdb1qcEUK85SJlKwtVLlZ125qrM91Pmzd7YVRfcF11lV7tjxL/q+r7pMa+RKPE2ZkhEgo9Q1NKFeofvt/syD1tbY7LTCdSNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783032565; c=relaxed/simple;
	bh=H6dODduqZMBJ1Sr5gPkmsbAG9fBaZomlu6WKh6XNTLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mNSOFKC339mFDueqk8A9869NT7SNkeqXvv9nEEXx35WijbWwnAhKtyF8gWKJqKRAk3CM/NcX0UO4kaidDFjo+7iH0ipYlTvgiyID5X7p9qWgnBmF1KtSwl0uG6SVMFQeD3ISeXnCgBMi1ECux9gX+ci2UIwl4pCr0A7u3eWTFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Evw/+lLf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83671F000E9;
	Thu,  2 Jul 2026 22:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783032563;
	bh=H6dODduqZMBJ1Sr5gPkmsbAG9fBaZomlu6WKh6XNTLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Evw/+lLfI3/y3wAUAXMy20FW7+NbxOqBWxXDm9jDapEaV6i4vShXRIoE2KNHuK/Td
	 gHSRGUdXnENx0dEobA/45Ncz4BI8fuTBWlCVAmHC6jphkqbbhSeCZ63Ytm2rM4O1I+
	 SyCNapZWdI7pj4WKQN4+FVNElKp0G5iUSJGd0b48N4FJoi/2GDnqwmrhdyM+iQZEae
	 LZ/4MoINAtqn8tmgxmuhHZe66BM4hid6wudTgbWhWK+5vjxaVXS6HL75WXVsZDoGwP
	 ooxEfX+gmYObQL2+4jCrfEMrC5+sqAv5OuKU95QuGWYaYWD0HuzFfdT43Dz83XawVl
	 AE+Q5uk49IzKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/9] leds: st1202: validate LED reg property against
 channel count
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB849718B43321DB7E5A05D17BC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849718B43321DB7E5A05D17BC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:49:23 +0000
Message-Id: <20260702224923.A83671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8892-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:email,smtp.kernel.org:mid,lists.linux.dev:replyto,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 538AC6FD4DC

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver assigns a sleepable function to the LED subsystem's non=
-blocking `brightness_set` callback, leading to "scheduling while atomic" k=
ernel panics.
--

Note: The format of this review is altered to use a free-form summary inste=
ad
of inline diff quotes due to recitation restrictions.

commit e35dcdba8764dc455863a8cb25600d5218b1d1a5
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: validate LED reg property against channel count

The reg property from the device tree is used directly as an array index
into chip->leds[] without bounds checking. A value >=3D ST1202_MAX_LEDS
would cause an out-of-bounds write during probe.

[Severity: High]
This is a pre-existing issue, but does this code cause a "scheduling while
atomic" panic when a software trigger like heartbeat or timer is configured?

In drivers/leds/leds-st1202.c during st1202_dt_init(), the driver assigns
st1202_brightness_set to led->led_cdev.brightness_set. The brightness_set
callback is expected to be non-blocking by the LED subsystem core.

However, st1202_brightness_set() uses guard(mutex)(&chip->lock) and performs
I2C transactions, both of which are blocking operations.

When a software trigger fires in a softirq timer context, it calls
led_set_brightness_nosleep(), which directly invokes the brightness_set
callback. Since the callback attempts to acquire a mutex and perform I2C
transfers from this atomic context, it causes a kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497C0B898=
789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D8

