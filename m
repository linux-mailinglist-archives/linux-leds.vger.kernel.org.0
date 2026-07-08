Return-Path: <linux-leds+bounces-8971-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cfQ5NQ9jTmrzLgIAu9opvQ
	(envelope-from <linux-leds+bounces-8971-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:47:43 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ED77278F6
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:47:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=E1IeKWu9;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8971-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8971-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93BE930DEE47
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 14:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51428377003;
	Wed,  8 Jul 2026 14:27:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392A02D877A;
	Wed,  8 Jul 2026 14:27:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520851; cv=none; b=aLhuDI8GC3fxHHWEufLKFTI7AYVu0IUIEm9gpczgPXwB04Y+hnn/vQiOtQISMSOm1fum2Bw76jb1I7lXUyuPQNrei9AIyBOH5aCgItRjmjtfNbzLYRffkmLQrfNg+NNWeEqX5TxFoDyGdAGRihzDitUdVHH2Zn1M9T5Q+ri7vkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520851; c=relaxed/simple;
	bh=+j0ktyffp2cjq/8foHIQP7n+VcOjXH8BPaDGKFB2qrA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kQ9/ty+wC8rYnqG9CcHp5zXHmZAdSULa0s5O0KSP530uEgvZpR3jdFF6/VjcvYDg1WYW1Uaa4og5a2XUFZ4n6FH+b24eyAm8naxJi0PrSRMtRcOrtfZruS1eL2ThRpuv4NTOpVanLSSNUto0h6z9K43K5c+Sg2QwxiJYKiuEhEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1IeKWu9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E9D1F000E9;
	Wed,  8 Jul 2026 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783520849;
	bh=+j0ktyffp2cjq/8foHIQP7n+VcOjXH8BPaDGKFB2qrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E1IeKWu9gLOBuf+BI4l1J2uYQZHp0tzVMU2mdViqAIyPXRBMFYsOkJBH/Bp+zMEWX
	 H7ni0e83U/Wn7JiV1m3S/AcMyW0kHaFduZSYggJGYdQ5kVfu/Zs9/3PuArQYXPQ322
	 WR3JrM68DB6KaDiVbWiDNS+yMefOLXsssDJW7UAx20jHqR5VvzsxRKX2Z78mkTF9ky
	 E7HE8o+IheJmsbKzsVge6g0+VuzvivBNoShNY3zFkF2OkQu50OpldU+btXgr1/liLY
	 UKmBJNyAap2wUovFUMGrXcJ9brZT669i32j5vJdD0J50CmY5Ro8IPx6AuvzdLD3XoS
	 QuprLfw4QvkSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-monza-leds-v4-2-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
 <20260708-monza-leds-v4-2-a7acfc524c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 14:27:28 +0000
Message-Id: <20260708142728.A9E9D1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8971-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,lists.linux.dev:replyto,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9ED77278F6

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description is not capitalized.
--

--- Patch [2]: [PATCH v4 2/4] dt-bindings: leds: nxp,pca963x: add multicolo=
r LED support ---
commit 30cb94bf03a6bf1ebbdadf9eba002ed180f281ee
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

dt-bindings: leds: nxp,pca963x: add multicolor LED support

This commit adds support for grouping individual PCA963x channels into a
multicolor LED by introducing a multi-led@N node pattern to model hardware
setups where multiple PWM channels drive a single physical RGB LED.

> dt-bindings: leds: nxp,pca963x: add multicolor LED support

[Severity: Low]
This isn't a bug, but the description after the subsystem prefix in the
subject line is not capitalized. The LED subsystem guidelines request
capitalizing the description (e.g., "Add multicolor LED support").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-monza-leds=
-v4-0-a7acfc524c0b@oss.qualcomm.com?part=3D2

