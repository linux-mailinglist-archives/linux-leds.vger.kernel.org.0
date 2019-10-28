Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53F4AE7CD2
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2019 00:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbfJ1X0K (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Oct 2019 19:26:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:41474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfJ1X0K (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 28 Oct 2019 19:26:10 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D497321835;
        Mon, 28 Oct 2019 23:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572305169;
        bh=q0OTmR1wgzTZD6EaP5k/W/AbGqmVSJjg13ZftmTiSZE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hezMheFbDN23JCAY51dksxmJGn0f0gJFzlQ8PYwJy4eQmyUpqFhnzr863IXmnm6ZY
         kcB9f8rfz07kpiqgLMVBNNbp+poxaJxOovMwaRP++vNhaK++Mkx/XqdgjR5SO05Klx
         iC8UVKO2J1iWAez6QSVAdSSs6K5+czLaTrL27/J4=
Received: by mail-qt1-f179.google.com with SMTP id x14so7020839qtq.3;
        Mon, 28 Oct 2019 16:26:08 -0700 (PDT)
X-Gm-Message-State: APjAAAXA12PoJAjIQharsHtY33lEuNdXU5kQnmcVaGF/9Rk2mAYevXvN
        bsEa+1uMlI61Yl2eoqp1wRj36gmF2P68X46kvA==
X-Google-Smtp-Source: APXvYqyIOnmWjP3GoLFvC7z60bp1fpcfLf2ubB7T6b3H6DBWuYxFoBuWQX2ZNarU+6b5ojoZdspaBlyJz9Lj0u5QWLs=
X-Received: by 2002:aed:2706:: with SMTP id n6mr523854qtd.224.1572305168028;
 Mon, 28 Oct 2019 16:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190912213257.24147-1-andreas@kemnade.info> <20190912213257.24147-2-andreas@kemnade.info>
In-Reply-To: <20190912213257.24147-2-andreas@kemnade.info>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 28 Oct 2019 18:25:56 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+zDYifFntHMqmqU4qmsj7_nafN+W7a0Vh+HdwGvVj5TA@mail.gmail.com>
Message-ID: <CAL_Jsq+zDYifFntHMqmqU4qmsj7_nafN+W7a0Vh+HdwGvVj5TA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 12, 2019 at 4:33 PM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> add enable-gpios to describe HWEN pin
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

This breaking linux-next now...

> ---
> changes in v2: added example
> changes in v3: added Acked-by
> changes in v4: moved enable-gpios to the right position
>   in the example
>  .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> index dc129d9a329e..c8470628fe02 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> @@ -29,6 +29,10 @@ properties:
>    '#size-cells':
>      const: 0
>
> +  enable-gpios:
> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -96,6 +100,7 @@ examples:
>          led-controller@38 {
>                  compatible = "ti,lm3630a";
>                  reg = <0x38>;
> +                enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;

Error: Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dts:24.46-47
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml]
Error 1
scripts/Makefile.lib:314: recipe for target
'Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.example.dt.yaml'
failed

You need the include for the define.

Rob
