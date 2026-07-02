Return-Path: <linux-leds+bounces-8875-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zDXVESmwRmqabgsAu9opvQ
	(envelope-from <linux-leds+bounces-8875-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:38:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9956FC2B6
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:38:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="AlANE/fS";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8875-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8875-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 905253336AEA
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 18:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF6F309F1B;
	Thu,  2 Jul 2026 18:02:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526542AD37
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 18:02:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015330; cv=none; b=m5xOpcyEFN/osM5gM7S0JNcsmSepeAlc1fkAFmTSP0+LW/n1HQQoqaPXU80iVwXPrtPrMp3Xy6sv3sIwB5AGbBsU11jf0UhhGvEfaliC/ApsXEZDXLhMaQQZ7/ChVMO8U8rCgTqymE8bXQvyggwgVzkX3Mem35PaOrHEBK7nuaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015330; c=relaxed/simple;
	bh=D+1MuniDC0lfrVerzpqvcMsUB3cbMmfZKZrCOqLprAI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kzDP78lAbKo+22Za36xlzxUDDlEpY+we2L+j098Vd49b0hCW2uvOiMomhzwVjgY2umTGf1r4AglSgkcPaaMfvye6beB9F44QucmV2LPVYfiR4RdIlb8ppILKPKkEDcNj/MvSQzdIP6UOG4X+DS5fvdqYHLr+8/H53WD4SG2TIt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlANE/fS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7C41F00A3A;
	Thu,  2 Jul 2026 18:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015329;
	bh=Ae1si3C0cJBL8miYTLJEzpUsDWEn7+oO1rYtHwHn9tw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AlANE/fScvItTfqSFKSkpdJ0RGwJocGhlcaAX3cp23CdfcJygXd6f89PahFpWYwGw
	 /83eGrgQflmo1WKi7BtNqj6xzae0vemHImlT/iERdViPntQ5Qw8A7TitgCD8hCV7Yh
	 2pNPcqyHu1fME39i0fZuqInUbrq9/ZYxDuKz+f2bMVIQkGP+Zv/RxPzoLOiOm73XOp
	 +XkQdr5G9p+BzB08rsTVf21gOSaf/agfUmNd1Fe18PErwLpFQL0kaGYpZm5RdF+Z6E
	 08X9iAKoXOXGi45ougivqK1jR26rCR3dQF4bmFc2OE2d5bEgZ5o63VacMQPNEgXbz7
	 jUtwpbG6th03Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 8/9] leds: st1202: validate LED reg property against
 channel count
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB84977B1A5C6CF09FF643498BC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84977B1A5C6CF09FF643498BC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 18:02:08 +0000
Message-Id: <20260702180208.CB7C41F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8875-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,outlook.com:email,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D9956FC2B6

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver saves an unreferenced `fwnode` pointer from an OF itera=
tor, leading to a potential use-after-free when registering the LED device.
--

commit c706b102612aa127883dfb65d961c6ac4e7aa123
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: validate LED reg property against channel count

This commit adds bounds checking for the reg property parsed from the device
tree. It ensures the value is within the ST1202_MAX_LEDS limit to prevent
out-of-bounds writes into the chip->leds array during probe.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> @@ -279,13 +279,19 @@ static int st1202_dt_init(struct st1202_chip *chip)
[ ... ]
>  		if (reg >=3D ST1202_MAX_LEDS)
>  			return dev_err_probe(dev, -EINVAL,
>  					"LED reg %u out of range [0, %d]\n",
>  					reg, ST1202_MAX_LEDS - 1);
> =20
>  		led =3D &chip->leds[reg];
>  		led->is_active =3D true;
>  		led->fwnode =3D of_fwnode_handle(child);

[Severity: High]
This isn't a bug introduced by this patch, but does st1202_dt_init() save
an unreferenced fwnode pointer here?

The scoped iterator for_each_available_child_of_node_scoped() automatically
drops the reference to the child node when the loop advances or exits. Beca=
use
the driver does not explicitly acquire a reference via fwnode_handle_get() =
or
of_node_get(), the saved pointer becomes unreferenced.

If the device tree node is dynamically removed (for example, via DT overlay
removal) after the loop finishes, its memory will be freed. Later in
st1202_probe(), devm_led_classdev_register_ext() calls device_add(), which
dereferences dev->fwnode and attempts to increment its reference count,
resulting in a use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84972A16ED=
557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D8

