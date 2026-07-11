Return-Path: <linux-leds+bounces-9042-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r5TNIQ6bUmrDRQMAu9opvQ
	(envelope-from <linux-leds+bounces-9042-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:35:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D4F742B4F
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:35:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=V5Hzvgcw;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9042-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9042-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6662D300D31F
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 19:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD952D0603;
	Sat, 11 Jul 2026 19:35:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D0023E342;
	Sat, 11 Jul 2026 19:35:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798539; cv=none; b=odJNirPLBUAg/u5hvSKMgEScuNanClkurTPHPqjc+DmJPgw0alQWX/p+TTkX8ol0ukUO9RrIgY3gsA8AEZ76UQjMzf00P0DFEpBsRTb+Ca4ww1lC0QYpZYbB1nWJ1DeGiktujG5FtecEk94nBh5TkBsH7b5RyNqkAMUg06tut1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798539; c=relaxed/simple;
	bh=2OV8TB8g2+oN/5mLaW9hd8Ozk0CrOkzDs9x8O7zuUOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u41OiQouNqlExYk5RTtjdDnVBKXdO4nVVFfDzp2WOOkzcI9YdaGG+RijQObs4rABpLb4cJG7SLh3dpdPKAjZrvU/U2Zs22osfyd6fWw/HdvHjh6DdJtmCB+fpk8K2h5WmG+ehNhc9VCl2pqK8Y+f9OluORmRQBzjVg+keBat8MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5Hzvgcw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0971A1F000E9;
	Sat, 11 Jul 2026 19:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783798538;
	bh=1orBI4Ww2rbzPjR4SRblEH+KTqshWA/0dZfgnAYA22Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V5HzvgcwkozwpUDeK9HQLzmlKZlEhqvwb0ytp4t4bTnRxiQ9nPnglMHijG4K8eL0I
	 mqzVAgFCO4FtWOufFjdFNPNHZSKTEQtKAGdE+I89wlepjkQE6wyE77GT9wr0Qz27i5
	 iB636J4JQxQ6ZlpLtGyen7jG9fgJDunZAF58y/HG/11yLSSVG9ZnJCI+jBOdnCT8qf
	 /UkICRYwader8n2FQMOm1+cHon1Q7OL6zOtj7OVwGKVdjJV+za/JTn0BMYitYpL7IM
	 T+Hsf6iOdAp9zNSjLQsGoT/VnCnodLwYaHa7ALDhKF1n8O5mq3XHiXd0Iwkhbs/liz
	 IRGyfl/83xAIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Add LincStation E1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samuel Holland" <samuel@sholland.org>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260711192842.845048-5-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-5-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 19:35:37 +0000
Message-Id: <20260711193538.0971A1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9042-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url,vger.kernel.org:from_smtp,sholland.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:samuel@sholland.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8D4F742B4F

> LincStation E1 is an entry-level NAS device powered by the RK3568B2 SoC
> with two 3.5" HDD slots (behind a SATA port multiplier) and two m.2 2280
> slots for SSDs (each PCIe 3.0 x1). Other major features include:
>  - 4 GiB DRAM / 64 GB eMMC
>  - RTL8125 2.5 Gb Ethernet
>  - Fn-Link 6222B-SRC Wi-Fi 5 / Bluetooth module
>  - 1 USB 5 Gbps + 2 USB high speed ports
>  - HDMI output
>=20
> Each HDD slot provides a GPIO input for disk presence detection and an
> output for power control. Since the disks are behind a port multiplier,
> there is no way to describe them in the devicetree, so the disk power
> is enabled at all times by GPIO hogs, and the detection inputs are used
> only as LED triggers.
>=20
> The board contains several pairs of amber/white LEDs for power, disk,
> m.2 slot, and network status. These are configured to use triggers when
> possible. The PWM fan uses a relatively aggressive fan curve to keep
> the hard disks within a safe temperature range. It may benefit from
> further tuning.
>=20
> The pinhole reset button is multiplexed between the SoC reset pin and
> an ADC input. The mux is configured here to drive the SoC reset pin, as
> this works reliably without polling by software. The adc-keys
> description is included for use by a devicetree overlay if desired.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711192842.8450=
48-1-samuel@sholland.org?part=3D4


