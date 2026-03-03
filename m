Return-Path: <linux-leds+bounces-7059-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPFJHOtAp2kNgAAAu9opvQ
	(envelope-from <linux-leds+bounces-7059-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 03 Mar 2026 21:13:31 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAB81F6AD1
	for <lists+linux-leds@lfdr.de>; Tue, 03 Mar 2026 21:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF3A530210EA
	for <lists+linux-leds@lfdr.de>; Tue,  3 Mar 2026 20:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503CD389117;
	Tue,  3 Mar 2026 20:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="c5RQqKBw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6612F30DECC;
	Tue,  3 Mar 2026 20:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772568706; cv=none; b=Li8kDb8nIBB3yIDGebsWRAIk5MVjk7DBPY0potJl92Z2SITmqwaRhe0Xc48D9RvoCEv9MlNf1cu7D5QOBOWRLkMklUdHf99+BSXEFRQ7gaexSjvLvXeldTrYJofBm5/4nS8S3L6Ns2PeKwJ/QKo0C9PeTlnq4iNvSgaL/AtY+x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772568706; c=relaxed/simple;
	bh=8Vbh8IT584kH7yqeDlGs3W3BSnluNP8jGa1dOqE2z/A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=c/FmbQ5XJxceE9dqBGEvziFOvXXXMBE6AtfMZs/h3R81LUHvBxAYEwyUHlIR6tSMa8iuWe5EGRcL9SghgrCF1+EZHmVdXdGNfaPrHJqDH5SYqsoy7rAgdpvX0xSKBXKIA8hQDWDIpGJpZu8IBWRM5m5QEpzgYz0ayrfoEKjzJq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=c5RQqKBw; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772568702; x=1773173502; i=w_armin@gmx.de;
	bh=8Vbh8IT584kH7yqeDlGs3W3BSnluNP8jGa1dOqE2z/A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=c5RQqKBw29HiOhGyaa0Q4TNhIv61ETxGsk7+cDftaSW5vQ98fOkaKctzIZRvSeZF
	 LNHwyA4KGF8BOL6rYEnk4PYpJfK2nJdSPFO0adP0fftOjOiWS0QOqjSOeS4S05MV2
	 Ip2dc25XwZUDkrLA2+VjJkRkoAn8HvTDq+VFcIU9hBdvyQiZG9CGC5Pao9Ato+dvd
	 tYjSxMxHKBIHhyzTCB4prGMq9wZocA9BXOSQ1IgRTurQkGcaRwnB8hTzGf2oeO9ao
	 rDhUw2kWlT6+eOM3i/rlCc5sHaU0Bt8VovI6MaWpGxaixQ3iKG+Hasb3Qs8PQIoVe
	 cGVwuvcm4Zo3DQcTrw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9QC-1vetJK20Jw-014EWZ; Tue, 03
 Mar 2026 21:11:42 +0100
Message-ID: <2b5fa1b7-9d97-4f9b-b03e-6ecfa74c63ab@gmx.de>
Date: Tue, 3 Mar 2026 21:11:41 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Maximum values for multi_intensity sysfs attribute
From: Armin Wolf <W_Armin@gmx.de>
To: linux-leds@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Lee Jones <lee@kernel.org>,
 pavel@kernel.org
References: <2d91a44e-fce2-42dc-b529-133ab4a191f0@gmx.de>
Content-Language: en-US
In-Reply-To: <2d91a44e-fce2-42dc-b529-133ab4a191f0@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v4lZOGtp9vnb5RN/Z7wT4fo7g66XZY5HQzhDxa5FIvKq7sryh3M
 jGu8WdJ5DymRHNuLNuF+xamyR3gdKr0tupKwrdK58YtSQgEL017jXPSKJRmWP0o9l1nKeAu
 exbuhiSL0gVNZXQvIVGRdtL0hWGIaZQqzCkD9s+Asl5mx4GL6TO7VeHfVjpWQe7kJpDteIZ
 fI4jhTZPwZATo4i7ISG+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TVNOLdFQWcY=;dJ7GnP3eTWye1kuQ5libdISDI0v
 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
X-Rspamd-Queue-Id: CFAB81F6AD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7059-lists,linux-leds=lfdr.de];
	FREEMAIL_FROM(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gmx.de:dkim,gmx.de:mid]
X-Rspamd-Action: no action

Am 14.02.26 um 20:15 schrieb Armin Wolf:

> Hello,
>
> i am currently adding support for RGB keyboard backlight control to=20
> the uniwill-laptop
> driver, and want to use the multicolor LED class for that. However the=
=20
> hardware interface
> is a bit exotic:
>
> - 5 global brightness levels
> - 50 intensity levels for each R/G/B channel
>
> I am now asking myself how this should be mapped onto the=20
> multi_intensity sysfs attribute.
> Should i set max_brightness to 5 and reject intensity values larger=20
> that 50? Or should
> i set max_brightness to 50 and interpolate? What is the input range of=
=20
> intensity values?
>
> Thanks,
> Armin Wolf=20

Any ideas on this? My current approach would be to use 5 for the max brigh=
tness and clamp intensity
values to 50.

Thanks,
Armin Wolf


