Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4449E303F9E
	for <lists+linux-leds@lfdr.de>; Tue, 26 Jan 2021 15:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405555AbhAZOEn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 Jan 2021 09:04:43 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:40738 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405698AbhAZOE2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 Jan 2021 09:04:28 -0500
Date:   Tue, 26 Jan 2021 14:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1611669821;
        bh=gQnuGXgHXwf08KWKFfxhg7QR+vbxSAEHzfJQokrIxus=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=DzSp4TE3Rrx3BRNzUxidjhhMU6UQnudt3fofH2ivlrlVD0+yWfX/NR+x/D/DV4otv
         3pKV4oJX7mH3n87CaNcYkXdBgvEPfOWtkZ9Ya8lSuHl3+junak7Ak4DJEgNCgsc6N4
         Ycop2mNEdyf6gbp9JZwvUUX+x5ftkHIQFOlbH3lY=
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [PATCH v2 0/4] Add support for QCOM SPMI Flash LEDs
Message-ID: <20210126140240.1517044-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

this patch series adds support for Qualcomm's SPMI Flash LEDs present in th=
e
PM8941 PMIC. It is used as part of MSM8974 based devices, like the Nexus 5
(hammerhead), as a camera flash or as a lantern when in torch mode.

Patch 1 adds the dt-bindings for the driver, together with a header for the
values of some properties.

Patch 2 adds the driver, which was ported from downstream [1], and is now u=
sing
the flash LED class framework.

Patch 3 enables the driver as a module in qcom_defconfig, and also enables
CONFIG_LEDS_CLASS_FLASH since it is required by the driver.

Patch 4 adds the device tree nodes configuring the driver in the pm8941 dts=
i.

After the feedback I received from the v1 RFC patch (thank you Jacek and
Bjorn!), I implemented the flash LED class framework, renamed the driver to
qcom-spmi-flash and added the dt-bindings. I also did a whole lot of cleanu=
p.

Some caveats:
- I still didn't implement get_strobe() and get_fault() for the flash LEDs,
  because I'm still not sure how to do it. get_strobe() in particular I'm n=
ot
  even sure if is possible, since after the flash turns off automatically a=
fter
  the timeout, I don't see any change in the SPMI registers. So I'm unsure =
how
  one would get the current strobe state.
- I have yet to add the V4L2 flash wrapper for the flash LEDs. I still didn=
't do
  it because I wasn't sure if it was needed, so wanted to double check. But
  being a camera flash it seems that would be useful. Also, it would be gre=
at if
  someone could point me how I would go about testing the flash usage throu=
gh
  V4L2.

Another thing worth mentioning: for v1 the dt nodes were added in hammerhea=
d's
dts (just to simplify testing), but I have now moved them to pm8941's dtsi,
since it was like that in downstream. So if folks using devices based on
PM8941/MSM8974 other than the Nexus 5 could test it, that would be great, s=
ince
I have only tested on the Nexus 5.

v1 RFC: https://lore.kernel.org/lkml/20201106165737.1029106-1-nfraprado@pro=
tonmail.com/

[1] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/drivers/leds/le=
ds-qpnp.c

N=C3=ADcolas F. R. A. Prado (4):
  dt-bindings: leds: Add binding for qcom-spmi-flash
  leds: Add driver for QCOM SPMI Flash LEDs
  ARM: qcom_defconfig: Enable QCOM SPMI Flash LEDs
  ARM: dts: qcom: pm8941: Add nodes for QCOM SPMI Flash LEDs

 .../bindings/leds/leds-qcom-spmi-flash.yaml   |   94 ++
 arch/arm/boot/dts/qcom-pm8941.dtsi            |   38 +
 arch/arm/configs/qcom_defconfig               |    2 +
 drivers/leds/Kconfig                          |    8 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-qcom-spmi-flash.c           | 1153 +++++++++++++++++
 .../dt-bindings/leds/leds-qcom-spmi-flash.h   |   15 +
 7 files changed, 1311 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-spmi-f=
lash.yaml
 create mode 100644 drivers/leds/leds-qcom-spmi-flash.c
 create mode 100644 include/dt-bindings/leds/leds-qcom-spmi-flash.h

--=20
2.30.0


