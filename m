Return-Path: <linux-leds+bounces-1982-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8AC90AAE6
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 12:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 104151F237E8
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 10:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C511119049D;
	Mon, 17 Jun 2024 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="f1SVGucv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2140317FAA4;
	Mon, 17 Jun 2024 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718619514; cv=none; b=qXP1LvRkBR+P61MW3c9f1TN8Ryt14a8NLd3GvgrhvS0Hg2+MkbDOEBkCp1Elj3gvEPtAmTbjuHAfE7Z5tmcmkrpblvoNonEAR8X5214+v6qB/9fjdIyJq/kpxI+PMc+jwukG+2hJ4NfqCtYEb0rvnFxJpfSX47meuydI2/znP4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718619514; c=relaxed/simple;
	bh=gs8nsYiINFMYuTq1/6bicsbu3Ap1eDqXcnW2kJfLN2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BH7/6vX/ttrDdzj3czwVitElSl8licj1zrwZRYzakYt6KG5V0jd9SieyjVmNhIPdb2AoS48rsWEIYsyC6cu+iNlUP7sWS1RjBHidUAH95OzgHhDTECw3HVLCUgvYdMFHXcl6b8MuouKVhr296OAyij1+wjKZThQUEyjtALPd53k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=f1SVGucv; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718619493; x=1719224293; i=markus.elfring@web.de;
	bh=gs8nsYiINFMYuTq1/6bicsbu3Ap1eDqXcnW2kJfLN2M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=f1SVGucvJNeRunLW3wYC/+MjB1yhJpxPszMnL1auqXiWjXigo8aGxEGl6qIvmSeo
	 mhTAqephXrUK+c9Y5XuUTJpyFnArk5wUIW/FCX850i5YuucExD71TwSx951yZkc3w
	 Pw7jbD1V8QskKhDJgdimGyK+GRZswEwP4r7eSHIR0qxp4b0EdvRiaNFCUqfzKo2XS
	 BDmiSoUl59dpYoUyQOrsq4qcsE325fKkIgK3KL86l/1yUMnIq0K18LXZ6PeqaFEca
	 GKsjpWp6dfIu7crQ9tPEDXmxIpJVo8bVMTm9o7g8efLlDuMyF0pc2lD/0emYRLuC1
	 qjWJ6BIskahAb8M3Ww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mvslx-1scsVu1d4x-013Z2f; Mon, 17
 Jun 2024 12:18:13 +0200
Message-ID: <e9fd75aa-3bd8-4227-ac07-fc762e558ea6@web.de>
Date: Mon, 17 Jun 2024 12:18:11 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 2/3] leds: sy7802: Add support for Silergy SY7802 flash LED
 controller
To: Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, linux-leds@vger.kernel.org, phone-devel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Cc: Bjorn Andersson <andersson@kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Conor Dooley <conor+dt@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20240616-sy7802-v4-2-789994180e05@apitzsch.eu>
 <5701d3e7-f67b-4189-a5fd-8a992b9155fb@web.de> <ZnAHsRn3N4mwPL7q@duo.ucw.cz>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ZnAHsRn3N4mwPL7q@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GWDefmdWbG1KH9MY7c/q/UMZhu3vmaXaelD2g/jpUO59SEwLjKD
 xcQ2x2fBFoVcLhHLeByPN/a81Cc0RBoF0sDdroNflR+uEd1hZJ74gu9sBrOmpMNfs2zKYN+
 Jgz5RHxUZx5vvhJBcO5Gp9iAXmFHMMP0Q+nzm3OgVsT78C35oW529L97I2m46lVWJRj9ocC
 kHLtZ2shmBYruuQ16m6pw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tQIynLLMl3Q=;wMNAskpkgNs3uqcrvyMtr7x6ALO
 RDAQ4X3uObUkU75GWXX00dyDkp5yJorSmA5BtT6y9Zpywlhb1+AlOCthnCM43e6dH1ETuYWjF
 SUkvQgH4QhQGie1HlDwxXvr7VhS4nsLNf0olVoBJWAcLhD2w+c2kVgix1XgBCmzLok2xfWYKq
 pBWwt+91lq+t1Gmq/NKHV8TGb8TMLGs3u0hFFm47PHfdXtwmDwMUvsSTSFfBe2OPEjKo3VumQ
 7MNDQKbggCDbzt5CqzlNCMX6Bszb0BrMpFko6WgdYuzzlCzkCanWAQusQL8EVD3RvjGFQ2z5X
 CzK1S8D4rdAQHdlbk46uVFl/J+34tfhdgAtR/5+Cb3cvfAkJSl+H6IkuaZWvsccAEwcUDN45e
 SkHPtB3InkOQGfDwqfV7jKSGXDPRlrfYvyTFkValmPcq8nvCjGz8kk4i3VYxhFn1idYCtBTNb
 gb4KSSjQ74cO4Gw6afPmSgl0iB/E7aeV0GStZRTfDjMaEsYRb6pnzSjsKP9Qqnamzfi/R702z
 YBE538dl4FJGq2ddyimNTI15eGCU0G3/xJpZImpC/9lDq5hXsjGpFDefxiOQA/WhC9frfGTtC
 vi4smpj7ccGUITiABz8jsSPH3Yj1K5G3wE1L8wrIBtP+jOiNZadwYykp8656SYN9HvLpzKe+a
 A+GcRBEUU/HGRgmGNYvgWLJce3/7V+1CbDW8bUWH0UCfTNi1/l/wa1+QsCi0u8gkeko+riTS8
 oJOEibGA+ZoZ+cUSE8x8VgSzqNVYn0B5W54SqS8N7HLcaxSbWBGbZZqPdRRs8qnGFO0k9seMo
 m5sCfzph+EKhrD1TlWaTtbH+NbZ3RZY8j80nODPhwvx1c=

>> Would you become interested to apply a statement like =E2=80=9Cguard(mu=
tex)(&chip->mutex);=E2=80=9D?
>> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h=
#L196
>
> This does not look like real improvement for code this trivial.

Various source code places can be updated also according to referenced
programming interfaces.
https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/cleanup.h#=
L8

Will corresponding collateral evolution become better supported?

Regards,
Markus

