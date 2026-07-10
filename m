Return-Path: <linux-leds+bounces-9001-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d8N5IkPZUGru6AIAu9opvQ
	(envelope-from <linux-leds+bounces-9001-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 13:36:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F33BB73A4CA
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 13:36:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="A09tL/es";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9001-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9001-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E74D83066B63
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 11:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3C541CB3A;
	Fri, 10 Jul 2026 11:28:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F0340B39F;
	Fri, 10 Jul 2026 11:28:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682907; cv=none; b=rhnP8VsfzhQDM07SaHn1r2BVsBvAG8/oxnEh2zkDDS4AzKrxqeOO+5bDVvxxa4sm+sVBjHFE3AqJyFuK8X874CoMvPyYXEu1KnzGBqxSVMjH6+3kYK3B9l3z4dNkfhCu8+s0AGf23ZhlVWolWbZnLMIR/mTGnIuTtoo0OwGOfEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682907; c=relaxed/simple;
	bh=anwGYWlUhs49zhjSlIBuI2L+xq4LO/mhdTy2WntYYWw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oKAcu1tUpEo2vleDo0JUjmgEiP2GyRB0pAPsZILryNseJhIsE5XT2iw5oBVOSF0UCwUEm4W/whfrj6o1bp5lUk5cUW3UHVf27LFPBSJShPiJR9iCeKYba19EqMJ6vbF+/upL87hNCM/u3XeVxOivZpR/rlZL1dbPPPzjfH18Qno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A09tL/es; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245921F00A3D;
	Fri, 10 Jul 2026 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783682896;
	bh=anwGYWlUhs49zhjSlIBuI2L+xq4LO/mhdTy2WntYYWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A09tL/esE+lvGPPJcBDmIatFVN2Q8wHChDwx1Qhs7ico1wLqakBNOmeA47etmhQlB
	 OAVj8+OrVoRShn0p5hOPCjMBgoaJsZ7oOSWvfRXRDAmg0OEoVwZS5GR95+/P10FSUn
	 CsiBO6SQvACJWywv2TCQm63OVxtQnWVIJsiL+pmeS3Jkze+fmBAspNi3YWk5sGr2yG
	 lXLjv+C7WLg7xNdep3eqdeZVzHWVxOZek/kvqs++mlUkJ4KIE5KsxqJ7Z/nFHgmXLg
	 EpJUnO6P4WB2G5e976e9TCDP0TCI6UZkTn+OfZfUYxH1Y/FspIRTDb/zKys4MD5Vdc
	 6J6cQx1HEEIbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: Add missing bracket
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Ebner" <manuelebner@mailbox.org>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710112529.435341-2-manuelebner@mailbox.org>
References: <20260710112529.435341-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:28:15 +0000
Message-Id: <20260710112816.245921F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-9001-lists,linux-leds=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:robh@kernel.org,m:dri-devel@lists.freedesktop.org,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,lists.linux.dev:replyto,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F33BB73A4CA

> Add missing '};' to code.
>=20
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710112529.4353=
41-2-manuelebner@mailbox.org?part=3D1


