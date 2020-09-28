Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C06827AC90
	for <lists+linux-leds@lfdr.de>; Mon, 28 Sep 2020 13:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgI1LTn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Sep 2020 07:19:43 -0400
Received: from mail.thorsis.com ([92.198.35.195]:59259 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgI1LTl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 28 Sep 2020 07:19:41 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id B84BF356D;
        Mon, 28 Sep 2020 13:19:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PMrYHnMuNPFU; Mon, 28 Sep 2020 13:19:38 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 32D89F0D; Mon, 28 Sep 2020 13:19:37 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Alexander Dahl <post@lespocky.de>,
        Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: leds: Convert pwm to yaml
Date:   Mon, 28 Sep 2020 13:19:30 +0200
Message-ID: <25430034.0KxgpkDxtS@ada>
In-Reply-To: <20200922154258.GA2731185@bogus>
References: <20200919053145.7564-1-post@lespocky.de> <20200919053145.7564-4-post@lespocky.de> <20200922154258.GA2731185@bogus>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Rob,

Am Dienstag, 22. September 2020, 17:42:58 CEST schrieb Rob Herring:
> On Sat, 19 Sep 2020 07:31:45 +0200, Alexander Dahl wrote:
> > The example was adapted slightly to make use of the 'function' and
> > 'color' properties.  License discussed with the original author.
> >=20
> > Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > ---
> >=20
> > Notes:
> >     v4 -> v5:
> >       * updated based on feedback by Rob Herring
> >       * removed Acked-by
> >    =20
> >     v3 -> v4:
> >       * added Cc to original author of the binding
> >    =20
> >     v2 -> v3:
> >       * changed license identifier to recommended one
> >       * added Acked-by
> >    =20
> >     v2:
> >       * added this patch to series (Suggested-by: Jacek Anaszewski)
> > =20
> >  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
> >  .../devicetree/bindings/leds/leds-pwm.yaml    | 82 +++++++++++++++++++
> >  2 files changed, 82 insertions(+), 50 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/=
iqs
> 62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes:
> '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+' From schema:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds=
/l
> eds-pwm.yaml

I somehow expected errors on those checks, because I got actually two=20
different recommendations from you:

In feedback on v4 of this patch (series) you recommended '^led(-[0-9a-f]+)?=
$'=20
for the (pwm) led node name, which I used in v5.  Or just allow any node na=
me=20
with ".*" like in gpio-keys.yaml =E2=80=A6

I just checked all in-tree dts files using "pwm-leds" and each also defines=
=20
the "label" property, so renaming those nodes should not alter the paths in=
=20
sysfs, if I understood everything correctly.  So I see two options now:

1) Go with the stricter check and fix all failing dts files and examples.

2) Just use the very loose check.

If 1), which patch would go first, renaming nodes in dts and examples or=20
converting bindings to yaml enabling the stricter check?

> Please check and re-submit.

Will do, maybe I split the patch series and send both remaining patches=20
separately?

Alex



