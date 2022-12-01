Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D01863F45F
	for <lists+linux-leds@lfdr.de>; Thu,  1 Dec 2022 16:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiLAPnX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Dec 2022 10:43:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbiLAPnK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Dec 2022 10:43:10 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1256DA1C38
        for <linux-leds@vger.kernel.org>; Thu,  1 Dec 2022 07:43:09 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ml11so5135125ejb.6
        for <linux-leds@vger.kernel.org>; Thu, 01 Dec 2022 07:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14XZ2O4FVzL1QGTsdtTUFr9T59k2FsnxsuG+9VtNi+I=;
        b=YOSKLNbCT/4q5PjmWEt1oRxSc0fAHVkR9aCRojDmy6dX3JIfmuh09oI2+RqgLe5/jd
         rhksY1dFQr1NIf0y+S4W3Srw2WU7sHKiYYle1iNRxPBiBIzFXL82IukHMHMtY9muYje3
         xmUTZGxkap/l3tbGPVsjXSxV7D/2u9/HaWZ6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14XZ2O4FVzL1QGTsdtTUFr9T59k2FsnxsuG+9VtNi+I=;
        b=qLBW6Nxs63WkAL8MkQy+0RQAjIeqtwW9BKbWFGWKWee1lsyPw+BgVAcF4JJu05J98M
         A6By3mc/+78ZOy76FiBY4/4Fna4Gb/YYWsagevzEopJSuebFOC6ZgE1cbvSXx/QKB5nE
         ySF/ydjPYqNcZvdpe67R1H7NdWOllKgKzfACzZTppTWZL7a7F6dA7wmPfRBezNzjcMLW
         69Cp2GfSIotWszyIVtMGkJ7YzpXIU1h9NZ/X/yx/FcyPmrIanCnaLTC6a90r6UOa88O/
         j6Nnaly38vu91qUP9LY1hHEcAKwMgvQoGlhEXfoV+pU1Y+J1a/Yw7hNqnUkMUVDl9eTI
         NNFw==
X-Gm-Message-State: ANoB5pltw/xKtrDLuN5Td5oUxmOKEGYpkquy+gVisMeRpVfewejDGolR
        ZIYO0xGUkWa5j73t4aAKrJhq0PgSzcYWaRh3
X-Google-Smtp-Source: AA0mqf6k1I6L3+31iizGw641TFN5/U2YI7CJKdV+g7SEPS/dMg49Sf7VZfoy6Y7Vcs64xgfUiLEecg==
X-Received: by 2002:a17:906:5792:b0:7c0:9e1d:c83b with SMTP id k18-20020a170906579200b007c09e1dc83bmr7370599ejq.68.1669909387372;
        Thu, 01 Dec 2022 07:43:07 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id w19-20020a17090649d300b007c0a7286c0asm1444246ejv.58.2022.12.01.07.43.07
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 07:43:07 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id bs21so3332712wrb.4
        for <linux-leds@vger.kernel.org>; Thu, 01 Dec 2022 07:43:07 -0800 (PST)
X-Received: by 2002:a5d:4950:0:b0:242:1f80:6cd9 with SMTP id
 r16-20020a5d4950000000b002421f806cd9mr9556520wrs.405.1669909041754; Thu, 01
 Dec 2022 07:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de> <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Dec 2022 07:37:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJ-YygjS9ukN8+hYxebUneFd-8=UEX3ZvSVQso7CGgng@mail.gmail.com>
Message-ID: <CAD=FV=VJ-YygjS9ukN8+hYxebUneFd-8=UEX3ZvSVQso7CGgng@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an error code
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Pavel Machek <pavel@ucw.cz>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Michael Walle <michael@walle.cc>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Sean Anderson <sean.anderson@seco.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On Wed, Nov 30, 2022 at 7:22 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> .get_state() might fail in some cases. To make it possible that a driver
> signals such a failure change the prototype of .get_state() to return an
> error code.
>
> This patch was created using coccinelle and the following semantic patch:
>
> @p1@
> identifier getstatefunc;
> identifier driver;
> @@
>  struct pwm_ops driver =3D {
>         ...,
>         .get_state =3D getstatefunc
>         ,...
>  };
>
> @p2@
> identifier p1.getstatefunc;
> identifier chip, pwm, state;
> @@
> -void
> +int
>  getstatefunc(struct pwm_chip *chip, struct pwm_device *pwm, struct pwm_s=
tate *state)
>  {
>    ...
> -  return;
> +  return 0;
>    ...
>  }
>
> plus the actual change of the prototype in include/linux/pwm.h (plus some
> manual fixing of indentions and empty lines).
>
> So for now all drivers return success unconditionally. They are adapted
> in the following patches to make the changes easier reviewable.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-mvebu.c             |  9 ++++++---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
>  drivers/leds/rgb/leds-qcom-lpg.c      | 14 ++++++++------
>  drivers/pwm/pwm-atmel.c               |  6 ++++--
>  drivers/pwm/pwm-bcm-iproc.c           |  8 +++++---
>  drivers/pwm/pwm-crc.c                 | 10 ++++++----
>  drivers/pwm/pwm-cros-ec.c             |  8 +++++---
>  drivers/pwm/pwm-dwc.c                 |  6 ++++--
>  drivers/pwm/pwm-hibvt.c               |  6 ++++--
>  drivers/pwm/pwm-imx-tpm.c             |  8 +++++---
>  drivers/pwm/pwm-imx27.c               |  8 +++++---
>  drivers/pwm/pwm-intel-lgm.c           |  6 ++++--
>  drivers/pwm/pwm-iqs620a.c             |  6 ++++--
>  drivers/pwm/pwm-keembay.c             |  6 ++++--
>  drivers/pwm/pwm-lpss.c                |  6 ++++--
>  drivers/pwm/pwm-meson.c               |  8 +++++---
>  drivers/pwm/pwm-mtk-disp.c            | 12 +++++++-----
>  drivers/pwm/pwm-pca9685.c             |  8 +++++---
>  drivers/pwm/pwm-raspberrypi-poe.c     |  8 +++++---
>  drivers/pwm/pwm-rockchip.c            | 12 +++++++-----
>  drivers/pwm/pwm-sifive.c              |  6 ++++--
>  drivers/pwm/pwm-sl28cpld.c            |  8 +++++---
>  drivers/pwm/pwm-sprd.c                |  8 +++++---
>  drivers/pwm/pwm-stm32-lp.c            |  8 +++++---
>  drivers/pwm/pwm-sun4i.c               | 12 +++++++-----
>  drivers/pwm/pwm-sunplus.c             |  6 ++++--
>  drivers/pwm/pwm-visconti.c            |  6 ++++--
>  drivers/pwm/pwm-xilinx.c              |  8 +++++---
>  include/linux/pwm.h                   |  4 ++--
>  29 files changed, 146 insertions(+), 89 deletions(-)

For ti-sn65dsi86.c:

Acked-by: Douglas Anderson <dianders@chromium.org>
