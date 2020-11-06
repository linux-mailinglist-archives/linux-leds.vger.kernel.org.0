Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112CB2A99F0
	for <lists+linux-leds@lfdr.de>; Fri,  6 Nov 2020 17:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKFQ6R (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Nov 2020 11:58:17 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:39210 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgKFQ6Q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Nov 2020 11:58:16 -0500
Date:   Fri, 06 Nov 2020 16:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1604681891;
        bh=Cxw7DayELvc3qFiSUFsEDeHz2abSz8ZKKvShcAZzGs4=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=V4ecOcfMwrzQwVVAadDcFFrVquVfAX0sNE4d9AXx0HTmHp07Oqs6LkIksFi/PCg+b
         3N3YwWdZenhBVBvceDB/vW3a1sQcnZK3rH7dAcd8SUOgzvVievVXdIBC8v+lr4ecxR
         GA64X6Cue7yH99ws87Hh7lMGTV3LQH9z7GN2NRLk=
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
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
        andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [RFC PATCH 0/3] Add support for the flash LED on Nexus 5
Message-ID: <20201106165737.1029106-1-nfraprado@protonmail.com>
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

this patch series adds support for the flash LED on Nexus 5.

The first patch adds the driver for the QPNP flash LED. The code for the dr=
iver
was ported from [1], which was for the 3.4 kernel. That driver originally
supported multiple LED types: WLED, Flash/Torch, RGB, MPP and KPDBL as desc=
ribed
in [2], but this port only contains support for Flash/Torch, and the code f=
or
the others was removed just because it was easier to test. Also, it was
originally an SPMI driver, but here I made it into a platform driver that
matches an SPMI device and uses regmap to read and write on the addresses.

The second patch adds the driver as a module in qcom's defconfig, which is =
the
one used by the Nexus 5.

The third patch adds the relevant nodes to Nexus 5's device tree. These nod=
es
were copied from [3] and [4], only changing the flash-boost-supply and
torch-boost-supply properties to point to the regulator nodes already defin=
ed
upstream at qcom-pm8941.dtsi. Again, I'm not sure if the nodes should be ke=
pt on
separate .dtsi as they were downstream, I just did what was easier for test=
ing.

The flash LED can be tested on a Nexus 5 with the following:

To turn the LED on:
echo 1 > /sys/class/leds/led\:flash_torch/brightness

To turn the LED on only for a couple seconds:
echo 1 > /sys/class/leds/led\:flash_0/brightness

From what I understand flash and torch correspond to the same LED, but flas=
h
only stays on for a couple seconds and uses a different voltage regulator.
I'm not sure why there are both flash_0 and flash_1. Both seem to do the sa=
me.

My questions are: Is there something fundamentally wrong with this patch se=
ries?
Is it okay to have the driver only support the flash LEDs from QPNP (at lea=
st
for the time being)?
But also please give me any other feedback.

Thanks,
N=C3=ADcolas

[1] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/drivers/leds/le=
ds-qpnp.c
[2] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/Documentation/d=
evicetree/bindings/leds/leds-qpnp.txt
[3] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/boot/d=
ts/msm-pm8941.dtsi
[4] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/boot/d=
ts/msm8974-leds.dtsi
My tree: https://gitlab.com/nfraprado/linux/

N=C3=ADcolas F. R. A. Prado (3):
  leds: Add driver for QPNP flash led
  ARM: qcom_defconfig: Add QPNP flash LED support
  ARM: dts: qcom: msm8974-hammerhead: Add support for the flash LED

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |   56 +
 arch/arm/configs/qcom_defconfig               |    1 +
 drivers/leds/Kconfig                          |    9 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-qpnp.c                      | 1351 +++++++++++++++++
 5 files changed, 1418 insertions(+)
 create mode 100644 drivers/leds/leds-qpnp.c

--=20
2.29.2


