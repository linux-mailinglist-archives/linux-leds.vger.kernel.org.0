Return-Path: <linux-leds+bounces-9047-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x3GOO2HQU2r1fAMAu9opvQ
	(envelope-from <linux-leds+bounces-9047-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:35:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F83A7457FD
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:35:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a6va7+Ct;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9047-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-9047-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C28B13004905
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 17:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8862526982C;
	Sun, 12 Jul 2026 17:35:26 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A377E0E4;
	Sun, 12 Jul 2026 17:35:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783877726; cv=none; b=EQZJ/sn6i4cYlPVr+KZpJ6f0nzM++Eypt7T+lT8QGhm0q4AIbOIr8cfgepnldlVjAGwKFAVbaJsmWUcKQ/rPe0ypY2uynmjj+zZ4f+nuI+wOtn4FuoCaTxGCPqpBb7nPUOH/Zyy5wbGd95HBFEY07HWCiPhci2mTujXWnvL3tz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783877726; c=relaxed/simple;
	bh=12x75EuerNeVlxa9H7QvEy2R1LUov5i361ra4hEiR9w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XiZ8UguofOvhzurZ9O3Bkg9leaai+WqAjjRuwtQLPaYpOg4SUOyVI+ytGGOh7wmbnYsQkuW6hC4NNLIDPxiTQHTolrv8sLrU14u3fqq0mkCsWhflxKnF0VV6/CXtrTmtkilHHStihWQB/oePOvWMqySR0w21LUKe0rwMG3bdukU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6va7+Ct; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54C61F000E9;
	Sun, 12 Jul 2026 17:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783877725;
	bh=12x75EuerNeVlxa9H7QvEy2R1LUov5i361ra4hEiR9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a6va7+Ct0qHPiKnDQTnya9XmhiWfMB4Y8QKdHirY/sg/2W9mtJlkBQG8PlnmojkAy
	 tgXXhP9kUYrfOO9Cgn8wFuyirGr7tUo2a2w7rOcQQdK1DS0fpTlqT5/8yiNgWV/nAM
	 F0SEIfhsYZuAddbrQVLqyOhWRU3sHZRcBiQho7NVfSoD/05DDL3l1gNT5F7fcQmRO5
	 SsvvnJeQVdApSKipKMcFIDZzCO4hOW2z3QozFNLy8jaF6wBD1GQF956zosmU/vdx7k
	 nwth3DgSynlX9AHxT6OIhG31E6RaAcjADrkIQZZOD78PztbcH74s8FF336o1KhEqOY
	 7m5+Yx3Yr+rqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 2/3] rust: leds: add Mode trait
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: ojeda@kernel.org, linux-pci@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260712-rust_leds-v22-2-055b0459a079@posteo.de>
References: <20260712-rust_leds-v22-0-055b0459a079@posteo.de>
 <20260712-rust_leds-v22-2-055b0459a079@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 17:35:24 +0000
Message-Id: <20260712173524.A54C61F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9047-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lists.linux.dev:replyto];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:ojeda@kernel.org,m:linux-pci@vger.kernel.org,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F83A7457FD

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description is not capitalized, violating the LE=
D subsystem guidelines.
--

--- Patch [2]: [PATCH v22 2/3] rust: leds: add Mode trait ---
commit 8d85f0f9ab1eee7120f30390efbe81778a293e33
Author: Markus Probst <markus.probst@posteo.de>

rust: leds: add Mode trait

This commit adds the led::Mode trait to allow for other types of led class
devices in led::LedOps.

> rust: leds: add Mode trait

[Severity: Low]
This isn't a bug, but the LED subsystem guidelines require the commit messa=
ge
description to be capitalized after the subsystem prefix. Could the subject
line be updated to "rust: leds: Add Mode trait"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712-rust_leds-=
v22-0-055b0459a079@posteo.de?part=3D2

