Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84ADC17B8D
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2019 16:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfEHOdx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 May 2019 10:33:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36709 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727492AbfEHOdw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 May 2019 10:33:52 -0400
Received: by mail-pf1-f194.google.com with SMTP id v80so10603307pfa.3;
        Wed, 08 May 2019 07:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ti8RoxscmQeFbrZco/zh8ZDis+BzCKXthQWzSEQuY7o=;
        b=URO8DvJ7j1D0fr6/tiQB40KjxAkKW8DlE8loX1E+7+LvOBDtIOQn8ryEPm9hwOw/bm
         BGZL2U/ZipT5bM6ut4CGAUdo9YaazvXoz1RP4JM5+13qPkgg0A91t4PdJWs3ADEOv+v2
         uK93w3+Dm3dsjlJndajTxfBhlEH+uCNk267pSFDLU/Hm4YTvupbaw9NxHZ+Ey8q97agA
         QQ2Oa+eHZTqYRgG2kEBTVnXZlvrcH2DaJsLUY0npIJfEhtWCN0dSVU8NDQUD0U9mhtg3
         smrNoe+yD+6I3HM9uFAleDjVyJi2UmzjRpsV7eiCtbivC/DvlOMIN3DVOWVd2sx2Ynm+
         rdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ti8RoxscmQeFbrZco/zh8ZDis+BzCKXthQWzSEQuY7o=;
        b=KnzDEr46F9mVFDdjdRVCYSJfL25OFNkaZTLUmNIjkBlSrV6USRO/AsDEbi8ZUsobj+
         X0obmgdtOB7ukUozq8NHkL9HTGULaECIpCp0zejv8kbfpe8Chiv1uDT7ZHnfTc2C+vRf
         d0Mz4Gi/Qb8C8erXa7BE6YJ4igalmvytqWsocejvf5CDXpDerivTB8VWRVe+3zT79cNo
         Z5VBv3DSk5pizubkzYXI+GONPKyt15QAiEnOYG4guiz0QpahacWis1eEBR5PjRRY0+j+
         1uO0EgWYpvOqmNNRRBWvF2bW6TRAL3aWFpzs6fEJJvXUfSbSTcuE3PvKinKRoH5W0BEA
         rfnA==
X-Gm-Message-State: APjAAAUTv2U1Tlj29KJUaaFIAbZg1lCIrnaJnk+7aw42Ww/09FlPaMHc
        MhDwfWUZ3QbH87imS0QrWfSpnwo+oiinkA8h7j4=
X-Google-Smtp-Source: APXvYqyeuE2kvWZU0PE6qNrHNBR9hrw7fjnPVEdRez/LTh36XBLda4//uMF7/2ad51ewg5tGMhr/SXk8g/qsdfCy2Zw=
X-Received: by 2002:a63:8e4b:: with SMTP id k72mr15655165pge.428.1557326031790;
 Wed, 08 May 2019 07:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <1552985370-13598-1-git-send-email-tklauser@distanz.ch>
 <CAHp75VcHQf0KzJqJ_PbpBF1CZgOFVyKvpUKjWybQnD7XDysq1g@mail.gmail.com>
 <28138e37-1d53-b211-b3ca-4c0ba9438b33@metux.net> <CAHp75VcGV7_-Pu07GXLxD6AT8jghxLktkDC4wLOhppDo+QhDZA@mail.gmail.com>
 <0f9d304b-bc2e-9943-d49e-3c028cddd3b4@gmail.com> <11088882-ec71-31b7-4978-c3d24edcf9ae@metux.net>
 <a1b91836-9bff-c674-067c-4fbe0716c70f@gmail.com> <522aa3b0-09cc-11e4-7db4-07eaafd04ec6@metux.net>
 <CAHp75Vd5TuRVMLzS1ftPPttCRdr+DRx-xZu0BCEr2izsY3uuEQ@mail.gmail.com> <4f4ba4bb-752f-feab-ccce-bf1e9024d8c7@metux.net>
In-Reply-To: <4f4ba4bb-752f-feab-ccce-bf1e9024d8c7@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 May 2019 17:33:40 +0300
Message-ID: <CAHp75VcyBdQcEtiZQvpV1AGwSajB2-1o+BQa5VzwV=UT-7aG9A@mail.gmail.com>
Subject: Re: [PATCH] x86: apuv2: fix spelling in comment
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Tobias Klauser <tklauser@distanz.ch>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Apr 16, 2019 at 7:36 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 15.04.19 22:20, Andy Shevchenko wrote:

... [something wrong with text formatting in your MUA]

> > You may utilize swnode API instead and have a generic driver beneath which resource provider agnostic (via device property / fwnode API).

> Well, when we add oftree probing to the driver, then using fwnode api

oftree -> unified device property API (if we are talking about driver)
fwnode API -> swnode API (if we are talking about platform code)

> for that would seems to make sense. But for now, I haven't seen a single
> board with that SoC that uses either oftree, or has proper acpi tables.

Make them. swnode API and preparing structures allows you to mock up
the thing and test.

> For the apu2/3 I don't see anything like that on the horizon - and here
> it would only help us, if all existing devices would get a fw upgrade.
> I'm not even sure, whether the whole thing can be expressed via ACPI
> tables in the way we need it.

It may. Just Do It.

> Remember, we have several layers here:
>
> a) the gpio device within the SoC (base address, gpio registers - they
>    are NOT linear, ...)
> b) assignment between invididual gpio's to the functional (virtual)
>    devices - leds, keys, rfkill, ...
>
> I'm really not up to date on recent acpi specs, but gpio entries only
> (assuming the fw in the field actually supports it) won't be sufficient.
> We'd need to express leds, keys, etc _connected_ to gpios.

I do not see any issue here.
Have you got familiar with meta-acpi [1] repository?
There are plenty examples how to describe DT enabled drivers in ACPI
tables, including gpio-keys, LEDs [2], and so on.

[1]: https://github.com/westeri/meta-acpi
[2]: https://github.com/westeri/meta-acpi/blob/master/recipes-bsp/acpi-tables/samples/edison/leds.asli

-- 
With Best Regards,
Andy Shevchenko
