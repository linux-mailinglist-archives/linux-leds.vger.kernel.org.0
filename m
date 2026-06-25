Return-Path: <linux-leds+bounces-8740-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yKsPHmvmPGpbuAgAu9opvQ
	(envelope-from <linux-leds+bounces-8740-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:27:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074E6C3C87
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:27:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VNh1wqak;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8740-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8740-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0C38309B146
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDFC37F01C;
	Thu, 25 Jun 2026 08:23:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC5537FF40;
	Thu, 25 Jun 2026 08:23:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375812; cv=none; b=RIXhiPVQLDLEIS/p0U1gf/70ARq+WClYYd7bKZS33dG4fkGPU7iyRVVmKy5rSAhJ3jw3kg/2oL/VmPcSzMdeeujE+MMgc5Cnu2ncNPuVs2QSB/OkU5BAcpZ/lfo6ls5Mh5jqcn2O4bL3xp/WgBCW1EbQXhvbkksDhhT+BMJ4LtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375812; c=relaxed/simple;
	bh=6Ad7TtFrDQc7hFhtDC187gNuj7FjgUx7uefnEDiJy1c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=acTQ4g9YNfoC4akagpP51SuOdPfhtUXXqfjtt6299J/ZxdB4SmtVLswsTphOjpGcUxvwGCvbYtMBIG/enxtBVWDomCLod996m4S+q+ShMyzZvAxuxk5MEEEowgXbjP7fmHk2el3FMP1RtGFw1A+Ewslfc7xP1xv3ZjB8HQKTNBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNh1wqak; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FBB1F00A3D;
	Thu, 25 Jun 2026 08:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782375811;
	bh=6Ad7TtFrDQc7hFhtDC187gNuj7FjgUx7uefnEDiJy1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VNh1wqakpry2X707eY3s5NlyA0jIE2dk7Cniys34nAeyv6Pzhd7amcnaleuoVwIS0
	 E1ndRbVrELr57o5FV+V90AhE4zrap6V/Jo8R/L27JT8/M0y25/Ic0pEUubgHIupY+Y
	 pPFGNo1ZutjJfIpuOYCQLkWlv+mwx1ZabLkv+0ejW0Bz7nCykEsWd0wOPJL07/jXIf
	 vqodsb4MV9pHvnLGq4jKwc/dQH44z3RU7YRVSZw0gPKA3kpSt03e7R62WPwNMkC+H1
	 SRAHBBobhfG6kINcfeqtoczS2esyWr9cYGsGxhCD1jBkHujqJcZA0mMeiX5wrbV1bf
	 cDdd2jamXoSlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/6 RESEND] dt-bindings: input: cpcap-pwrbutton:
 convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-input@vger.kernel.org, robh@kernel.org, lee@kernel.org, dmitry.torokhov@gmail.com
In-Reply-To: <20260625081812.33474-3-clamor95@gmail.com>
References: <20260625081812.33474-1-clamor95@gmail.com>
 <20260625081812.33474-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 08:23:30 +0000
Message-Id: <20260625082330.D0FBB1F00A3D@smtp.kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8740-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-input@vger.kernel.org,m:robh@kernel.org,m:lee@kernel.org,m:dmitry.torokhov@gmail.com,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4074E6C3C87

> Convert power button devicetree bindings for the Motorola CPCAP MFD from
> TXT to YAML format. This patch does not change any functionality; the
> bindings remain the same.
>=20
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625081812.3347=
4-1-clamor95@gmail.com?part=3D2


