Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C7D671759
	for <lists+linux-leds@lfdr.de>; Wed, 18 Jan 2023 10:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjARJUv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Jan 2023 04:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjARJUO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Jan 2023 04:20:14 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9243838030
        for <linux-leds@vger.kernel.org>; Wed, 18 Jan 2023 00:37:20 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id e202so13889212ybh.11
        for <linux-leds@vger.kernel.org>; Wed, 18 Jan 2023 00:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25UwbnVsrXF2XOi/rzL1DlQwNobgAwu6Gm3xehAhpEg=;
        b=7STNftU56FeuGXCbKpxA8SkAyftYHoh2ddBxJLrGdwEMF2wSLs4242bL3ea7idm5Y4
         ZVQ/xvgum+hHgSjspxs86GNktGzef1nXS6Mo89JmiQa5yugKc3EeVHltuwxL+WF/pNdS
         +K37nonpOv3TdxAAYtLuBz9afr/v5GEmecEAozwXbxje8N+rYtBYhjqK1SY1832d17C5
         RSydKm1Znlri1UHuFga/UcmMn1Y2pX9kmXQ4HVHhy9Hmn9TBDGz8yjVny/4VHzBOW7pc
         rO9LAg34p8wTL1M9PSKiR0CRlB1B2GuzGZUvri8SOBxJz08Zt8e4Jc5lcosU1Oc6lIme
         L7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25UwbnVsrXF2XOi/rzL1DlQwNobgAwu6Gm3xehAhpEg=;
        b=6SLoo5BP0s+Uz/APYByKvGoo3kop1UAIRdKLObVkACmm6mIt8sB9VLMlyVNCi4rLMF
         wPsRfCZbSsW+wh+Mo5O7wcaconay+fCrGaQgxQNzW5XUGDQYe6lANfniCRE9QckXQUC2
         dUmJdXw07iSe9vDCnXA3rpppfG4sJFfRSwV1jzAGQYNForkKjcpGRO8Gakk9wDMe2+Su
         A1MnLYWvl3h/g3qI90O56zajsXlsuLD1+ssM+RcstsOdPEFlhOcOcUNMQIk4zVTpWdTu
         UqTE+dmLLDwz4+yh26Nc+sF7+SO6oeibkzgkXT5ugtzfyp0+38xLYAu/WjMAe8YmhIyZ
         RPPQ==
X-Gm-Message-State: AFqh2kp1PyGFSU3XfMB1LRX4zqumEB+6W4M0jy7muBVJMm570Y4LQoJ0
        s/dkdMnVxqeBImJ6bcEiWC2o4h1mDpm+ZnOF9srKYQ==
X-Google-Smtp-Source: AMrXdXvkAjgZueXUsTbnjRyYgL573SkSrK6hKqOKoelBS/6ldk0KA9UsmaJzrb/I41AEghUW3nnSomU38BecAKrN5lo=
X-Received: by 2002:a5b:4d2:0:b0:707:473f:b763 with SMTP id
 u18-20020a5b04d2000000b00707473fb763mr812592ybp.158.1674031039739; Wed, 18
 Jan 2023 00:37:19 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
 <7hr0xe56uf.fsf@baylibre.com> <0fc0217e-f1dd-d64c-d43c-cd47a8acbfd4@gmail.com>
 <CAFGrd9qZzpxPWpiEOJacc9m2WDFB8Mgr5U5too89mZmqqFir_Q@mail.gmail.com>
In-Reply-To: <CAFGrd9qZzpxPWpiEOJacc9m2WDFB8Mgr5U5too89mZmqqFir_Q@mail.gmail.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Wed, 18 Jan 2023 09:37:08 +0100
Message-ID: <CAFGrd9q9aMZLH71HuyDfCxca65bdeSnkO4Oe+PTsYq=+qNAWjw@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add MediaTek MT6357 PMIC support
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Kevin Hilman <khilman@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Fabien Parent <fabien.parent@linaro.org>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-mediatek@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-rtc@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Fabien Parent <fparent@baylibre.com>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Matthias,

Gentle ping to merge the v8 rebased on top of v6.2-tmp/soc.
https://lore.kernel.org/r/20221005-mt6357-support-v8-0-560caaafee53@baylibr=
e.com

Thanks,
Alex

Le lun. 2 janv. 2023 =C3=A0 17:10, Alexandre Mergnat
<amergnat@baylibre.com> a =C3=A9crit :
>
> > >> This patch series adds MFD, PMIC keys, and regulator support for MT6=
357.
> > >> MT6357 is a MediaTek PMIC very similar to MT6358.
> > >
> > > The regulator driver (and bindings) were merged by Mark.  Could you t=
ake
> > > the rest of this series via your mediatek tree?  The input driver (an=
d
> > > bindings) are ack'd by Dmitry.
> > >
> >
> > Yes I can do that but 3/8 does not apply cleanly. Could you please reba=
se on top
> > of v6.2-tmp/soc?
>
> Hi Matthias,
>
> I've pushed the V8 rebased on top of v6.2-tmp/soc.
> https://lore.kernel.org/r/20221005-mt6357-support-v8-0-560caaafee53@bayli=
bre.com
>
> Thanks,
> Alex
