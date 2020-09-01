Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5279E258668
	for <lists+linux-leds@lfdr.de>; Tue,  1 Sep 2020 05:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIADmv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 31 Aug 2020 23:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgIADmv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 31 Aug 2020 23:42:51 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0693C0612FE;
        Mon, 31 Aug 2020 20:42:50 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id q6so2668514ild.12;
        Mon, 31 Aug 2020 20:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yC+DH8F9S1noAz2kEtZOwWN5TObh7PkAv1zYBcxxwps=;
        b=t1D6JI7beEGd68zuDhYxtqcNutXRrlXIqf5K3TyohjpULva3QujiVHfNE8TbbX2IKN
         bOuaz55uCGQN6PQGZk2w9hWayXKyyL3X5ymDezSx6u3KXGnv1xzADtto0/i7uX25TyTF
         5Qhr8vng+zqwMhq2MO16LDolITQHuFK2tJRL2o16Jv3y79CQY4ZQJydOJOtJQoyv0sW3
         AOM8Y6G3zNJqgpt17R7CVCEBtZJiDaYToIk7s7xQkE0MNos7b1vUVkJCezp36ADiFuiW
         YCVyoQRqFan+RLMVsZVpxYQFmO4JfzMEaJMaCAFk2/hWTc8ahQuU99Vz2rQWwtQcihnb
         Sfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yC+DH8F9S1noAz2kEtZOwWN5TObh7PkAv1zYBcxxwps=;
        b=F3rVIWZMuQNKVP1/U/zRqGKvSHxosu/8qLjovyiKuFaGg7fj1dPUIl85k9CCxLpCEh
         OIr+g23QNCXBpEF65FFlK/0CCJY9x8qN07HMrKCMSmz/wRHHCg3pUVd9y6qKLH44XCwQ
         czuLT/48SDf99XAWKKa4bvHYHVO+3dnMa1bv6EqkJpaIDSS4C2j18zpVmub1yd5AUjlz
         Gsv9DLyIlQVJYv88YhHYEkX3VXU5ibeqO9sdJm6xcDuUa/2lttE+3kE6Kcr6SW+cnVQA
         dp8MO8S1ohTB4sVHIix/E8RTG/t4JSs+Xv0u+ozHmPD3jtoPMqKN0bn3SllqWe0aeWJ7
         xw6w==
X-Gm-Message-State: AOAM530p+UsECmme2AsGZ+TOU6u39qhvb0HvgBfoICFTF7xdR/gz0ibF
        6HNO2YiXlb4qkcGANKd8kLcz6+gw1BQWQgdVgrMtCTl6IBo=
X-Google-Smtp-Source: ABdhPJzGnO6lLr7vGuK0BxTdFGzUKAQhk59XmWw6DxwYqiLR1hIz6LPOTbQpHMykz9ksV3rJNVz8mDaK8sZiNFdBQJw=
X-Received: by 2002:a92:6902:: with SMTP id e2mr3871563ilc.127.1598931769747;
 Mon, 31 Aug 2020 20:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598441840-15226-3-git-send-email-gene.chen.richtek@gmail.com> <06b19a38-6850-01b1-7a43-b61aec4079b8@ti.com>
In-Reply-To: <06b19a38-6850-01b1-7a43-b61aec4079b8@ti.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Tue, 1 Sep 2020 11:42:38 +0800
Message-ID: <CAE+NS35UiKHP62gSskmX0A3YM+GDq-snq6j52iO32qnN+mT8ag@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add bindings for MT6360 LED
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan Murphy <dmurphy@ti.com> =E6=96=BC 2020=E5=B9=B48=E6=9C=8826=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:54=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Gene
>
> On 8/26/20 6:37 AM, Gene Chen wrote:
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add bindings document for LED support on MT6360 PMIC
>
> Usually bindings are 1/x in the patchset.
>

ACK

> And you should cc Rob Herring and the Device tree mail list other wise
> the maintainer will not apply this patch without their ACKs
>
>

ACK

> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > ---
> >   .../devicetree/bindings/leds/leds-mt6360.yaml      | 50 +++++++++++++=
+++++++++
> >   1 file changed, 50 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/=
Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> > new file mode 100644
> > index 0000000..4598be5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LED driver for MT6360 PMIC from MediaTek Integrated.
> > +
> > +maintainers:
> > +  - Gene Chen <gene_chen@richtek.com>
> > +
> > +description: |
> > +  This module is part of the MT6360 MFD device. For more details
> > +  see Documentation/devicetree/bindings/mfd/mt6360.yaml.
>
> I think you need to include this yaml using allof tag
>
>

I try add allOf tag
allOf:
 - $ref: "../mfd/mt6360.yaml"

then the required property contains mt6360.yaml, which leads to build dt er=
ror.
/media/gene_chen/WD/upstream/linux/Documentation/devicetree/bindings/leds/l=
eds-mt6360.example.dt.yaml:
led-controller: 'reg' is a required property
/media/gene_chen/WD/upstream/linux/Documentation/devicetree/bindings/leds/l=
eds-mt6360.example.dt.yaml:
led-controller: 'interrupt-controller' is a required property
/media/gene_chen/WD/upstream/linux/Documentation/devicetree/bindings/leds/l=
eds-mt6360.example.dt.yaml:
led-controller: '#interrupt-cells' is a required property
/media/gene_chen/WD/upstream/linux/Documentation/devicetree/bindings/leds/l=
eds-mt6360.example.dt.yaml:
led-controller: compatible:0: 'mediatek,mt6360' was expected

I think I can remove this description for misread.

> > +
> > +  The LED controller is represented as a sub-node of the PMIC node on
> > +  the device tree.
> > +
> > +  This device has six current sinks.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6360-led
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^led@[0-5]$":
> > +    type: object
> > +    description: |
> > +      Properties for a single LED.
> > +
> > +    properties:
> > +      reg:
> > +        description:
> > +          Index of the LED.
> > +        minimum: 0
> > +        maximum: 5
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +additionalProperties: false
> > +
> Need a new line
>
>
> And an example
>
> > +...
