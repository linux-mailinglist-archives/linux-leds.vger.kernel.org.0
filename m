Return-Path: <linux-leds+bounces-5936-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89491C1A90F
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 14:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810511A22223
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 13:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AF433F380;
	Wed, 29 Oct 2025 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="w9+QA2Em"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72EF33F370;
	Wed, 29 Oct 2025 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761742527; cv=none; b=Vagb9sEdRKtPGR0YT3cO/FrhAGbYdxyODjHckdKKTbW/ypjaBJy++VathHD4mhZvV3XWTMIMQeSiO3YR//odY3YbGlsTmX3PoH1HblU4rhnR2fQfEGxrsul/JEquMzi/9LEvX9kKuOB+GvM2fMu0Wij/ihSewntIicC0+ac3rHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761742527; c=relaxed/simple;
	bh=KLr/rVys8cf4ET81BIFgdQElmUphQ+bJoIvhCz/fKWA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=nnHc0YWKjhwAa63XfYZLwC+leJAK2TaOb0ydxZoUHSaBQAzNJWUfbwj4PuuNTtUfcYf86DtH0kFaPChs6bDjnf4a0553u/lyX+wDO7QYZGeWBV8ZYdKxHQzjmVfTARgx6CHX0l0b5NWdNFOIYpJKajj3lOqjsQ3CQE4D+ng/mt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=w9+QA2Em; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761742511; x=1762347311; i=markus.elfring@web.de;
	bh=KLr/rVys8cf4ET81BIFgdQElmUphQ+bJoIvhCz/fKWA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=w9+QA2Em3husCV8tbOJqiF7COLDPh7azZRz25Gy/rR7xpCGp6sA1L3Kc+wqYAlzm
	 6YLfBk7Cn8QQ0J00/ykHU5cAepZoBOM1qd9+IHcJBRFT9rMOZbGvQwFjQkK0sgBC6
	 8v+lkzhVLkqKGY1Q9emyDBSC9Nef0Zm6FOMD3mnXBSNewXdJbgkK+Auf6VJ7DGesS
	 dUByMgTcFfMnLAkE7Xf2N207o1JeM6KZl4XS33Aelm/U0NJ4gCObckSCgqp2NNFJc
	 9Gk1bjvFQ1D7Dfqamx2uytuGp+MtdA7TYbcRNDaltnBSbuiwZYSnADkD1VUIDlpec
	 Ccwc0mvyJ3g39YsNCg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.249]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N9LEU-1wJRKl23Sm-00vIZz; Wed, 29
 Oct 2025 13:55:11 +0100
Message-ID: <0e5a16e1-80a1-4817-b07a-c5001f89d80e@web.de>
Date: Wed, 29 Oct 2025 13:55:09 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-leds@vger.kernel.org, Lee Jones
 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20251028082117.276-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] leds: netxbig: fix GPIO descriptor leak in error paths
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251028082117.276-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JHaXgRknZADdY9RA6kyhTl8Dv/nZS3ryqdrGd9pM1t26yzovNCm
 rugVxo2sAxm0/WNjbO/DhP2kj922uPBis8Kb1GORuPzT747WAn4yuSLfFhtxvwchsZzXVc/
 ueklWkOeeOwfxrS0+Dg7gslJMGBGAsPv1HlA0261v2IlvI7BOf59fpEyJaYgAWvpHZ/I/8y
 j3rQ5fqnQTvPY8sNbMogA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YJfynFhwARI=;F69JRhFt4BlU0pr18InfdPDOhnU
 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

=E2=80=A6
> Add goto-based error handling to release all acquired GPIOs before
> returning errors.

I propose to move the statement =E2=80=9Cret =3D PTR_ERR(gpiod);=E2=80=9D =
behind
an additional label.

Regards,
Markus

