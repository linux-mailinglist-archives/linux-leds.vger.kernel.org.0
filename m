Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84EF0634C66
	for <lists+linux-leds@lfdr.de>; Wed, 23 Nov 2022 02:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235649AbiKWBLN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Nov 2022 20:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235516AbiKWBKd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Nov 2022 20:10:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFA0E1201;
        Tue, 22 Nov 2022 17:10:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C043061962;
        Wed, 23 Nov 2022 01:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD9EC433B5;
        Wed, 23 Nov 2022 01:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669165806;
        bh=rXOvu1e2etLRq3CMGISVIMIOQhLrgiLZaBMVOwuTAjI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Q62EsxGHVZLCsPw0ucsA71H9q1uzbpJejlgvneTDzf81PBaStl1j92/UjTYMFSJLf
         +1cnC1i+4xFCDi8K5rrd+XqrSqI4peARWRYD7qyCrN+bJY2hnpRFlQ2M0RS1NqMdrz
         mTRiCLqa327jxIv8zxqbxIUHsXQdUZ5S1iOaZwOed1GbaEB8rQmLmSeQJ0uxFfC13P
         KHIF6NukB4TNZOIGJeuwCQkY/wgbiPrFTNfqaQLk22QRK+OXaXR3qMP3LRmjKf5guk
         6wkvrMRVrBqjZ0H/3k9Dfd1J8jLSlm31F2PpODDHrBOqDwNnJv6gqu2l6/7uckY9z+
         mTfA5G2FcKVlw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221121110615.97962-6-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org> <20221121110615.97962-6-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/9] dt-bindings: drop redundant part of title (end, part two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org, netdev@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Date:   Tue, 22 Nov 2022 17:10:04 -0800
User-Agent: alot/0.10
Message-Id: <20221123011006.1BD9EC433B5@smtp.kernel.org>
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Quoting Krzysztof Kozlowski (2022-11-21 03:06:11)
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.
>=20
> Drop trailing "Node|Tree|Generic bindings" in various forms (also with
> trailling full stop):
>=20
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [nN]ode [bB]indings\?\.\?$/title: \=
1/' {} \;
>=20
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [tT]ree [bB]indings\?\.\?$/title: \=
1/' {} \;
>=20
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [gG]eneric [bB]indings\?\.\?$/title=
: \1/' {} \;
>=20
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [bB]indings\? description\.\?$/titl=
e: \1/' {} \;
>=20
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [bB]indings\? document\.\?$/title: =
\1/' {} \;
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  Documentation/devicetree/bindings/clock/ti,sci-clk.yaml         | 2 +-
>=20
> diff --git a/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml b/Do=
cumentation/devicetree/bindings/clock/ti,sci-clk.yaml
> index 0e370289a053..63d976341696 100644
> --- a/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/ti,sci-clk.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: TI-SCI clock controller node bindings
> +title: TI-SCI clock controller
> =20
>  maintainers:
>    - Nishanth Menon <nm@ti.com>

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk
