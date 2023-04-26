Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 108A56EF326
	for <lists+linux-leds@lfdr.de>; Wed, 26 Apr 2023 13:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240024AbjDZLMy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Apr 2023 07:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjDZLMx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Apr 2023 07:12:53 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D9F3C39
        for <linux-leds@vger.kernel.org>; Wed, 26 Apr 2023 04:12:48 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-504fce3d7fbso10714512a12.2
        for <linux-leds@vger.kernel.org>; Wed, 26 Apr 2023 04:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682507567; x=1685099567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVXnmYeKDBD9uPY/BiVYM1mRywQkV85hCD/1wkLg0rU=;
        b=HwKtibaplKx/RSWxDAdz1p5FpVjaKBpJqY+bV/NYYre1xXvzkU2VC/EvMm/TaKMntQ
         EaufzP2uy/fYmN8qGSNyIBr5eBcBL+FIkWXw+kIvovh3838bO1yLE8Jr/mc51m3i1CTl
         W7GHHuvvqlxThC0+1KaRw5Vgn8ZFYfo62u1CRu2QsCriO3C4xgA4GKP81zI2h5acxNpO
         VG9vFDtZ2Lio8YMjmqWpO8sfR/dXtcmHxzCRI8Fdfp3WwNv/2NUIItaC3A6ELYX/HU82
         3TBds0xIznNqYcmcWCLABME6NhZ9DfnsBow7mdsGt4eb4l0eJCcm486+NtxWhTqmJWrE
         tagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682507567; x=1685099567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVXnmYeKDBD9uPY/BiVYM1mRywQkV85hCD/1wkLg0rU=;
        b=H9mk62fvRq8bXJO5mCCEkJdkIXVT56TaYdfQkpOKlkUq1rdHJ9wRa3LJUgReTvw/NC
         9b07W3usAG6AovotPvbFWyPSrXCKufetBSfdUPZYyPHgrIYbb3MnttdZ9aB9O6qdSDQr
         iUpuEMkPhVoqpMUtdN+9ZZSmmU65p6a6OuKYT05Wh6gw97UwgTfvfM7n5GQMb2t822T5
         bx/Ka+62b8/YYB08XN1C1cytjmrRY7tfkNlDW2nsxvCq8VVZGWflME54Z4wno5pc1Pfk
         XneqbUicI8CUClc0YOloWteZGF56xabtxf+I0VDeb2BmQGja5wlnv/EHzrrs74JjmLI1
         8JJA==
X-Gm-Message-State: AAQBX9eWDdrzfKeV7xryoQqSHVr/eEH5IUxN6JaVYRZp6FEk8Ne69l9s
        4wEWEZDYneBFQfuefk5OogfTJsZuVltVIpZHJmU=
X-Google-Smtp-Source: AKy350b+D2oFclj31Eo4Sj+9ZNx0wCiw9CWQHr9Np3pMQfx7V4ASWsXUGnzGnLl9prU63jfT9fxnl+QQehCZzVgND6I=
X-Received: by 2002:aa7:d94d:0:b0:504:80a4:d019 with SMTP id
 l13-20020aa7d94d000000b0050480a4d019mr17612510eds.12.1682507566846; Wed, 26
 Apr 2023 04:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230413151808.20900-1-hdegoede@redhat.com> <ZDsJ6oH1/15gpAr0@jeknote.loshitsa1.net>
 <ab04d6ed-ee83-ea89-c668-f9958d9cc400@redhat.com> <ece24674-a42b-efb7-0337-b94b2628c56c@redhat.com>
