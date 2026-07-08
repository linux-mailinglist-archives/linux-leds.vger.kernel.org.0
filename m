Return-Path: <linux-leds+bounces-8975-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7bTRLHF6TmpONgIAu9opvQ
	(envelope-from <linux-leds+bounces-8975-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 18:27:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE92728B0D
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 18:27:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nIQlqFOj;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8975-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8975-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1C123003D05
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 16:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2D043079C;
	Wed,  8 Jul 2026 16:27:27 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82332370ACF;
	Wed,  8 Jul 2026 16:27:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783528047; cv=none; b=aLGDpwTBH3t5sC3jfMxOW4JPXIgGgYFXp/uM/x5lEKLdLd3bslzr2D9ZzJHuA/70/3hgXd9eRbJDSaumsnAsplfdbsQ0RiJDuRhu2p0PmKO5oNgrsv1OlqAaoUhrxrQv0j+zNUrrXSjwpwZhguXMKQKAyZATw9TqFP8JgL9UmFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783528047; c=relaxed/simple;
	bh=/UC42KlcxRxupJ6ZTabjmHOdGc55gI1N/DSvttml9Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcXQhFm3w4yt1lBUpUQLVRXBHxFoUMiBJ5vBEQFMx9C1bfRVlnRTSAvgNFgeMMci1S8AEvBPygu5rcLxTCB+KIIqgnD2/qxmUIFAwQWReBQtPgXb+WIzpBAq0ozDVVPZ+iTr0Fcj28a5Lzz4AohmbZmUwBQJyVghAeyu1jZG6bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIQlqFOj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995FB1F000E9;
	Wed,  8 Jul 2026 16:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783528046;
	bh=/UC42KlcxRxupJ6ZTabjmHOdGc55gI1N/DSvttml9Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nIQlqFOj1L4Cr3S5n3/FguglHaBkVsztyyC7Ov0fABAnwOGR5VPtp5ZW4jt+Olzr9
	 8kGxEcaJ4shFiufyPn9pUS/0kMcyJXd/YKUdEF/VGrCNpmkUbOU0+MGgoWkpTBgvdp
	 C59FwbB2XWltyAIezLDgnRkthI4P4gtNM+Od/JPsHYdnK5BmRkxfHZcfQAcwjCs3hD
	 k2Q7J1q+Bks6T+w4qm4I3ZEPSDyeNTtCbLa9jqX0G7H9EMxtnZ+AN7aFFrPp5KJvqq
	 GCt3OVhygSCqKr/gF7M6llZSRma1e/tIIQz95ujyjAVH9+TO9BYh9kX9pMs+ve/fYY
	 RzldpYgxr++uA==
Date: Wed, 8 Jul 2026 17:27:21 +0100
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
Subject: Re: [PATCH v4 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Message-ID: <20260708-blot-subscript-3e888026eaf5@spud>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
 <20260708-monza-leds-v4-2-a7acfc524c0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vV3EJa3h+RjQFYCt"
Content-Disposition: inline
In-Reply-To: <20260708-monza-leds-v4-2-a7acfc524c0b@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-8975-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EE92728B0D

--vV3EJa3h+RjQFYCt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--vV3EJa3h+RjQFYCt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak56aQAKCRB4tDGHoIJi
0pvJAQC7lvE07B++zlLBK2i2xHXPG4xHsJlJW69LHEAlsWd0NQEAyWvRjJw7ouUW
4CiyIn2iPEO1F/kWigS77TlXfx7ELQ0=
=wB09
-----END PGP SIGNATURE-----

--vV3EJa3h+RjQFYCt--

