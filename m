Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7616BE216
	for <lists+linux-leds@lfdr.de>; Fri, 17 Mar 2023 08:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjCQHsc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Mar 2023 03:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjCQHsb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Mar 2023 03:48:31 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DC450F8B
        for <linux-leds@vger.kernel.org>; Fri, 17 Mar 2023 00:48:29 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id o12so16960410edb.9
        for <linux-leds@vger.kernel.org>; Fri, 17 Mar 2023 00:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1679039308;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slJ2wsHLGP1PBegXyWv3eYwVNvaF7as8Oq5wJavqPYo=;
        b=SYzCg9Uh7ekIuqu83C/Z+Qy+/HT7Riipl+ChOEHLI4bYtB9Or0OTK3RJfzWL5EFy1w
         R6J23cdCVHZkzDIlVGKRo9W04SJ8upjSGqdjXEJNpJ97SW1whTx17DY+/4KqKI+kgXpP
         85Z/ziRKznpUoj9aPQGYuN6GCL69Tjb1mZ2tKNnRlXGY3231TIxcYgu1UcmVviigHien
         qwnqI/7bSdCH1z1lx75uVMFxsCBPeqwcZJo+BZA6xozMBmuO3v8kCBT12GTDnrO48HER
         B9vtPntF6YLfOvQxNcnvgPx42F2O2kOPAbakKEKUIv/45dgFrhNrIaIYyVGFH60Qoak8
         NgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679039308;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=slJ2wsHLGP1PBegXyWv3eYwVNvaF7as8Oq5wJavqPYo=;
        b=lf7HPNJZUhGnM4+2JHtf3d0VH3nMSW/aMhFnDJFCpf0DnjtJWUfOOvUKouOVAKvYxZ
         IiNzj+tcM9p3eqE6q4kwJtra1zfqbXMMxMDb5iKa2lfa4qgVqL8frmNlQvmGVGNsVtg4
         /0iPwOSghKTJB1ygROJIExZy5JQCQ0Ok2RSRtx+Th0LjyRV9/EvDFiTp5XyLgcTC03qb
         0UQHP09pEzTHVMQfv0BEP3t08r1XJ4nQ7/x+bEkhYychqSPhS252kGkg3QKsXnh/JEGJ
         FiqTkaQxeKSJOgxhxxsJBd4MRt65ttxI60p8DMWAeigUvJfymoAnRJv9kmxNZ/+29f5s
         A/Dw==
X-Gm-Message-State: AO0yUKWMfTPI+DMO6f2KRKZWTzm9kEcrvYIgWolcOFz+Yy4VI+ImT7NK
        9bQVpC0UzhpC/vtSv33BPbo2HQ==
X-Google-Smtp-Source: AK7set/lFlqZMEAIUYDMVwPq1Dse/6JJwL8mfyBcITQR4YxRT4waGIABSQwcYCfOv9FIfhp/zOfDqA==
X-Received: by 2002:a17:906:7d52:b0:92e:e9c2:7b9e with SMTP id l18-20020a1709067d5200b0092ee9c27b9emr7099904ejp.41.1679039307797;
        Fri, 17 Mar 2023 00:48:27 -0700 (PDT)
Received: from localhost (2a02-8388-6582-fe80-0000-0000-0000-000b.cable.dynamic.v6.surfer.at. [2a02:8388:6582:fe80::b])
        by smtp.gmail.com with ESMTPSA id b19-20020a170906195300b008f702684c51sm636659eje.161.2023.03.17.00.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 00:48:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 17 Mar 2023 08:48:26 +0100
Message-Id: <CR8HRCV5O57W.1N5QHY5VNKQD6@otso>
Cc:     "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Pavel Machek" <pavel@ucw.cz>, "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Fenglin Wu" <quic_fenglinw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: leds: spmi-flash-led: Add pm6150l
 compatible
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Lee Jones" <lee@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: aerc 0.14.0
References: <20221209-fp4-pm6150l-flash-v1-0-531521eb2a72@fairphone.com>
 <20221209-fp4-pm6150l-flash-v1-1-531521eb2a72@fairphone.com>
 <Y6WiQKRI/YCbMBhA@google.com>
 <e1fb7474-d029-8004-709d-1d0b437f192d@linaro.org>
 <Y7QdAqZNpVFDbmlG@google.com>
In-Reply-To: <Y7QdAqZNpVFDbmlG@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue Jan 3, 2023 at 1:18 PM CET, Lee Jones wrote:
> On Sat, 24 Dec 2022, Krzysztof Kozlowski wrote:
>
> > On 23/12/2022 13:42, Lee Jones wrote:
> > > On Fri, 09 Dec 2022, Luca Weiss wrote:
> > >=20
> > >> Add the compatible for the flash-led block found on pm6150l PMIC.
> > >>
> > >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > >> ---
> > >>  Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1=
 +
> > >>  1 file changed, 1 insertion(+)
> > >=20
> > > Who takes LED DT Bindings presently?
> >=20
> > Preferably Pavel and/or you. Rob was taking only on exceptional cases.
>
> Works for me.  That's the case from now on then, thank you.

Hi Lee,

could you please pick up this patch now since the main schema has been
applied?
The remaining patches (dts & dtsi) from this series have been applied
already.

Regards
Luca

>
> --=20
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

