Return-Path: <linux-leds+bounces-9041-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iVPzEmmaUmqqRQMAu9opvQ
	(envelope-from <linux-leds+bounces-9041-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:32:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA1742B3B
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:32:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OeFW+hqE;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9041-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-9041-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBB95300D9EE
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 19:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122E4181334;
	Sat, 11 Jul 2026 19:32:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F8D4499B8;
	Sat, 11 Jul 2026 19:32:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798375; cv=none; b=enUnOtVNLXrrsf4F3sk7rG3zyKUFjmLbToGSCptZbJ3+p9VtCEaciSaDtF6rnkRZIf21SFGLprr4y7CRs9IEehtIQISgigVp/8uLKhrp+SS9Q3eqZxo468QZwmvYxKxj5p0mXnckafJbfuw8ibr51qqHWTbcPX9MOtzhWm81AG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798375; c=relaxed/simple;
	bh=bwIalmVE+WdrBxLaFxLIdJUdOMskvXyWr/KSe9nizF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H+4UsRjjHxQNTuVln6FTUGtqv6k8QUxOcbGEMz8Me95tym4tq4FUADlUBoPJxcsDEymigmEm33/Y5kfUcNLJufmpCUHA7yFt8xyUq3R1ntuLmff6PXCp0lKI4MjF0kCucM8rzllF71ToJxGNXIoRXO4+2dpTgW5/2FdYRxOtdkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeFW+hqE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359F61F000E9;
	Sat, 11 Jul 2026 19:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783798373;
	bh=bwIalmVE+WdrBxLaFxLIdJUdOMskvXyWr/KSe9nizF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OeFW+hqE3MkXeNjG8mwiGvAIFs0k7HlvxXBY4fOKuZMJebY85dMEPJAN4B9i1hj1I
	 u5fj0ArriXG1Zw75r88uNN99bUzAEYb53Y3dgyymPUukw27nS8yNN2lEXQmf/ACfVO
	 xj00/huRQQIFHh5lVaLVd5Bx1xuNTwB3fHYJeXXBflmfd+GMAkL2LOdnPA++HDnffx
	 O9/g6aPKpRGV/TKkwAUV81D1pmHCGpk2zNXtxfVW8cbvwCNcEHkKt8xP4+EWjoKATD
	 rDSZ+0LNeH/aT6xppF3QCXNM9R9ZMyBB7BSsPEUsWBBy6hXBeIFdhXyinG6RS2BnHn
	 iGqo/GqTA2zYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: leds: Document "gpio" trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samuel Holland" <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260711192842.845048-2-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-2-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 19:32:52 +0000
Message-Id: <20260711193253.359F61F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9041-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,vger.kernel.org:from_smtp,sholland.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.linux.dev:replyto];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:samuel@sholland.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9BA1742B3B

> The "gpio" trigger is used to control LEDs by the level of a GPIO input
> referenced by the trigger-sources property. This is already documented
> in the trigger-sources property description and is used in at least one
> devicetree (am335x-regor.dtsi). Document it so validation of those and
> future DTs will pass.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711192842.8450=
48-1-samuel@sholland.org?part=3D1


