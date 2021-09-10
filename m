Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515B2406CBA
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 15:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbhIJNNU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 09:13:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:52742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231266AbhIJNNT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 10 Sep 2021 09:13:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5663461074;
        Fri, 10 Sep 2021 13:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631279528;
        bh=xHga66dm4Y9qq0uRqhXsaAzyDsRHpSACVQyB1egW9K0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eJsE8Ta6uMCzj83BNAPi3TWJsU/ek87eyc1cyWmWRbEY6LSIylTILxeLBPcCh3VqM
         +UuMDdXOzL2lQa3ZO+22QXyIvPaBNRxbm5bJPOijU2PIlnw+VUUwwBk6Qq944OmjEt
         RxLXy/en9uHOqzUYaD2jNDahx9TyJep9QujaFP2GGBjlD9gAgAVV2LhCdNWEnasLZG
         uI2891BkzeNzXWtWsobyVrHnvL4wBnpSFLqWoM3EZBy8CtrltF35zKoWtE82xJZSl7
         6dcRlyMvMJZE9sfRGf2NFUywvBlJ731VryKu7qmG6o8My6JZQ8tLbZ1xLv9HzTGXXY
         qhT9n3wq0f8MQ==
Received: by mail-ej1-f44.google.com with SMTP id a25so4173451ejv.6;
        Fri, 10 Sep 2021 06:12:08 -0700 (PDT)
X-Gm-Message-State: AOAM53075Aojjeephn1s2w1j0GtYcE22Gg43TIcWRirB/poj0IGt0NjH
        SONdVDODKY6Z+zLolJxGxSLNE/tCzwEND1LHOA==
X-Google-Smtp-Source: ABdhPJwxGWq0xviAjQ1uqiQ6zFb2APY00BFbtVFZJIy9PKNY22PNbijurhvlFBUTtPgsvxhftkZqTIJ49BSdm3GEVUw=
X-Received: by 2002:a17:906:7217:: with SMTP id m23mr9323698ejk.466.1631279526962;
 Fri, 10 Sep 2021 06:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210909213118.1087083-1-robh@kernel.org> <20210909213118.1087083-5-robh@kernel.org>
In-Reply-To: <20210909213118.1087083-5-robh@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 10 Sep 2021 08:11:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJS2V959cbybBDHnj_X4OXiSeHocpknDN97u6r2y17PyA@mail.gmail.com>
Message-ID: <CAL_JsqJS2V959cbybBDHnj_X4OXiSeHocpknDN97u6r2y17PyA@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: clock: arm,syscon-icst: Use 'reg'
 instead of 'vco-offset' for VCO register address
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 9, 2021 at 4:31 PM Rob Herring <robh@kernel.org> wrote:
>
> 'reg' is the standard property for defining register banks/addresses. Add
> it to use for the VCO register address and deprecate 'vco-offset'. This
> will also allow for using standard node names with unit-addresses.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> index 118c5543e037..c346287ca15d 100644
> --- a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> +++ b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> @@ -69,6 +69,10 @@ properties:
>        - arm,impd1-vco1
>        - arm,impd1-vco2
>
> +  reg:
> +    maxItems: 1
> +    description: The VCO register
> +
>    clocks:
>      description: Parent clock for the ICST VCO
>      maxItems: 1
> @@ -83,6 +87,7 @@ properties:
>    vco-offset:
>      $ref: '/schemas/types.yaml#/definitions/uint32'
>      description: Offset to the VCO register for the oscillator
> +    deprecated

Sigh, that should be 'deprecated: true'.

Rob
