Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D06327B177
	for <lists+linux-leds@lfdr.de>; Mon, 28 Sep 2020 18:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgI1QLb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Sep 2020 12:11:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:53972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgI1QLb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 28 Sep 2020 12:11:31 -0400
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0F4A21548;
        Mon, 28 Sep 2020 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601309490;
        bh=y7Ht+HIoWAID9ib1LG69AukUP/qaBDCDCsuCUzh0IU0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TWhsInoh8l00v6MHThgJtc5oUVQQPeTFbPwsPJNSu9LegpqMFEUd9e8B35nccSF0D
         XhGT1iQfT2XZ7if8ms16F4tf3z7ifV1+3LnN0+W1DO8HX/O+G9DeAXvvzyhrXz9ahM
         kn78bNqB3avW25ICQj/9SFpB8lkQNnHI6GOL5yC8=
Received: by mail-oo1-f44.google.com with SMTP id 4so442728ooh.11;
        Mon, 28 Sep 2020 09:11:30 -0700 (PDT)
X-Gm-Message-State: AOAM531kM4nL9WD50JPCTJq9XlYM+zhdBzWad46fyjvxbGSM+Z+MRavL
        VjhZfVkfxnSLM2WAbPbhyLd3aKilrx6QfJJ/mg==
X-Google-Smtp-Source: ABdhPJxQ0XrJldHlAlasL8LskhnxKn4rvhzIbvnTwVOlPxEkFI7ABmwRRPVArMfumYTTnAZO3Bmo4AaXE338LE21RCU=
X-Received: by 2002:a4a:d306:: with SMTP id g6mr1359413oos.25.1601309489933;
 Mon, 28 Sep 2020 09:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200919053145.7564-1-post@lespocky.de> <20200919053145.7564-4-post@lespocky.de>
 <20200922154258.GA2731185@bogus> <25430034.0KxgpkDxtS@ada>
In-Reply-To: <25430034.0KxgpkDxtS@ada>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 28 Sep 2020 11:11:18 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+1ULfQAWGT5QN=Es9POXtO7-iu6ihZnZFoQ_bWKLFxCg@mail.gmail.com>
Message-ID: <CAL_Jsq+1ULfQAWGT5QN=Es9POXtO7-iu6ihZnZFoQ_bWKLFxCg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: leds: Convert pwm to yaml
To:     Alexander Dahl <ada@thorsis.com>
Cc:     Alexander Dahl <post@lespocky.de>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 28, 2020 at 6:19 AM Alexander Dahl <ada@thorsis.com> wrote:
>
> Hello Rob,
>
> Am Dienstag, 22. September 2020, 17:42:58 CEST schrieb Rob Herring:
> > On Sat, 19 Sep 2020 07:31:45 +0200, Alexander Dahl wrote:
> > > The example was adapted slightly to make use of the 'function' and
> > > 'color' properties.  License discussed with the original author.
> > >
> > > Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > > ---
> > >
> > > Notes:
> > >     v4 -> v5:
> > >       * updated based on feedback by Rob Herring
> > >       * removed Acked-by
> > >
> > >     v3 -> v4:
> > >       * added Cc to original author of the binding
> > >
> > >     v2 -> v3:
> > >       * changed license identifier to recommended one
> > >       * added Acked-by
> > >
> > >     v2:
> > >       * added this patch to series (Suggested-by: Jacek Anaszewski)
> > >
> > >  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
> > >  .../devicetree/bindings/leds/leds-pwm.yaml    | 82 +++++++++++++++++=
++
> > >  2 files changed, 82 insertions(+), 50 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.t=
xt
> > >  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.y=
aml
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mf=
d/iqs
> > 62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes=
:
> > '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+' From schema:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/le=
ds/l
> > eds-pwm.yaml
>
> I somehow expected errors on those checks, because I got actually two
> different recommendations from you:
>
> In feedback on v4 of this patch (series) you recommended '^led(-[0-9a-f]+=
)?$'
> for the (pwm) led node name, which I used in v5.  Or just allow any node =
name
> with ".*" like in gpio-keys.yaml =E2=80=A6
>
> I just checked all in-tree dts files using "pwm-leds" and each also defin=
es
> the "label" property, so renaming those nodes should not alter the paths =
in
> sysfs, if I understood everything correctly.  So I see two options now:
>
> 1) Go with the stricter check and fix all failing dts files and examples.
>
> 2) Just use the very loose check.

Either one is fine. Given label is present and there's not a ton of
cases, then I'd probably go with 1.

> If 1), which patch would go first, renaming nodes in dts and examples or
> converting bindings to yaml enabling the stricter check?

There's currently no requirement on dts files being warning free. So
the schema can come first and any dts fixes later.

Rob