In-Reply-To: <ece24674-a42b-efb7-0337-b94b2628c56c@redhat.com>
From:   Yauhen Kharuzhy <jekhor@gmail.com>
Date:   Wed, 26 Apr 2023 14:12:35 +0300
Message-ID: <CAKWEGV6KaQmKF+G87S87AvbhQRGjfyNVytGKrfNkcXd2jhD4GA@mail.gmail.com>
Subject: Re: [PATCH 0/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

OK, I will test the latest version near the weekend and will reply
with Tested-by if all will be fine.

=D0=B2=D1=82, 25 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 16:37, Han=
s de Goede <hdegoede@redhat.com>:
>
> Hi Yauhen,
>
> On 4/16/23 15:04, Hans de Goede wrote:
> > Hi Yauhen,
> >
> > On 4/15/23 22:32, Yauhen Kharuzhy wrote:
> >> On Thu, Apr 13, 2023 at 05:18:03PM +0200, Hans de Goede wrote:
> >>> Hi All,
> >>>
> >>> Here is a patch series to add support for the LED controller on
> >>> Intel Cherry Trail Whiskey Cove PMICs.
> >>>
> >>> This is based on the original patch for this from Yauhen Kharuzhy,
> >>> with additional work on top by me.
> >>>
> >>> This addresses the review remarks on the v2 posting from Yauhen:
> >>> - Since the PMIC is connected to the battery any changes we make to
> >>>   the LED settings are permanent, even surviving reboot / poweroff.
> >>>   Save LED1 register settings on probe() and if auto-/hw-control was
> >>>   enabled on probe() restore the settings on remove() and shutdown().
> >>> - Add support for the pattern trigger to select breathing mode
> >>>
> >>> This makes the charging LED on devices with these PMICs properly
> >>> reflect the charging status (this relies on sw control on most
> >>> devices) and this also allows control of the LED behind the pen
> >>> (digitizer on) symbol on the keyboard half of the Lenovo Yoga Book
> >>> 1 models.
> >>>
> >>> Regards,
> >>>
> >>> Hans
> >>>
> >>>
> >>> Hans de Goede (4):
> >>>   leds: cht-wcove: Add suspend/resume handling
> >>>   leds: cht-wcove: Add support for breathing mode use hw_pattern sysf=
s
> >>>     API
> >>>   leds: cht-wcove: Set default trigger for charging LED
> >>>   leds: cht-wcove: Use breathing when LED_INIT_DEFAULT_TRIGGER is set
> >>>
> >>> Yauhen Kharuzhy (1):
> >>>   leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver
> >>>
> >>>  Documentation/leds/index.rst          |   1 +
> >>>  Documentation/leds/leds-cht-wcove.rst |  29 ++
> >>>  drivers/leds/Kconfig                  |  11 +
> >>>  drivers/leds/Makefile                 |   1 +
> >>>  drivers/leds/leds-cht-wcove.c         | 466 ++++++++++++++++++++++++=
++
> >>>  5 files changed, 508 insertions(+)
> >>>  create mode 100644 Documentation/leds/leds-cht-wcove.rst
> >>>  create mode 100644 drivers/leds/leds-cht-wcove.c
> >>
> >> Hi Hans,
> >>
> >> Thanks for reviving this patch!
> >
> > You're welcome.
> >
> >> I haven't tested it on linux-next yet but on v6.2.11 (with few patches=
 for
> >> Yoabook) I catched following trace. I will investigate it later but ma=
ybe you
> >> can take a look also?
> >
> > Right, this is an unrelated pre-existing kernel bug when using
> > led_trigger_blink().
> >
> > I already hit that myself and I have a fix for it, see this series:
> > https://lore.kernel.org/linux-leds/20230412215855.593541-1-hdegoede@red=
hat.com/
>
> Lee is asking for testers of this series, if you have time it would be
> good if you can give this series a try in combination with this new
> leds-cht-wcove driver.
>
> Assuming the other series fixed the oops/backtrace for you can you
> please reply with your Tested-by to that series:
>
> https://lore.kernel.org/linux-leds/20230412215855.593541-1-hdegoede@redha=
t.com/
>
> (or even better give your Tested-by for both series)
>
> Regards,
>
> Hans
>


--=20
Yauhen Kharuzhy
