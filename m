Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6D0E1EB1
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2019 16:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732328AbfJWO4R (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Oct 2019 10:56:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:52928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405356AbfJWO4R (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 23 Oct 2019 10:56:17 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C483021920;
        Wed, 23 Oct 2019 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571842575;
        bh=O2JkHUKjlciDA80wKo06uckw4Sa9xy92fBX8r3Vt/Pw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b/h5uvCEXDJoWAACpB7mlIdd5VKCHuJHc8W+0BnYV8LN46IrcKvYaA47zQASHSSrg
         rRC/qfbq+tfJD3Ug2mc4rrVOJYLkHlCPeVIC4IVeLQgexmMPKwGwgqcY9BkkZUCuMC
         oj6CoCV/MiW39mvwpDHRya2tOuIu6I2cvdOtkI2Y=
Received: by mail-qt1-f175.google.com with SMTP id d17so18098007qto.3;
        Wed, 23 Oct 2019 07:56:15 -0700 (PDT)
X-Gm-Message-State: APjAAAUp2Zhgbvo51TxcRLyQDcWsNPftlOkpBH0g8BRfUOpHglEN9fo0
        /OVKTDmZHGJtNAurp6Rx0z4ip2qskakLiDVGBA==
X-Google-Smtp-Source: APXvYqzVZzf6EZ9mYlLTYZ3eAw6y9++ux0xd/vX/zGDjRONjf8x1gNwbYI3NzJBCFQSBukbt9b/ycsUtWjs8uGertvA=
X-Received: by 2002:ac8:741a:: with SMTP id p26mr9624872qtq.143.1571842574962;
 Wed, 23 Oct 2019 07:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <1571756812-19005-1-git-send-email-akinobu.mita@gmail.com> <1571756812-19005-3-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1571756812-19005-3-git-send-email-akinobu.mita@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 23 Oct 2019 09:56:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ3+Ys5_JD0qnf7acS5wXUpAyU=Wdbfigud4p6fT1f9eg@mail.gmail.com>
Message-ID: <CAL_JsqJ3+Ys5_JD0qnf7acS5wXUpAyU=Wdbfigud4p6fT1f9eg@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: meter: add leds-meter binding
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 22, 2019 at 10:07 AM Akinobu Mita <akinobu.mita@gmail.com> wrote:
>
> Add DT binding for leds-meter.

What's an leds meter? Need a better explanation to understand if this
makes sense at all, but some comments on the schema below.

> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Bjorn Andersson <bjorn@kryo.se>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  .../devicetree/bindings/leds/leds-meter.yaml       | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-meter.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-meter.yaml b/Documentation/devicetree/bindings/leds/leds-meter.yaml
> new file mode 100644
> index 0000000..d5dfa261
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-meter.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: GPL-2.0

(GPL-2.0-only OR BSD-2-Clause) for new bindings.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-meter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic LED level meter
> +
> +maintainers:
> +  - Akinobu Mita <akinobu.mita@gmail.com>
> +
> +description:
> +  Generic LED level meter consists of multiple LED devices by different drivers.
> +
> +properties:
> +  compatible:
> +    const: meter-leds
> +
> +  leds:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1

No need for this as the minimum for arrays is already 1. And it
doesn't work either. You'd need the $ref under an 'allOf'.

> +    description: List of phandles to LED node that are members of a level meter.
> +
> +  brightness-weights:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    description: Each integer represents a contribution ratio within a level
> +      meter.
> +
> +required:
> + - compatible
> + - leds

Add a:

additionalProperties: false

> +
> +examples:
> +  - |
> +    leds {

Needs to be a name that's not also a property name. 'leds-meter' or
'meter-leds' perhaps. And define the name above under a $nodename
property.

> +        compatible = "meter-leds";
> +        leds = <&led0>, <&led1>, <&led2>, <&led3>;
> +        brightness-weights = <3 1 1 1>;
> +    };
> +
> +...
> --
> 2.7.4
>
