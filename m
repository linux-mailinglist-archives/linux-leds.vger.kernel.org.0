Return-Path: <linux-leds+bounces-2288-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5643B9384EA
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jul 2024 15:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D357AB20E88
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jul 2024 13:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168C01662EF;
	Sun, 21 Jul 2024 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="OD3LICkc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3567C161304;
	Sun, 21 Jul 2024 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721570147; cv=none; b=lHCMUGvjSsS5vsBID62r9EXnLBOcJG9EezwHflt49cNSaCLDxtO4ukhahZ+2XhMtS7pKkedBqmKn4tNAL/OPKM02NzP8u6v6I23+OixlGmc4JixsFE5UThdWfIe8fHaViAjHKODjIKuxB/xATaLg+sahGL+HLosL5X7mkLFkqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721570147; c=relaxed/simple;
	bh=xFevmzfOKgnrl/nxTRFntewJfIHvRKKbGIAOMlsnBbI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Hb63NmySnWCbQ73jFCW9xJRy9lqTIp2or0giYEyZe3dv9RJefudojb+jum2eLJGyeLtDgp4EIauhle5t3e+h/eLK64ug2GEXvq+lygOsDQKssYM4duNOIkW9vz0ZSJZK2DMa0iLGTS3MbnwsW1AhQuvE/0QB+Hf3iTdPpv6Bc8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=OD3LICkc; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721570122; x=1722174922; i=markus.elfring@web.de;
	bh=XMGTDhjn5ckH1+ZJLTe8tNpECDHAU3SMHxO2u2K/Hgw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OD3LICkceWFX3BZDyOU3M/R50f38lBpmgKuOW/G2Gt8WgwWtx2LWlBEl8pPWq6/w
	 XarzUmcZ8PXhyPfD9gsvK2FtoObSfuucrTTr2oiPOeu3+zgb3MSz/jkp3HyDw+Azg
	 cjkBtzdaYVyhjZtdB7lIwC7cE9RtqPNgd74PwJBVpsh9fzfFitLGJgGpimr+HV0bU
	 Pk0avmpwwp2B5xwdNfwQIoqnJRsD0LTxpMjpwsqfbwyRSB4jbxdltGOpxhHdNe0KI
	 /H2OP52CfxEF/xJg/h6VS7mpqf3hQop4HC5bmCtK23yfb14sK4TXHP9YBOEOB2ZsJ
	 cBOtNgkRZwSJt9wX8Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2SL5-1sJxTB22Od-017zNA; Sun, 21
 Jul 2024 15:55:22 +0200
Message-ID: <52544eec-60d0-42fa-bdb0-ffe56627c426@web.de>
Date: Sun, 21 Jul 2024 15:55:12 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <ZpzkBM_ZwM8hdwgP@admins-MacBook-Air.local>
Subject: Re: [PATCH v3 2/2] leds: Add LED1202 I2C driverr
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ZpzkBM_ZwM8hdwgP@admins-MacBook-Air.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3jza0INK8VtHtmfiexRzOETjtwzAeI9sH1aNIKpWh5lU6HhEKyU
 im4slkpZJFMAXWtYhrIESpLYQA9G26IbUAajkBosf7Y6cwrJqocG0TeKmF5citWl1kmT/z9
 jO12guzXk5/zki8FOFPYgXKqTYy1jQZP4I0C9NY/aSxA+Wp0pCxDnG6r3g/J8XFl5WZL4m6
 60Sp1PVkLZAOQV/6rs1KA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EYMGxFHQbQ8=;vKwjWHsdcZiwEWl+LRguR9/YuDC
 LtyzL0ppZs2Ih826X4/tftOknWh352fucZYmG9mRfcB+ygjXeGTeJlYx1wMQEu8HkbJEFDy+1
 SZ1+2IqLvCnQhXuvRPJ903qvrYgwjwPdoi4l7OxwBYQ9ri7uONy29sTTwtIfDGj0QcWW2RX2/
 uk770awOcgXWdUqLCPBxvRa6PTDJ64ckKdlbrgeOpmTq1sDzj/qntGf+5awagZ1p/eafJ2nev
 iucq3A3tnv46Up5WCSrTsPQ6jkOrVfq4F4nbrUePVPBP3WCAQw3y4wVy+WvCny4DKs02lANCT
 aulzf3jURv7de3tgu/6hEihkpXj6ITNx9fF5RXgsFJZQ3inhTUmMnNjsqjjWnYwB1uorWRE1F
 oIdO5yZHPwv8bXdIL641NJxzQc4KTbRBQwUkS8jS4JnyfLfZ/+WDjwEfeZgYhfflpPADbvfWR
 F/12I8km+8xVQEBAglayROSSETh7m1KZr2Xgpqwfui5P/clHziMc15/qehbBQPL71P0i8aoR8
 GH1csjzEHNC6FTkJUMeuWY/X4YylvEdGd9YVwzr5UQVtqC1/7GZHrFUPxJtBAFx3sHxaRHk2z
 +peBROhcIfPrfvcZPjdS7+ueTuV402MK0+Jn8Y+odASbQNWofGq4GpT2EgJU+yDM808GogmP3
 rupQnzzvDfG6Urg9L148TyxbVhsx6wXYicWP/jTj07CmWR3rMBW83fh4BwnqCBl1VavlK7OMs
 P5esS0UZAyo+9/jfdE5HITaBlgADEHPURYPr7UuncL0K34pnJh/Xi2EsMx10fc9PDKr8wOezv
 hTieG+lKA5NSm2p1FN6qJWAA==

> The LED1202 is a 12-channel low quiescent current LED driver.
=E2=80=A6

1. How do you think about to improve such a change description with impera=
tive wordings?
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.10#n94

2. Would you like to avoid a typo in the summary phrase?


=E2=80=A6
> +++ b/drivers/leds/leds-st1202.c
> @@ -0,0 +1,899 @@
=E2=80=A6
> +#define ST1202_LED_CHANNEL_10		10
> +#define ST1202_LED_CHANNEL_11		11
> +#define ST1202_MAX_LEDS			12
=E2=80=A6
> +#define ST1202_PATTERN_6		6
> +#define ST1202_PATTERN_7		7
> +#define ST1202_PATTERNS_NR		8

Can such identifiers be a bit nicer as part of enumerations?



=E2=80=A6
> +static ssize_t st1202_patt_seq_rep_show(struct device *dev,
> +					struct device_attribute *attr, char *buf)
> +{
=E2=80=A6
> +	chip =3D dev_get_drvdata(dev);
> +
> +	mutex_lock(&chip->lock);
=E2=80=A6
> +	mutex_unlock(&chip->lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&chip->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10/source/include/linux/mutex.h#L196

Regards,
Markus

