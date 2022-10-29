Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBF7612497
	for <lists+linux-leds@lfdr.de>; Sat, 29 Oct 2022 19:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiJ2RLy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 Oct 2022 13:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiJ2RLx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 Oct 2022 13:11:53 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B8B29CB6
        for <linux-leds@vger.kernel.org>; Sat, 29 Oct 2022 10:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1667063510; bh=oI56gMoUonHrYtL716u3JQ4Wh6yq9k1LEv/9iufW4Vs=;
        h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
        b=sbodd94iku8HjcCWQUxYtjPy1MEv26asGkS/VIn4Gsb/VEoRmvK2fsQmkmYslJBnM
         cO7cYzdRYQNm8JXsbfiR8F6/9eXzl1EuQ4NKZxvWF7m6AkN1vP4qtEJ0GInuHGHeQz
         6wR/zNoRA0h4SjmhfmU5Vm1Zvue97vFb6AAJVu/DymSZvJeDRpaqCilHMLVG2BTQSL
         c4EzRZJBW7+8AFBgSM825Wgf/Uo54dLf/DBeRJ5IEBkX4Jex4DALfqdkpJsqSKmocF
         VbkMW7O/Kpo0UGO1YrgvTBEQRHmJkcgvsDmbKKjYQcUMDboafIIxyFfxBPHYbVWEEx
         RKg+Dr4gy7HjQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mail-ej1-f45.google.com ([209.85.218.45]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N2E1M-1pCYzw2TEc-013g41 for <linux-leds@vger.kernel.org>; Sat, 29 Oct 2022
 19:11:50 +0200
Received: by mail-ej1-f45.google.com with SMTP id b2so19939580eja.6
        for <linux-leds@vger.kernel.org>; Sat, 29 Oct 2022 10:11:50 -0700 (PDT)
X-Gm-Message-State: ACrzQf0pYtPTde6v2SXAXXTBnrjDZIpR6c2yxy3UmBdGIllNSo6sCmoo
        xXf1D5oL2ITY/onMFlObY42UVfgfax1Xz5T31pc=
X-Google-Smtp-Source: AMsMyM5m3Ff2NuDQHvONxGrfENK7LKRbXb0zWmhxHaS8z2WM7Gm+0B7KgrJR3WzsKC2teSUhQu92+Q2hVX6VADiap2Q=
X-Received: by 2002:a17:906:9bd5:b0:7ad:939d:79a9 with SMTP id
 de21-20020a1709069bd500b007ad939d79a9mr4582370ejc.479.1667063510305; Sat, 29
 Oct 2022 10:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <CABfF9mNvf93FAxX7MWVe5KxhrBTV4_ZBzhJPs-JT+tXdyaja1g@mail.gmail.com>
 <20221029165218.GA3337@duo.ucw.cz>
In-Reply-To: <20221029165218.GA3337@duo.ucw.cz>
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Sat, 29 Oct 2022 19:11:38 +0200
X-Gmail-Original-Message-ID: <CABfF9mNcem--3Yf3wZ8Pgmvq3A4AgAj1tFN9bsQOqfJLtnqhkQ@mail.gmail.com>
Message-ID: <CABfF9mNcem--3Yf3wZ8Pgmvq3A4AgAj1tFN9bsQOqfJLtnqhkQ@mail.gmail.com>
Subject: Re: Proposal: Add color_temperature support
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:eG1wo+ESKxqFHM4TE5ZA6/0XjbT4nlUJk9Ylz5dKYyBL39TePYG
 bXAsEmp2mlHOsuJNrsaN8EAZUTaWjT4TYSWtK0l7wRUM+pNDhR9nBps38rAJC9ABdqhcKkn
 l3qdH7gBQSJKtJzHM5xlv+5fEZz2EL0DllyPsWmorHhWHHXMCiBICmxdqPOJtcH7iLdtsFd
 dS6FvtKEHoip/R/ci/Kww==
UI-OutboundReport: notjunk:1;M01:P0:EHVOVaL2Ps4=;kp+vaGj+TzBZYlEUTul10Rj7KfP
 g5U5vJnoOaiSYmREG65SDwAwVA6/TC/Lf400JoFaa2m0G5qapkMlRSKMJaCdZJRkNewUbEis5
 RIb462HMD/hXMOPRI/+ti82xOG+RTh2TNuL5IjGjrw/Ib+oWMo2kWAc4PACT+ufNr/+tabXCg
 SO0/vAb7B5IYyXf5LbU+iTG5sK9qL4DmSRNwxUo1wIdJUyOKWZujEXzHUp3KO5hud0/LmeGXt
 KK3wNKalzWjLrdLpMFbxL+MEZh6m0CumE+c12tQPq+RmtpR4OJJmi4Tf6hIM89oQCGadF7O5l
 F3x2mYUcmsqAq7pnAs0gp/ZTOk+DnQ2SwQ6x6we8WaYSfZqMt3k0HOhSfdcwrpdTA93k908Ig
 14VxObxyzvYDI1qZmaJxmBeKclgMmZ+6p7tYEeEtH8Jwl3Hm7Eo0mbLwqVFGDS6c633jxENJ1
 EfX8m3L6ix9bc9X1z1r/Y4PbL+GvltmcugZLMwaVsLcScisQkWza4fi0xjLf/malX3B5JvCG/
 Y8w1u3j+J4agQBabENyGKroO1bn6nqY92cjjiMWnFBbJtWZA1nRXRLdFkPLkvxXWG8DNH4qin
 EZrZyQZPysU7ItlX1AJ6+Sizya5FkhLKL4TikXOYUMFANVyk7XDzRjK3YMLznWDCpUJAvKKHA
 P2WNVrliuX2pRkO4eJoShtmeIwOXSJlVUxHP/Bcyz19scimfvf83MqEN/FTUvgHR1q7jXVLqu
 e3ljia4Ygq+QRRe+V2weXgXpFIF7HrLkKidykCOXybXq2Vg6jsDrdoqLE/ZoSz/pj2/L7QfCK
 IaEiEit0Ar+U6NHal9OKnZaPrZ8WZREYNZjbyVXPfIk4AYKihnJyQY8CkDApd6OOQ0x8M6CEL
 OgBjGLP0WXM2c9CjzZAycnbgBTZJXVmdjJfdqIopvEDQh/Ae5Xm53Vsz8l8q0Ms/0k59PHx6g
 b3nHbe0EbKixyfyKdsKeUoAqRy4=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 29 Oct 2022 at 18:52, Pavel Machek <pavel@ucw.cz> wrote:
> > On the device Logitech Litra Glow it is possible to set not only the
> > brightness but also the color temperature (both via usb as well as via
> > hardware).
> > I am currently trying to add support for the device - and expose it
> > via LED - into the kernel.
> > So to support all device capabilities I am proposing to extend LEDs by
> > color temperature:
> > And initial patch for the headers:
>
> Internally, the litra glow is something like RGB LED, right? Can we
> support it as a multicolor LED?
The litra glow has 2 control dimensions - brightness and color temperature.
Both dimensions can be controlled in something of a continuous range
(not sure whether these are strictly linear or not).
Thus mapping to RGB would look like more of a very sparse array.
Also, not sure which exact RGB value you would map a color temperature
to anyway.
So at first glance supporting it as a multicolor LED does not seem a
good match to me.
