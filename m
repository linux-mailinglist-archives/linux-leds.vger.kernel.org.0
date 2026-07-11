Return-Path: <linux-leds+bounces-9040-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TlXJN++ZUmqYRQMAu9opvQ
	(envelope-from <linux-leds+bounces-9040-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:30:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F40742B26
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:30:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aDpXXGft;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9040-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-9040-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 021773007B82
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 19:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209A430C154;
	Sat, 11 Jul 2026 19:30:54 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E201525B0AB;
	Sat, 11 Jul 2026 19:30:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798254; cv=none; b=o5DhE62J1L5lRK+T+GNwgBH/Snoe2mLmHy4DEO/9vhV5rptfClMQgGPmKqzU/Sd1mvRS0YQJB74KGG/X0Kylzv3/z3/CQ+0sD6E7B3a0t4KXYDiUZA4UF3NOxOxnbq1+yDUHQjRlLVcPxqmjRiuKTI+RiC5jq2ZK471snN+c/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798254; c=relaxed/simple;
	bh=RVYrXz7x74ud5hhffFxKrHN4BI9QSLcp4hmdZ0FjQpk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qqAJ+VHUg9sulsrfSttkXrD67twEGR1R38cOmXY41OSe07hEkP097lLe0Y/3A0L7yun64GaBBNzpje9QaRYvv6ZIWDCFjOSdT6fyElibvwKDEcYp2nckGxHcJQLVRU9V0mYThzJT6IT+qR9Bqm2bnufCLrO4UOriahItH+hvXrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDpXXGft; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313B21F000E9;
	Sat, 11 Jul 2026 19:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783798252;
	bh=RVYrXz7x74ud5hhffFxKrHN4BI9QSLcp4hmdZ0FjQpk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aDpXXGft/BP4l1bUT86g7HHE5J/Bs+1EwtyhdUV8khdrjyktqiR0n0j1WoCCBgXJx
	 Xrzt+U5CaNrKOpI1jmb8y7/Ygw+lWapN9Gm1RxnbaMsmhxLSBsCI3pDKSXGJXpQCOT
	 O9PbCAwVMKew/VAZfF4BaYgKOGLJmfJeeFhrN4GPmqfk7o//rSy5AnNjOF6nNcAh11
	 aAaBVDdYjIUuxaRNUfn3B0OJDUjXmbNmklhlrjKRqzMS6bDJcsZRIEoAw8yi2wKsie
	 oO9j6094myAykC8MHzmEMp6VH4fz5B2VJv7x/8SOhFtw6oVwwdJExrrEfr8GlIBPlV
	 Dt4kMIhVtY/jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: rockchip: Add LincStation E1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samuel Holland" <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260711192842.845048-4-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-4-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 19:30:51 +0000
Message-Id: <20260711193052.313B21F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9040-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,techvision.com.cn:url,sholland.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,lincplustech.com:url,smtp.kernel.org:mid];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:samuel@sholland.org,m:devicetree@vger.kernel.org,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64F40742B26

> LincStation E1 is an entry-level NAS device powered by the RK3568B2 SoC
> with two 3.5" HDD slots and two m.2 2280 slots for SSDs. It is marketed
> under the LincPlus[1] brand, but the OEM appears to be Techvision
> Intelligent Technology Co., Ltd[2]. The OEM model number is TVD8322R,
> which is referenced by the vendor devicetree, a sticker on the board,
> and a design patent (CN309443154S) matching the system chassis.
>=20
> Link: https://www.lincplustech.com/products/lincstation-e1-network-attach=
ed-storage.html [1]
> Link: https://cn.techvision.com.cn [2]
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711192842.8450=
48-1-samuel@sholland.org?part=3D3


