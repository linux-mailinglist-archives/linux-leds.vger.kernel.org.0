Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8F332277D
	for <lists+linux-leds@lfdr.de>; Tue, 23 Feb 2021 10:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbhBWJIA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Feb 2021 04:08:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbhBWJFn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2021 04:05:43 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC76C061786;
        Tue, 23 Feb 2021 01:05:02 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id v21so1637008wml.4;
        Tue, 23 Feb 2021 01:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=OP9l4+tBAc5qLLgvql1SglxOFIPcoJxpspW/dlhGxFc=;
        b=D+xsspyxTzicLSSMff15JtbBdSPX/esqKt+fZl5MFDCmsiQwX3VYIC66B4hgPXpmUB
         qrpQkNgXq8aPFK4Wj4iCFOh+ZdqppdF3/bl3tEdTp2Q+kPoyimBGPRtiM85PnD6Ry7LH
         jUBcv64Hg7i431RNd3UB77ajhyK8/hNA2BpQW74dIzn566QVyYCZ0BCx40MZDPH+ANF8
         Zw5j0xjEECY4P8wVyuXlemMzTHkRsxUW29w3khqWjV/5u5PcMafC6zW+j0QXQlTg1Kjy
         7uLl+YutXhxCWH4lr4ATGjmuHtOL0+jRi2k8UzKCR/BFjrl1L4eyAD6rb5fOAs49N42x
         x4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=OP9l4+tBAc5qLLgvql1SglxOFIPcoJxpspW/dlhGxFc=;
        b=fXSBfqfOeeIS72kDDtDJg4zc4v8VHrx+7RXTWRKH/geWd6wBGcrEbPM9NkDnoOW+Cc
         oSCBdT/7EHADutvd5AzKu1f6AAdicjz7fuQcNwJxPVwEUa6VffuxpU4gn5PeIMfMTs+7
         YXFMmgZP9ph3Bjj4G78lxY2qbHuGD1w/2jtf+z95IqoHuP8cP7+7QbyRo4D5v8uId+1q
         7sjGSLC8dUlzkvQVhb2sjANZMqkqGN5CZIl7XJo2qKW47yBJtvLMykVcjKZzcuRAL+sJ
         ndoy/BRmkn1mP6s1NOmgEJZMhmVnCUUWA4E955Vd4NWHq92r59ELfrR7SvIK38uIoaz7
         ibFQ==
X-Gm-Message-State: AOAM533mInTW768g1blPISF/Tsdf+sbTrXqLW5HjdAe8i3n7jrtCMjHo
        vb+eLz22JnUSZswGxcmRZuI=
X-Google-Smtp-Source: ABdhPJyWrovGji/0s5Q6Um/OWZqneBAYpYG17slMUsGti67alFg5lO7qKpz93PE4uzYGLJyAhskghQ==
X-Received: by 2002:a1c:ba05:: with SMTP id k5mr22989082wmf.111.1614071101345;
        Tue, 23 Feb 2021 01:05:01 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y62sm2039875wmy.9.2021.02.23.01.05.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 01:05:00 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 1/2] leds: bcm6328: improve write and read functions
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20210223085819.GB9750@amd>
Date:   Tue, 23 Feb 2021 10:05:00 +0100
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F349F1C2-4D4F-4BF7-9ADC-6E879197405B@gmail.com>
References: <20210223081732.9362-1-noltari@gmail.com>
 <20210223081732.9362-2-noltari@gmail.com> <20210223083449.GA9750@amd>
 <3826ACDE-EFF2-4CC5-82EE-2DBC991CF996@gmail.com> <20210223085819.GB9750@amd>
To:     Pavel Machek <pavel@ucw.cz>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> El 23 feb 2021, a las 9:58, Pavel Machek <pavel@ucw.cz> escribi=C3=B3:
>=20
> Hi!
>=20
>>>> This is proven to work in BMIPS BE/LE and ARM BE/LE, as used in =
bcm2835-rng
>>>> and bcmgenet drivers.
>>>> Both should also be inline functions.
>>>=20
>>>=20
>>>=20
>>>> -#ifdef CONFIG_CPU_BIG_ENDIAN
>>>> -	iowrite32be(data, reg);
>>>> -#else
>>>> -	writel(data, reg);
>>>> -#endif
>>>> +	/* MIPS chips strapped for BE will automagically configure the
>>>> +	 * peripheral registers for CPU-native byte order.
>>>> +	 */
>>>=20
>>> Bad comment style.
>>=20
>> I just wanted to copy the same comment as the one in bcm2835-rng and =
bcmgenet=E2=80=A6
>> =
https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef1=
00731/drivers/char/hw_random/bcm2835-rng.c#L42-L60
>> =
https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef1=
00731/drivers/net/ethernet/broadcom/genet/bcmgenet.c#L71-L88
>>=20
>=20
> Yeah, but ideally you should not be copying comments; there should be
> one central place which does it and does it right.

I=E2=80=99m open to suggestions :).
Which central place would be a good place for you?

>=20
> 								Pavel
>=20
> --=20
> http://www.livejournal.com/~pavelmachek

