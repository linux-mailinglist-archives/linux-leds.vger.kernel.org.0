Return-Path: <linux-leds+bounces-8801-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SeXbLGzOQmq3CwoAu9opvQ
	(envelope-from <linux-leds+bounces-8801-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 21:58:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F5D6DE885
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 21:58:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=X+xyyRKZ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8801-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8801-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8DAA300290D
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 19:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F1E331EB2;
	Mon, 29 Jun 2026 19:58:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACDF326D55;
	Mon, 29 Jun 2026 19:58:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782763109; cv=none; b=V7+9Q2bN8QusJDpy1YotXmr4IDpRibo6fT6Liq6VGA4KSc0VUgs0yax1m7Wlmdi4JL/KDkMjTG8BjWQ9uC5B5Yt9bZ64CbU5uHXzk4dyPgBKytaGDxZkERWZ+1iXCC6OoTOWnZA4g2AR6nJkkSa2lPcRwqsv2v6Jneog8nsfuio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782763109; c=relaxed/simple;
	bh=Pr/4p417Yk+ccHUFysFdvgfkeFU/iwtNQqn2sEz9GwI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uzIyzGZoFcRSxl06O/FdC3norUr2KhmNFmtnjlxwC55sWcQ3rzHV3xt9Nrfin16uheMmNg3XlCpz0E1aR0+cM6/dVo9qKKHJYa9SQtvn1AM6QAm2TJMdE2x6ObS+f2Z8v2BUvn4TfuUFZFmAtdtQhrWYbVkT1+RSh0db02VbfWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+xyyRKZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308D81F000E9;
	Mon, 29 Jun 2026 19:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782763108;
	bh=iI9do+iageJ9x8NdPf8FlGva8q2GnSSKd09PZjSMCWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X+xyyRKZIRAZSMKe7OvrxaZjuZIbWejGrR3eHOZJPPROtNPFSnjSByo83WtUIEJW6
	 OiCV8GXRYWK47CQCZICZ8/mLb7p00scwXBdzLdQbO65uIVMQ8bBR/Bb7u0xyrtS7cS
	 UloXyviSIZyhoakBchYfPya+EtEkZDH9W/Poq5jQf0LqqwiA0mLNTebAU2DFIhUBu2
	 L3qohVj4RNmkxkOi45e++bNr5/tGodixTs1vpDsdK1eV9LMjpNENC7/YE62VWpoPT8
	 EUEbb/EFvXtWfqGQkmgqHn5xnlw0jcXqUQpP/1GL7avESRDGLwLasH3ujn5sK6w5SZ
	 4CmWhSiY5yoKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629-monza-leds-v1-3-0cf7c0a7dc14@oss.qualcomm.com>
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
 <20260629-monza-leds-v1-3-0cf7c0a7dc14@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 19:58:27 +0000
Message-Id: <20260629195828.308D81F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8801-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,qualcomm.com:email,lists.linux.dev:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5F5D6DE885

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device tree unit addresses for `led@10` and `led@11` are incorrectl=
y formatted in decimal instead of hexadecimal.
--

commit 21dc3bc44056192e48843a18f3858786db53ea22
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: monaco-arduino-monza: microcontroller LEDs

This commit adds a led controller compatible with PCA9635 to the Monaco
Arduino Monza board. It configures four RGB LEDs controlled via channels
0-2, 3-5, 6-8, and 9-11.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm=
64/boot/dts/qcom/monaco-arduino-monza.dts
> index 379b796f261f4..71685e54a3781 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts

[ ... ]

> +		multi-led@3 {
> +			reg =3D <3>;
> +			label =3D "stm-led-4";
> +			color =3D <LED_COLOR_ID_RGB>;
> +			function =3D LED_FUNCTION_STATUS;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			led@9 {
> +				reg =3D <9>;
> +				color =3D <LED_COLOR_ID_RED>;
> +			};
> +
> +			led@10 {
> +				reg =3D <10>;
> +				color =3D <LED_COLOR_ID_GREEN>;
> +			};
> +
> +			led@11 {

[Severity: Low]
This isn't a functional bug, but should the unit addresses for led@10 and l=
ed@11
be formatted as lowercase hexadecimal (e.g. led@a and led@b) to match their=
 reg
properties and avoid dtc unit_address_format warnings?

> +				reg =3D <11>;
> +				color =3D <LED_COLOR_ID_BLUE>;
> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-monza-leds=
-v1-0-0cf7c0a7dc14@oss.qualcomm.com?part=3D3

