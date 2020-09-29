Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A578127D038
	for <lists+linux-leds@lfdr.de>; Tue, 29 Sep 2020 15:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730496AbgI2N6i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Sep 2020 09:58:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:44118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731265AbgI2N61 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 29 Sep 2020 09:58:27 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66FA621D46;
        Tue, 29 Sep 2020 13:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601387905;
        bh=ZfFWzKaQTELYwaowWT+nxgqvHBHuAqvdqFBwu7lGebo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pERYnnpsZdy4ZJOch3jWlcvjcjATbfaENV5K7hqDnNfNKcWhHAQNm5URh2u1B8M97
         Sc5FrDvMmoMg/0L8ugpuPoyzHexmjLs8wFSiEACRz3znoWb1eodNokj/oDov/m/6uO
         0wNxTbriN9AiDGVgPxwnmWQOeZ96YvrSYqDLyBEM=
Received: by mail-oi1-f171.google.com with SMTP id v20so5564424oiv.3;
        Tue, 29 Sep 2020 06:58:25 -0700 (PDT)
X-Gm-Message-State: AOAM533MVfbIlyPJdGRl5ZgZYLaRvYYie+ekutKrAHwN3VD+IJn0thfL
        Pj8ZUqYxEvvb10klv0wx99Av6v4Bc7pJVYTphQ==
X-Google-Smtp-Source: ABdhPJwuGaBuY6f+C76GL/T4SITu8Nm2VKpq9AJlmXHIZPrDsTNctbUNKJdam5OQHIF/5Vdeq0/IoQdwQb/41j5Njm4=
X-Received: by 2002:a05:6808:10e:: with SMTP id b14mr2740132oie.152.1601387904518;
 Tue, 29 Sep 2020 06:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200919053145.7564-1-post@lespocky.de> <20200919053145.7564-4-post@lespocky.de>
 <20200922155747.GA2734659@bogus> <23920329.U7EUVLB22C@ada>
In-Reply-To: <23920329.U7EUVLB22C@ada>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 29 Sep 2020 08:58:13 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKYWC82OB9OVtwsBnKHpfDfRYATdYfGXc0hiQ2kAgoKJg@mail.gmail.com>
Message-ID: <CAL_JsqKYWC82OB9OVtwsBnKHpfDfRYATdYfGXc0hiQ2kAgoKJg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: leds: Convert pwm to yaml
To:     Alexander Dahl <ada@thorsis.com>
Cc:     Alexander Dahl <post@lespocky.de>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 29, 2020 at 2:39 AM Alexander Dahl <ada@thorsis.com> wrote:
>
> Hei hei,
>
> Am Dienstag, 22. September 2020, 17:57:47 CEST schrieb Rob Herring:
> > Use generic node names:
> >
> > led-controller {
> >
> > > +        compatible =3D "pwm-leds";
> > > +
> > > +        led-1 {
> > > +            label =3D "omap4::keypad";
> > > +            pwms =3D <&twl_pwm 0 7812500>;
> > > +            max-brightness =3D <127>;
> > > +        };
> > > +
> > > +        led-2 {
> > > +            color =3D <LED_COLOR_ID_GREEN>;
> > > +            function =3D LED_FUNCTION_CHARGING;
> > > +            pwms =3D <&twl_pwmled 0 7812500>;
> > > +            max-brightness =3D <255>;
> > > +        };
> > > +    };
> > > +
> > > +...
>
> This is clear for the "one led-controller" case.  However, when trying to=
 fix
> those node names in existing .dts files, I wondered how those should be n=
amed
> for multiple, different led-controllers, e.g. one using "pwm-leds" and an=
other
> one using "gpio-leds"?
>
> See arch/arm/boot/dts/at91-kizbox3-hs.dts for example, the nodes are call=
ed
> "pwm_leds" and "leds" currently.  If both were part of a .dtsi and both n=
amed
> the same, you could not overwrite/complement those in a .dts file includi=
ng
> that .dtsi due to a name conflict.
>
> Just append a numerical index like this?
>
>   led-controller-1 {
>     =E2=80=A6
>   };
>
>   led-controller-2 {
>     =E2=80=A6
>   };

Yes, that's generally what we've been doing.

Rob
