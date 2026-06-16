Return-Path: <linux-leds+bounces-8614-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8kodB/DpMGq0YgUAu9opvQ
	(envelope-from <linux-leds+bounces-8614-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 08:15:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2348268C6CC
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 08:15:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=RZkZ3sHt;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8614-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8614-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0838C3005330
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 06:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991C53DA7D4;
	Tue, 16 Jun 2026 06:13:40 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE63D75DE;
	Tue, 16 Jun 2026 06:13:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590420; cv=none; b=C4CE6jZhInWDblqb/atfi0IS1qZJJdE3v6t7wCDpiGSlYvkNA/5u7FPhiK5OV2QBXZZ7us/EQS5zmPPOnfRAJXfwQSCwdsSaCs1XHz9YYL1z2YitaK6IaAkPtiP8q5A0rRITYR+TO7Yjo9Qq32h3h+cSUK74gQThh5iflbJtojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590420; c=relaxed/simple;
	bh=Joo+TGlqM14IUudZi1Fr7UJlpV/SNGBjCv+OYlhkoug=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UFMtiU1fttOGkd5j5dfLC2KG77mt4shvSc9aG3oB7XbSqyy7yAumr0a7tlpR+oP6vgs9lHXUjuaGfoew1X436jkeHnzYCeQINWez8kkQT07Ro4wB3/av7IwJN8EVD5f/sHDm4Aba/9ieRlQD25yyEZ518CAlouQPSFkqBW81/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=RZkZ3sHt; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 07C8E26EB4;
	Tue, 16 Jun 2026 08:13:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDViMMbCDhrk; Tue, 16 Jun 2026 08:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781590415; bh=Joo+TGlqM14IUudZi1Fr7UJlpV/SNGBjCv+OYlhkoug=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=RZkZ3sHtpGb1mRej1EIoaIM7RpzUJWs81+a+W+9EueXVg/233tH+OKjyv7gYiW6Qx
	 xaRp12CTd2vcgpBCUeP8gExtRwU899WXTDh7YQFzc3efWXBJRBoyYhI19EBc0tQAHl
	 jFZSh3Au7dKp6kurXKad9Bn+aqfA4TterIYRuiZ5GqSNFAiz5JRMuLKxFj1yKw+3ZW
	 Rug+kBXkbCxCnb0Aog+7PINSvwj7/SZYfezn0GEPtUVf8SsV3jREgr/CmYogd6FFuw
	 Hj0JhTO5WjaOqbShfv1DuXxUTceENTyORNVcbN0ElFwRZwMeJTvuddkc6efpXwEsIc
	 Kg85JHMC+9WyQ==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 11:43:24 +0530
Message-Id: <DJA938R30SZG.7WGSHHZHP07X@disroot.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: s2mu005-pmic: reorder reg and
 interrupts properties
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Lee Jones" <lee@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Pavel Machek" <pavel@kernel.org>
References: <20260616-s2mu005-pmic-supplement-v1-0-41e84518b711@disroot.org>
 <20260616-s2mu005-pmic-supplement-v1-1-41e84518b711@disroot.org>
 <7dd8dcf3-5aec-442a-941e-7564936befa9@kernel.org>
In-Reply-To: <7dd8dcf3-5aec-442a-941e-7564936befa9@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8614-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[kauschluss@disroot.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:krzk@kernel.org,m:kauschluss@disroot.org,m:andre.draszik@linaro.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:pavel@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[disroot.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2348268C6CC

On 2026-06-16 06:14 +02:00, Krzysztof Kozlowski wrote:
> On 15/06/2026 22:26, Kaustabh Chakraborty wrote:
>> As per convention, and as also reiterated by maintainers [1], the
>> properties in schema is to be ordered similar to how its done in
>> devicetree sources; starting from compatible and reg. Re-order the
>> properties in this schema accordingly.
>>=20
>> Link: https://lore.kernel.org/all/0240eb13-6c56-4879-8db7-b990a220a78f@k=
ernel.org [1]
>> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>
> Honestly, nah... I commented on v6 so you change the patch. But you were
> posting this huge patchset faster than we can review (v6 and v7 posted
> on the same day!), so v7 got applied where you did not implement the
> comments. One small posting per 24h. One big posting per 2-3 days, not
> more often.

Fair, there were a lot of sashiko reviews, so I quickly addressed most
of them and send a v7. It is indeed a failure on my part. :(

> There is little benefit in fixing this single file.

Fine, I drop the series. I'd assumed it'd be at least fine to have it
before a stable release.

> Best regards,
> Krzysztof


