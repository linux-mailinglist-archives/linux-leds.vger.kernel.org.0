Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E4D32272F
	for <lists+linux-leds@lfdr.de>; Tue, 23 Feb 2021 09:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhBWInF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Feb 2021 03:43:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbhBWInE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2021 03:43:04 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEFBC061574;
        Tue, 23 Feb 2021 00:42:24 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id b3so21671869wrj.5;
        Tue, 23 Feb 2021 00:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Op1220cboh2UASN3TZPiX3CEIQMS8vK3b2FYY0QMd4M=;
        b=ogPXqnAOfJf4OZXVK1pa55Bjf+NA1ojKSI4cJNXNECr/XYaLOeoJH9ipL+YRLVnBVy
         eqc8ztORIAgLwDYlY569RzboNcdj1niPV9koajVwSjaCss6VkpDUG3Bu/7OPcLJvy3Oi
         v6ExT+7dSttovwOptil3WU6D9RmIKKIrMPxrfpWtJALbqDJFD6Zx+Z41IKWNkm7xUcoV
         h/t7hJFJdBiNVkKYC4kDuqPAJtBr4uv8+35f3BYuEJckIrgcTR3KOQB5krpr0fjFrXaq
         mlav06TSiqM1TAPkp1F+F7Qc9aeB8h/nQ1QSx8BeSsUVlxAGX+KnQNMvLpfbu72EyV3I
         3tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Op1220cboh2UASN3TZPiX3CEIQMS8vK3b2FYY0QMd4M=;
        b=SpZe4hxro9cNgOKc6ra2VPhQAxfbS1x/OUnA01K3u/imOFers4cVNp47tgjKUXU/w5
         7whlkt9So20mKkZwNkSR13DPY7F89LtH2z1TCjt0kTwqeiloK5xd4MujfVP6QmG4GEg1
         eRmDXImwEQHZYPPToGy86DxN3YhjcJU87W6LWckZcs7qJq3MhAxfM6T0mXKqe4k23PlQ
         KqkiWGQEpAo0qAlvsPXR90yeJIGD8s1woHRJR9ezgCrGHSoFMQWZA58JABZgkO+9FVOC
         rOO5Aw5PbYsX4ZqHNH7c36tAX1sxqsqKKCovrKpYevy3nxZ9oxbiNRLAZWudXqJi4ltH
         VIoA==
X-Gm-Message-State: AOAM532/Y8KlY2yVHvtAB/IBs5VuFAHOofIyRstDgovIsDs7oC/nA6Xa
        tTfeq+15AuDFuxjHkwpmLBXsV/Lp7YdHEg==
X-Google-Smtp-Source: ABdhPJwGYWmScAWVqB5Sx1KOrf5qh8z8qqBL8tfQp/4dBVM6PadvNU4exudXmBZ5ahm6vQY7a8uenQ==
X-Received: by 2002:adf:e8c5:: with SMTP id k5mr23135733wrn.135.1614069742808;
        Tue, 23 Feb 2021 00:42:22 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id w13sm30090363wrt.49.2021.02.23.00.42.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 00:42:21 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 1/2] leds: bcm6328: improve write and read functions
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20210223083449.GA9750@amd>
Date:   Tue, 23 Feb 2021 09:42:21 +0100
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3826ACDE-EFF2-4CC5-82EE-2DBC991CF996@gmail.com>
References: <20210223081732.9362-1-noltari@gmail.com>
 <20210223081732.9362-2-noltari@gmail.com> <20210223083449.GA9750@amd>
To:     Pavel Machek <pavel@ucw.cz>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

> El 23 feb 2021, a las 9:34, Pavel Machek <pavel@ucw.cz> escribi=C3=B3:
>=20
> On Tue 2021-02-23 09:17:31, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> This is proven to work in BMIPS BE/LE and ARM BE/LE, as used in =
bcm2835-rng
>> and bcmgenet drivers.
>> Both should also be inline functions.
>=20
>=20
>=20
>> -#ifdef CONFIG_CPU_BIG_ENDIAN
>> -	iowrite32be(data, reg);
>> -#else
>> -	writel(data, reg);
>> -#endif
>> +	/* MIPS chips strapped for BE will automagically configure the
>> +	 * peripheral registers for CPU-native byte order.
>> +	 */
>=20
> Bad comment style.

I just wanted to copy the same comment as the one in bcm2835-rng and =
bcmgenet=E2=80=A6
=
https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef1=
00731/drivers/char/hw_random/bcm2835-rng.c#L42-L60
=
https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef1=
00731/drivers/net/ethernet/broadcom/genet/bcmgenet.c#L71-L88

>=20
>> +	if (IS_ENABLED(CONFIG_MIPS) && =
IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
>> +		__raw_writel(data, reg);
>> +	else
>> +		writel_relaxed(data, reg);
>> }
>=20
> Code does not match comment (still need to do conversion on
> non-MIPS?), and it certainly should not be here (do all mipsen behave
> like that?!), and it really should not be converting to _relaxed at
> the same time.

I think it's because non-MIPS BE exposes that as little endian, but =
Florian can probably help us with that=E2=80=A6

>=20
> Best regards,
> 								Pavel
> --=20
> http://www.livejournal.com/~pavelmachek

Best regards,
=C3=81lvaro.=
