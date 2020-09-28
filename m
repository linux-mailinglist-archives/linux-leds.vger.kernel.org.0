Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B9E27B1AA
	for <lists+linux-leds@lfdr.de>; Mon, 28 Sep 2020 18:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgI1QSc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Sep 2020 12:18:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:43228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726461AbgI1QSc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 28 Sep 2020 12:18:32 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99B472100A;
        Mon, 28 Sep 2020 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601309911;
        bh=i7GYhiMn+37Sq008RrjJLJyTufrJOfeBNI1GsXR2zJ4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cDB1NvRv8ftd3jw3VSzwiLxClczdQcwc933hNUbKQKbuA0i7RwHVsMbYer8wGiJbE
         nz/GzmgM/H/9g5U/83J9veVyEydouto60UZQ4CKK5aQGn6DUirQliV80SBXbXbo0g9
         vluvwLxstfjt7ObGBbV8XUmpAp/iBjt0/9V8y8u4=
Received: by mail-oi1-f171.google.com with SMTP id 185so1907264oie.11;
        Mon, 28 Sep 2020 09:18:31 -0700 (PDT)
X-Gm-Message-State: AOAM532/RevpsmTox0vAdTf3OK7QIeo7MMtPc2Q7wC8HdoUbJp/lW9Uu
        yxcHNiaxZuQO3Yj3bHukTpZid5wHUwk/GoeouA==
X-Google-Smtp-Source: ABdhPJzRQdtyqEKP3Qh3o/zvZRAaQrco0KiM29T4UPOfYZCCdDGe409GlfC+XPFgpg5kaVPax12E7YcDlEyteuK52PQ=
X-Received: by 2002:aca:7543:: with SMTP id q64mr1393731oic.147.1601309910803;
 Mon, 28 Sep 2020 09:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200812193248.11325-1-dmurphy@ti.com>
In-Reply-To: <20200812193248.11325-1-dmurphy@ti.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 28 Sep 2020 11:18:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK1HDQOBRpiEVnHJ59RV+2XpcHfQaafvX1m2HfDs=kagg@mail.gmail.com>
Message-ID: <CAL_JsqK1HDQOBRpiEVnHJ59RV+2XpcHfQaafvX1m2HfDs=kagg@mail.gmail.com>
Subject: Re: [PATCH] dt: bindings: lp55xx: Updte yaml examples with new color ID
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Aug 12, 2020 at 2:32 PM Dan Murphy <dmurphy@ti.com> wrote:
>
> Update the binding examples for the color ID to LED_COLOR_ID_RGB
>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-lp55xx.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> index b1bb3feb0f4d..89f69d62493e 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> @@ -189,7 +189,7 @@ examples:
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x2>;
> -               color = <LED_COLOR_ID_MULTI>;
> +               color = <LED_COLOR_ID_RGB>;

Looks like common.yaml needs updating too:

Documentation/devicetree/bindings/leds/leds-lp55xx.example.dt.yaml:
led-controller@33: multi-led@2:color:0:0: 9 is greater than the
maximum of 8
From schema: /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml

Rob
