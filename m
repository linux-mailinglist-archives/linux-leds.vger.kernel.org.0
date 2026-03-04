Return-Path: <linux-leds+bounces-7082-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IZ2NE4cqGmYoAAAu9opvQ
	(envelope-from <linux-leds+bounces-7082-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 04 Mar 2026 12:49:34 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5761C1FF460
	for <lists+linux-leds@lfdr.de>; Wed, 04 Mar 2026 12:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85215300D45B
	for <lists+linux-leds@lfdr.de>; Wed,  4 Mar 2026 11:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D68438C2BD;
	Wed,  4 Mar 2026 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="vIQgyIgj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1507C36D9F9
	for <linux-leds@vger.kernel.org>; Wed,  4 Mar 2026 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624740; cv=none; b=OfWM1w6JD2lDIMJ6v9zCFT1jX8j8/4RAFejVOE7x02Ov6g5EKwJ0pfSTXjLyL9xRVO6zAUngIWuAkEJqH9AxHu71/YVTQyizTSMsQXSqkrh59+6+iyLyHismCiXLRRiM0Os7yrDZZn4NjNsowVpiUN1GPqteRI6noT5cATtLEuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624740; c=relaxed/simple;
	bh=NSSfxOufCyzLSeUyF7KE2ClTykYKbq6mmIs0z1x3ijk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lopIlqwIYR1BNqHqLU5ZQg69L8g7UT9fGIqafacjzwayuuMgCHXDmq83WIPcF6NPfqSeuRAq3dEKkrywaaJRObIAB0EWKeqdB935h6i1s2miNvqATxw9rv9wQ1ndO+HKpFotIoMkDvzV5RDZr7Usv3mTQXlSs6phJDvQAShIBNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=vIQgyIgj; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1772624730; x=1772883930;
	bh=NSSfxOufCyzLSeUyF7KE2ClTykYKbq6mmIs0z1x3ijk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=vIQgyIgj4MdWqpOB6ZK3FcKDcQeCFkdpMrlTgrzvKLF8OWMUSSLuFaBJMpBuDxI2l
	 5LQ4BWcCiIraWk7UFqJh8HbOSunpCKKWnmDr7Ql3oaxuWhED6gHlZuLNn/JjVoq6za
	 yhCCYEtTObS7jIw+JyCDkwjzXxglgmWsddvfIPclGWqCGvdFZSpF6I7vbuvG7BS2Xm
	 f25K0GjCRZIgS1LgyL5UULYJu06SYwcveS6bjdzl6tkRmpHg5p3qr/+IGBWfR1F9mA
	 DTod9PwtzWSB+lDr1kClFiC/3lRbmRqQD3wufBEQ3FIBVPq4xK9u3rPpptcaMcbR6Q
	 ZBFTsk9TCJahw==
Date: Wed, 04 Mar 2026 11:45:27 +0000
To: Armin Wolf <W_Armin@gmx.de>, linux-leds@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>
From: =?utf-8?Q?P=C5=91cze_Barnab=C3=A1s?= <pobrn@protonmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: Re: Maximum values for multi_intensity sysfs attribute
Message-ID: <90a08353-429c-4603-bc6f-536a789fe5fa@protonmail.com>
In-Reply-To: <2d91a44e-fce2-42dc-b529-133ab4a191f0@gmx.de>
References: <2d91a44e-fce2-42dc-b529-133ab4a191f0@gmx.de>
Feedback-ID: 20568564:user:proton
X-Pm-Message-ID: 646779018b0d266a558ff1836a2d51e8a284957a
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5761C1FF460
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(1.00)[subject];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7082-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,vger.kernel.org,tuxedocomputers.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.975];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pobrn@protonmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,protonmail.com:dkim,protonmail.com:mid]
X-Rspamd-Action: no action

Hi

2026. 02. 14. 20:15 keltez=C3=A9ssel, Armin Wolf =C3=ADrta:
> Hello,
>=20
> i am currently adding support for RGB keyboard backlight control to the u=
niwill-laptop
> driver, and want to use the multicolor LED class for that. However the ha=
rdware interface
> is a bit exotic:
>=20
> - 5 global brightness levels
> - 50 intensity levels for each R/G/B channel
>=20
> I am now asking myself how this should be mapped onto the multi_intensity=
 sysfs attribute.
> Should i set max_brightness to 5 and reject intensity values larger that =
50? Or should
> i set max_brightness to 50 and interpolate? What is the input range of in=
tensity values?

Is that the same interface implemented by https://github.com/pobrn/hid-ite8=
291r3
(and https://github.com/pobrn/ite8291r3-ctl)?

In any case it's probably not too different. Unfortunately I don't recall e=
ver finding a
satisfying way to integrate it with the multi-color led things. The best ap=
proach I could
find: brightness as [0; 50], while multi_intesity is [0; 255], essentially =
specifying the
color of each channel (simply clamping, without `led_mc_calc_color_componen=
ts()`). Note that
the above kernel driver does not implement per-key color setting, so this a=
pproach seemed
most sensible.


Barnab=C3=A1s P=C5=91cze

>=20
> Thanks,
> Armin Wolf
>=20
>=20



