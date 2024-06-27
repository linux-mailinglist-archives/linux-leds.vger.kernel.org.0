Return-Path: <linux-leds+bounces-2167-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E3E91A297
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 11:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC542B20C3F
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 09:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384DD137757;
	Thu, 27 Jun 2024 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="odhFXgoN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891F61BF3A;
	Thu, 27 Jun 2024 09:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719480302; cv=none; b=A5DZfM9+3C+ZZTPQU9t/W2dWk289MLBwP9mLSW2vWtxiHKIV0MPwvCiD73dGlVJlDTxcvKt3tMMygW53ADQF0TNUcAagBGuI2IfNAbLOiMlueiuO0QgQQdTs6AjeG6r1Ua61nXOFU5LXe4tma3tCrddC0yJN+xtqlo63mPqpTN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719480302; c=relaxed/simple;
	bh=euJbICgu11eNuvfWUsmW/5bzsZBqGYzIAnb0k++tV64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtzpGc1hwAhKLk+CmJQFCW9Z+PyNDYRWar1nSpNsAv9ksQgSUgL2SW5lofKpKwiGWXthfmSjx7xaAOiS76nTMxR3xRXk1ETQO6HFZ8jHOs62fqppS846ZJHqx8/R9SjgmrIDVezHwz8eXGnzcZuNCjGFdfHfueb96w/QG6I0X+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=odhFXgoN; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719480289; x=1720085089; i=markus.elfring@web.de;
	bh=48+3xLseeIyaNSOUgoXl0FU+m8DL9pwzc8+ON0U1XKw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=odhFXgoNGXIK4yQXmm7by59dy8OQefkD0O5ZOlHzilBSw/+adKHSEmvP+028wNM6
	 zgLMur5IxzLabOoup2Z28+/XXSud67bxHCdKMu1Ra/DOnVLYflCRxlPHZ2uTlzmac
	 4RFLkON1vpaytbI9wwkhcfAzOaxBI9L2Y+cQtcnHqY4Lu0pA3B0aO3E1VJfEZjDpZ
	 SYkPbfoKTY460xu+wpcYqqed7bXLFJwjHHiAkLI/pM4kCzvUAnNLgWB19DxDPus/K
	 Jw9YVwnZlm7QNcEvqwAQxi+VKuYSHOkhxNAln6V34y04pnRt7ETS88yuzfD5+Ux9g
	 nxGi2MFIsmAuieR+7Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MElZB-1s7bsg1yHr-00103h; Thu, 27
 Jun 2024 11:24:49 +0200
Message-ID: <2a1cffd6-8ca2-4dd7-94ee-2debadcb1521@web.de>
Date: Thu, 27 Jun 2024 11:24:48 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [3/3] leds: leds-lp55xx: Convert mutex lock/unlock to guard API
To: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Julia Lawall <julia.lawall@inria.fr>, Pavel Machek <pavel@ucw.cz>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
 <fa53fa80-4c0e-44d1-a62d-da219831526c@web.de>
 <20240627070909.GD2532839@google.com>
 <873c2900-859d-40eb-97df-f45f714ed295@web.de>
 <20240627082232.GG2532839@google.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240627082232.GG2532839@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2PtDIVjRAoYhsDV9zI8Q3b9UPpZNOvQJZsrnA1WvWNCFuQUbLhv
 YGqXgw2cb6FjqIFCXNGGZPD0Yr2EbL2FJE/q2w1DquMlOdNVyCPm7U+v5t3MbNlVcQRNfUo
 Ve46dxtK4/AK6/oApjQydOM6jcaIQzj3xa9KuPT4R80M5j4NEOvp5UVhXUImlM8gw2SVuSc
 SILtIRVhqJAzWaRTcmyVg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z1XJOnyBE+o=;rfBk1RqlOxYlwrOtzVjRgdSmPGQ
 Y4tfUu7MQ3SRwJ3Zw9oLB5CbErr2TxGwNVr6F0XqCmXRBOH2esB6FhzHNij2R57RcNAjD8WOq
 B/V5FMSbRK77OXRgIMBdR1WtIesMJJe/8zbGHSVtfDA5ALBCCf7k9G0qIW9jknMVZSOfVwx+X
 uJG8h2S8RQIDWD5p+78EujkdZpDZbDwzRgpv+QygaUxA7xx1aMD+Xi11EI+XpXSt/gfkYjBCo
 +AR8EK55shiMzhsDMs084s7reWtrNg4zK4xRrSrFz98Z8RjbHZRAGb8HinHVlHT+Rz+ngdjrv
 rmXo3hOhmn/TitFoGtjq0bsf4KJ0oz12bt5KKcaGm5TPaujDv4PE7t7GADLyVr1TFSVyddwyQ
 vaPGTFumXVCCljMwCNBagh1KiGdjUihpP2hJoe68Y1dw1f1qVjw6gz3/Jjmold6s3lKtMqMt2
 ylZectMHq/UdIWn0cRdWwwDBVpkWKk97z2Rn8W9BSwwSsjlt8cNhulIGp2KRqVKIweD6dULDb
 LKzAEeE1zKcGSRk226I3+Z+DOI45lHXnoq7weV6SMCUrUwYX509q5sGGiQSz6Y8n3RxGJPBe+
 PG010U/71afaQ44BGXYKthn+N5LoExv6HwPrOyrSDQi5HHBkn87MCmF382taxDDGocYiKo6C5
 evqc/ShHQ4/+oLU3Wudlty2mGlM1+OBXnadO0O9RFUY8/pneuLHfIoKyGDR1rVbKaQcJBNWIF
 Ag+SdZXbXvEWmDr+A4Omq5uIFxa5pulenZH2PGYjd3jxMwg93W5f40QX7YaTOPjJsglSvql9q
 TWZCQvaGSuNK/uT2xEDxmvWAWvvMesH6aIWeCAu4EdEK4=

>>>>> Convert any entry of mutex lock/unlock to guard API and simplify cod=
e.
>>>>
>>>> Thanks that you would like to support another bit of collateral evolu=
tion.
>>>>
>>>> * Would you get into the mood to benefit any more from applications
>>>>   of scope-based resource management?
>>>
>>> Why don't you submit them yourself instead of asking others to do work=
?
>>
>> 1. The change resistance (or acceptance) is varying for possible softwa=
re transformations
>>    in wide ranges, isn't it?
>
> How would that be any different for anyone else?

Maybe not.


> Resistance/acceptance should be based on patch quality alone.

There are further factors involved also according to usual communication c=
hallenges.


>> 2. I would appreciate better support and collaboration with additional =
development resources.
>
> In what regard?

I got the impression that progress would be hindered (or even blocked?) fo=
r a while
in selected subsystem areas.


> What additional resources could you possibly need?

Possibly known examples:

* More powerful computation equipment?

* Software improvements?

* Financial incentives?


>> 3. I hope that further improvements can be achieved also by the means o=
f
>>    the semantic patch language (Coccinelle software) in safer and more =
convenient ways.
>>    Are you looking for any extensions according to the coccicheck tool?
>
> Sounds good.

Thanks for such positive feedback.


> Submit a patch.

How long will the integration take (if you would like to take another look=
 at
growing product backlogs)?

Regards,
Markus

