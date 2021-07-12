Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813513C57C8
	for <lists+linux-leds@lfdr.de>; Mon, 12 Jul 2021 12:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352859AbhGLIhh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Jul 2021 04:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377710AbhGLIgT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Jul 2021 04:36:19 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF04C0613DD;
        Mon, 12 Jul 2021 01:33:31 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id w8-20020a0568304108b02904b3da3d49e5so14104994ott.1;
        Mon, 12 Jul 2021 01:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SZxKyapcP95t3Qouqp7FF9LfmDjUWdzEBklTYWphkD4=;
        b=AqgwP0m7QXx6dnrcT1SEtsn//U14Fy1BMa8c18UQ1dFsB/vG4uCfbpCHLWWrF6raoC
         9+J7iqg++LqULNo1+GsN7Vpyamy1CZNzrAO5W9pJGpKWzA54QIZxkyGX4I3I2tzqnsIl
         Ob5Ja4V5ILkmJIq6GFYHXMdDElBRZWYDPoZ549jwR2UA5+xd0VwBPiNx99Xm8+x+wrAB
         Ckgv/8Ka/WiqFOLS2eMIMb9uIxwHXp78WhtQe6Zetr/v1Hyea1M0M8bzDvuYxhU2N7X9
         6QD0laCm4smuNktELur4Ei1Df5YGLOnOnicGRiV7/1A7adPhAV6bdi+TvtvY4OnGSIFE
         5eYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SZxKyapcP95t3Qouqp7FF9LfmDjUWdzEBklTYWphkD4=;
        b=seqv+4jX3VXwlpy8up0jNcaSaJLxb9Qk3kh3y8rc/Gkx8i2jGGkTyzmN33jt/zxFp2
         FXTkTkd94eULcBTjSXSJl6RGdet1EeVpKfWu2ayjjf1npTKSXaj17/Q/qLbfptbi/QHC
         29WYIRhR90UD6MNKxyG+Q8chiTpsJyOgmdGW1MiOK2s1Jc7CNKs93ltU6wLQMYqkrXkn
         +S687WH+SPp0Up5ZwZUu/j+azUAAypZKhaA0o/M+Lk698+fFht+hmhbeH14T3jXdo6ig
         Yt1q2Hw/++5pYoN+CFC4OQJR7kUFHgU4RkFWs2XMV0cY9+/eGE7XErvIT+U+6G4Vau+W
         sIdw==
X-Gm-Message-State: AOAM5328Hx6SaPdhG/puU2B/X+MC370v3RNRmEkoI96Q3cJ6KNnXe0hK
        nA1Sor9HhsADe7TlwVryCiYl320VRH0101l4IkQ=
X-Google-Smtp-Source: ABdhPJyivpVPZ8cdSEoA3/WXmOk0cdeaWr9nSTp1nse+5dNXooOzccEZM5/E78bvn5OIBE8WXXCRvZClpvQy7pBbQH4=
X-Received: by 2002:a9d:7686:: with SMTP id j6mr39672095otl.232.1626078811219;
 Mon, 12 Jul 2021 01:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
In-Reply-To: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Mon, 12 Jul 2021 16:33:19 +0800
Message-ID: <CAE+NS37kf1JAJ2Zt7UGsfsubp6O=xBNtnJgVEnz8-mm2rxFa+g@mail.gmail.com>
Subject: Re: [PATCH v14 0/2] leds: mt6360: Add LED driver for MT6360
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, ChiYuan Huang <cy_huang@richtek.com>,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Gene Chen <gene.chen.richtek@gmail.com> =E6=96=BC 2021=E5=B9=B45=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:24=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> This patch series add MT6360 LED support contains driver and binding docu=
ment
>
> Gene Chen (2)
>  dt-bindings: leds: Add bindings for MT6360 LED
>  leds: mt6360: Add LED driver for MT6360
>
>  Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  159 ++
>  drivers/leds/flash/Kconfig                              |   13
>  drivers/leds/flash/Makefile                             |    1
>  drivers/leds/flash/leds-mt6360.c                        |  910 +++++++++=
+++++++
>  4 files changed, 1083 insertions(+)
>
> changelogs between v1 & v2
>  - add led driver with mfd
>
> changelogs between v2 & v3
>  - independent add led driver
>  - add dt-binding document
>  - refactor macros definition for easy to debug
>  - parse device tree by fwnode
>  - use devm*ext to register led class device
>
> changelogs between v3 & v4
>  - fix binding document description
>  - use GENMASK and add unit postfix to definition
>  - isink register led class device
>
> changelogs between v4 & v5
>  - change rgb isink to multicolor control
>  - add binding reference to mfd yaml
>
> changelogs between v5 & v6
>  - Use DT to decide RGB LED is multicolor device or indicator device only
>
> changelogs between v6 & v7
>  - Add binding multicolor device sample code
>  - Add flash ops mutex lock
>  - Remove V4L2 init with indicator device
>
> changelogs between v7 & v8
>  - Add mutex for led fault get ops
>  - Fix flash and multicolor no-ops return 0
>  - Add LED_FUNCTION_MOONLIGHT
>
> changelogs between v8 & v9
>  - reuse api in flash and multicolor header
>
> changelogs between v9 & v10
>  - add comment for reuse registration functions in flash and multicolor
>
> changelogs between v10 & v11
>  - match dt-binding reg property comment to the functionality name
>  - remove exist patch in linux-next
>  - dicide multicolor channel by color definitiion
>
> changelogs between v11 & v12
>  - Fix print size_t by %zu
>  - Fix dt-binding name regular experssion
>
> changelogs between v12 & v13
>  - Fix kbuild test rebot build error
>
> changelogs between v13 & v14
>  - Move driver to flash folder
>  - Remove LED FUNCTION MOONLIGHT
>  - Keep 80 char per line
>
>

Dear Reviewers,

Please let me know if any update.
