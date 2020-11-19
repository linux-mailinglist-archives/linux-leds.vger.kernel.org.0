Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873442B89B1
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 02:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbgKSBmD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Nov 2020 20:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgKSBmC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2020 20:42:02 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48800C0613D4;
        Wed, 18 Nov 2020 17:42:01 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id v202so1417055oia.9;
        Wed, 18 Nov 2020 17:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HQMhIHZ3aTJpncUVkD+NpgyJTfrrQV9a2wnrUxBWV9s=;
        b=gUrWnpYDZ4A5KKTnCoPJSbWPJSyJy+F546b1TQlbdqzZBHg233kqSsKgr1MAXafS4O
         55IVWBFlXd6rf3VsECf9j8D44eCJusz9ebFtc5ZIlBdclyMR8E9G6Yiml+1vEnZjrnXr
         t8UY+sM8QdPG/9dQcLOzvZir0SsHsP7O5uDjCwJdCXbNGMmxPcQQueTeNg3p+gdesEE9
         bsPeiv5nW3JySuxTLMSo3nbEuLgVU5WkLueugE1hpM27U86Ykp8MifUApGIbfHDKVgDJ
         RrBlNHEypkcEDXCfTTSeHkFidGBRfGCfTgsR8blHT8awS1w9quvaiqJrJ8y3wFYD3Rin
         u+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HQMhIHZ3aTJpncUVkD+NpgyJTfrrQV9a2wnrUxBWV9s=;
        b=i32A4LLtdwXsy/vCa+IBFjtUk2GD50bogQWaiDsRioOOFRiyt+PnTP0xPmO0R/2n49
         O/vF3mp6i7JS61dUxe5/vAEuJLgVgZ4bGSX3tvQCoMur8PNtNC1LN6pJRyEEIkao9KYz
         naC7NYQ4D27Z6AaZWGkRjBYvM/d4nSxQlR95EJ2YNYwzM6ObPgDi8Lz6dedr9yiVbmQi
         +qNbwDteBu+g8guGnc5roAY9bwtBmvdCWlM98pIG7j6+q5DWuvKp6C8rm/QK3nKU0nfb
         qTEgtFyRq71DaamnN514eO2KxjgfhwkmBJvykwfnTpgxWQU1zjrgPfT6H3oqm+waVajE
         kVgg==
X-Gm-Message-State: AOAM5323T1hbq/jA7/QDzWaz0WT6eCX0AC5CS0cj3Cl5ZOovnsX1ADIT
        QjNvFaLDR+SdKhdopyOwV6KDlkqZ90GT1kDQsGH8StzmdZU=
X-Google-Smtp-Source: ABdhPJxzxoYxtimzxZnBxPsknERuKrnU1EzP84HpcWrI5a/64zVwJuhtc/ECCXaD5HbJcxwn1vS/comGOpipkLtbivs=
X-Received: by 2002:aca:ac96:: with SMTP id v144mr1311823oie.51.1605750120687;
 Wed, 18 Nov 2020 17:42:00 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-5-git-send-email-gene.chen.richtek@gmail.com> <20201118212502.GA1839537@bogus>
In-Reply-To: <20201118212502.GA1839537@bogus>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Thu, 19 Nov 2020 09:41:48 +0800
Message-ID: <CAE+NS34JXTtoHtapxLAHF35Ybxe=m41Sg4PEfQSpxzA1Hg091g@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] dt-bindings: leds: Add bindings for MT6360 LED
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
        Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Gene Chen <gene_chen@richtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>,
        Wilma.Wu@mediatek.com, benjamin.chao@mediatek.com,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        shufan_lee@richtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rob Herring <robh@kernel.org> =E6=96=BC 2020=E5=B9=B411=E6=9C=8819=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=885:25=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 18 Nov 2020 18:47:41 +0800, Gene Chen wrote:
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add bindings document for LED support on MT6360 PMIC
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > ---
> >  .../devicetree/bindings/leds/leds-mt6360.yaml      | 164 +++++++++++++=
++++++++
> >  1 file changed, 164 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.=
yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/leds/leds-mt6360.yaml:57:2: [warning]=
 wrong indentation: expected 2 but found 1 (indentation)
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds=
/leds-mt6360.example.dt.yaml: led-controller: led@3:color:0:0: 10 is greate=
r than the maximum of 9
>         From schema: /builds/robherring/linux-dt-review/Documentation/dev=
icetree/bindings/leds/leds-mt6360.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds=
/leds-mt6360.example.dt.yaml: led-controller: led@3:color:0:0: 10 is greate=
r than the maximum of 9
>         From schema: /builds/robherring/linux-dt-review/Documentation/dev=
icetree/bindings/leds/leds-mt6360.yaml
>
>

ACK, I will add description to this patch by
=E2=80=9Cthis patch depends on patch [PATCH v7 3/5] dt-bindings: leds: comm=
on:
Increase LED_COLOR_ID_* maximum size"

> See https://patchwork.ozlabs.org/patch/1402193
>
> The base for the patch is generally the last rc1. Any dependencies
> should be noted.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
