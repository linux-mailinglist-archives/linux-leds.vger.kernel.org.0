Return-Path: <linux-leds+bounces-8974-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mIwrKHl8TmrgNgIAu9opvQ
	(envelope-from <linux-leds+bounces-8974-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 18:36:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04149728C6B
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 18:36:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="IAth/HBe";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8974-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8974-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 363903093E06
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 16:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9139A430790;
	Wed,  8 Jul 2026 16:25:44 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA023E92A9;
	Wed,  8 Jul 2026 16:25:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527944; cv=none; b=SgLIqqHyqyr/qRpXbMTyPzoDV64bpDjBKLvfkKEZdtKpMFtWfmEXnWBpET/v1w1DvsBmez0S2xyFVf2/Vg8x7MnUm1qqvfjRvp4dPvHTQkgdzJqPpYWS7arV22HdXaaeXh5je8Ynp2BjiTTQbP61acX+kHMGdKY6+0HruCN0M5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527944; c=relaxed/simple;
	bh=a2tNkFRfD0KlQKBP31jaMgHQUa/TYY9ui16VFcmcGKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWTTko6fdykghw0YzCyznvkjHan1W0u/zMedQq+ROfta8LFpx5ydoJ5RP7UVfNv2HweZzNo6wcAb2yETGoXJExmvjj3ovtrRArU+J1ObyXRmVs8zJuqVDlTC6WBG9hxY1vmPEhrkHTQJfpUHAohNRq6rpwiOnu06kQrGwzHRGxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAth/HBe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891761F000E9;
	Wed,  8 Jul 2026 16:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783527943;
	bh=a2tNkFRfD0KlQKBP31jaMgHQUa/TYY9ui16VFcmcGKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IAth/HBeVSUG7lIoaOaB/S7hVURtBX+sGQ6L0bwXWYFnocOwfuxfdqGsUBOxOva/I
	 RTV9hEczbD2oh3B8b6W9GHwE70eHXRbGh5aFVoSZbnbipVo9Xvq2eYbKSjntEqysF8
	 pqs1MF2+RmJnwisM/iCpD5SDzz86YM1f+hVYXuRtMaqhvgrjIFCklIx28HMv0OSHZ6
	 fWyUWq6YOYkzdZUEE1NsiFzRqshoP2ym0rlKyxzOjBAPwxGD1zzcQjOEVbBHkTe3KA
	 apdV24OMlVr3/c1sGJ1QY0He3hBrA3kgDR3TRN1h429EwPyApv82QryYwmtIqVTxHB
	 Ewd/B6g78Jqew==
Date: Wed, 8 Jul 2026 17:25:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum
 for pca9635
Message-ID: <20260708-partner-carpenter-7e7e09e3b2f6@spud>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
 <20260708-monza-leds-v4-1-a7acfc524c0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DJMf1EmhaTk75qxo"
Content-Disposition: inline
In-Reply-To: <20260708-monza-leds-v4-1-a7acfc524c0b@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8974-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,microchip.com:email,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04149728C6B

--DJMf1EmhaTk75qxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DJMf1EmhaTk75qxo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak55/gAKCRB4tDGHoIJi
0l7SAQCnafjiqROG8RStS4qX9PjmQMJAK3KQE78tBf9be2/cYQEAkejsF+lMEnUV
1x2/2luy/CAqsFF+pFGjKE6jk9S2sQ0=
=Lkhl
-----END PGP SIGNATURE-----

--DJMf1EmhaTk75qxo--

