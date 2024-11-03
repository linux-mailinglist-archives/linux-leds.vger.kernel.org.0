Return-Path: <linux-leds+bounces-3243-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A299BA546
	for <lists+linux-leds@lfdr.de>; Sun,  3 Nov 2024 12:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81550B20DA5
	for <lists+linux-leds@lfdr.de>; Sun,  3 Nov 2024 11:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF282166F17;
	Sun,  3 Nov 2024 11:32:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631901CAAC;
	Sun,  3 Nov 2024 11:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.53.165.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730633529; cv=none; b=aDdWLqd+F1r6hkqkzlX/6F8L256I7c0S7Yjum01dKEDLgeIV3J2ijwsAy9D5kzZs93xF/VeqwaZyH9ExhU5UKlmJobYKNrXdPy284kRZ+s/d7cPUsRoKoHCi/Zz7uLW+Xmb9NoK9HjZp8dGfAZZGJf57h61hD5TN5ucybjFT4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730633529; c=relaxed/simple;
	bh=Nj2Rh2bwcsMvT5lD+use1WRg/EWD6d7w6x6XdOrxecM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kG9Vcua/mnMM8jUh3Y71AHOjD8ZXtBd/+cCx5GB7rbQzcg9gcYF7ZQADeEtZySqX8CbpPLFmd2zRdX2CKKyBeHOUCDmsdMvpuaVSjDA1gGCSI2hcFSYfCv90dZe8X0YHxIruLPrsqGoGppq6f5u90lHvwWlGR/HehuzeDphqFBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skole.hr; spf=pass smtp.mailfrom=skole.hr; arc=none smtp.client-ip=161.53.165.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skole.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skole.hr
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id B569481641;
	Sun,  3 Nov 2024 12:22:22 +0100 (CET)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje.mihanovic@skole.hr>
To: linux-kernel@vger.kernel.org,
 Raymond Hackley <raymondhackley@protonmail.com>
Cc: pavel@ucw.cz, lee@kernel.org, krzysztof.kozlowski@linaro.org,
 daniel.thompson@linaro.org, linus.walleij@linaro.org,
 u.kleine-koenig@baylibre.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: ktd2692: Set missing timing
Date: Sun, 03 Nov 2024 12:21:13 +0100
Message-ID: <12557112.O9o76ZdvQC@radijator>
In-Reply-To: <20241103083505.49648-1-raymondhackley@protonmail.com>
References: <20241103083505.49648-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=duje.mihanovic@skole.hr;
 keydata=
 mDMEZokhzhYJKwYBBAHaRw8BAQdAWJZ0hsI/ytTqHGFV8x6tzd5sB596cTeeDB4CQsTf+wC0KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBG3/QdYN8x
 S1t2umMK0xk1JFj60DBQJmiSHOAhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJEK0xk1JFj60D1GABAJVSorZdMOlrp/oQtCSH/G53NE56x/JHA8VX+ZQBd/H3AP4/EcUf6eef
 DUxVMh2bdkmuQKsVZGgOGiXpMksrVntWBrQpRHVqZSBNaWhhbm92acSHIDxkdWplLm1paGFub3Z
 pY0Bza29sZS5ocj6ImQQTFgoAQRYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSH/AhsDBQkJZg
 GABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEK0xk1JFj60Dlw8A/i4lPOL7NaYoYePDq
 l8MaJaR9qoUi+D+HtD3t0Koi7ztAQCdizXbuqP3AVNxy5Gpb1ozgp9Xqh2MRcNmJCHA1YhWAbg4
 BGaJIc4SCisGAQQBl1UBBQEBB0DEc9JeA55OlZfWKgvmRgw6a/EpBQ8mDl6nQTBmnd1XHAMBCAe
 IfgQYFgoAJhYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSHOAhsMBQkJZgGAAAoJEK0xk1JFj6
 0DG5MA/iuo4l2GDEZ1Zf+XaS//8FwdXDO9nHkfbV2MHjF4NZXwAQDroMzBdMcqVvc8GABFlTTgG
 j7KrRDz2HwWNyF8ZeprAQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Sunday, November 3, 2024 9:35:16=E2=80=AFAM Central European Standard Ti=
me Raymond=20
Hackley wrote:
> props.timing is not set after b5a8c50e5c18. Set it with ktd2692_timing.
>=20
> Fixes: b5a8c50e5c18 ("leds: ktd2692: Convert to use ExpressWire library")
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>  drivers/leds/flash/leds-ktd2692.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Best regards,
=2D-
Duje




