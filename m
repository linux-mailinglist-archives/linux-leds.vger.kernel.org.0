Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D915362C489
	for <lists+linux-leds@lfdr.de>; Wed, 16 Nov 2022 17:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238603AbiKPQfQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Nov 2022 11:35:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbiKPQe4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Nov 2022 11:34:56 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F0A68AE2
        for <linux-leds@vger.kernel.org>; Wed, 16 Nov 2022 08:26:39 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id s5so11130256edc.12
        for <linux-leds@vger.kernel.org>; Wed, 16 Nov 2022 08:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GcqxyNxQ2i04UVF1iE2MHRUWTa6OtN0e3MQ8qjNro8=;
        b=gqXs9ZRxNaAaMLsaERJlYwPG7r3b24XDY6OQOS3QsEXqGfhw9X43KJLNreM1IYIqub
         dB9lv/Zk0WN3SHi2xzGk7psL5/Xve6O5ukGpax0UM9QS/C6fKwUSKbS4Y6M67r6NjKBW
         FLC1c65yVmMR/AkRMoxpEZRWWBFKb+6QVYIAwA/kYTcg2gsgamaq7fgMACv/9AF4mkda
         J+6xOJpes4DCcqAheTEJJgJQ8KQJKg1pQ8tE80PNT5gvkJlBbe9ActINJEfnUepyRvHw
         nWZV73NRAvGO7al24DAUSqf6co6okGZYqcgs64bKZfAy7HPZZXYfaA23JVTEJp/vuh9W
         qpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GcqxyNxQ2i04UVF1iE2MHRUWTa6OtN0e3MQ8qjNro8=;
        b=7l97skhIxVocfBntWvu2xYhSKBQNyetO59W9pVXhuMpdMFovr5xmxj7OKX0oNDhyLK
         0w61u4J+vdSgpCd5X5BadejWewudK8i/ixsm/ZbMt6DqVyMwBoirY4Dy4zQumYkPg8Ii
         rBOt2N6vXcSrkax5rys4rmnbQJtsEBS1YPKQw6WlXDoibF5eV7Mx9YLULCMbwMWCuTPp
         7u2hJO0FH4tOiVKT9mxVYy4sWKytJACE2nDW5EwoszKYKN7PT2aIAInlexA1yPUoVvGv
         X5ODcUauxtqt7KMkrreaxQGC9os64ncpZ1jkTaCmRjbvp+EaWe9P7/ddPpnIFj/IEGaI
         sYjg==
X-Gm-Message-State: ANoB5plWmBm4pqY4d/JdNKzmaIUrLRSFXweDGWZ8Ms1Qxhu6f1w5W4kv
        XjERI2oQpNplKrxQokM7//Z6eBbrFWaQxolLaN1CeQ==
X-Google-Smtp-Source: AA0mqf5yB4S9XPGZ42v1UMyUILQ/PUGJvppH/sS1fbiyT79Tdf9o/FqO2PJG27Yz+Fnrnz8ST33S7OTxVys2IUPOPzU=
X-Received: by 2002:a50:fd9a:0:b0:461:b279:1175 with SMTP id
 o26-20020a50fd9a000000b00461b2791175mr19892498edt.124.1668615998007; Wed, 16
 Nov 2022 08:26:38 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-5-8210d955dd3d@baylibre.com> <166861435469.151514.16192567175686360100.robh@kernel.org>
In-Reply-To: <166861435469.151514.16192567175686360100.robh@kernel.org>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Wed, 16 Nov 2022 17:26:27 +0100
Message-ID: <CAFGrd9qz7w=aqiDjfdi_pM_y_1hiRoLs_AJVbptChs8=U66+aA@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: mfd: mediatek: Add bindings for
 MT6357 PMIC
To:     Rob Herring <robh@kernel.org>
Cc:     linux-input@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Lee Jones <lee@kernel.org>,
        Fabien Parent <fabien.parent@linaro.org>,
        linux-leds@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Flora Fu <flora.fu@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen Zhong <chen.zhong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Le mer. 16 nov. 2022 =C3=A0 17:03, Rob Herring <robh@kernel.org> a =C3=A9cr=
it :

> doc reference errors (make refcheckdocs):
> Warning: Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml refer=
ences a file that doesn't exist: Documentation/devicetree/bindings/soc/medi=
atek/mediatek,pwrap.yaml
> Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml: Documentation=
/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml

Ok, This should be fixed by swapping the order of the 2 following commits:
[PATCH v5 05/10] dt-bindings: mfd: mediatek: Add bindings for MT6357 PMIC
[PATCH v5 06/10] dt-bindings: soc: mediatek: convert pwrap documentation

Regards,
Alex
