Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA6D380C22
	for <lists+linux-leds@lfdr.de>; Fri, 14 May 2021 16:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhENOqv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 May 2021 10:46:51 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:33176 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231473AbhENOqv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 14 May 2021 10:46:51 -0400
Received: from vokac-latitude.ysoft.local (unknown [10.0.28.99])
        by uho.ysoft.cz (Postfix) with ESMTP id 6B570A097F;
        Fri, 14 May 2021 16:45:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1621003537;
        bh=7jN/7xr1/TMXqC50FnK2epExUM+7aIneSmkFsdDWCec=;
        h=From:To:Cc:Subject:Date:From;
        b=H4QW954ZFk5ecibfXruPNSiuBsXFNCaAC3MS55oRdWnQ5Vn964D4MRUBsKMmKg7j1
         00wf5iZE3IiDwBtnJZxE7MvOfpQ/6M0k+KhqU7i3aH8IU+ztFRJgcOuOm1eeeLNUXL
         iaJrpvdrqGkDkLcuWWVUPmGSB2XBGGmVKsBLr+O0=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [RFC 0/2] Regression in lp55xx driver since multicolor framework was added? 
Date:   Fri, 14 May 2021 16:44:35 +0200
Message-Id: <1621003477-11250-1-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

Linux v5.9 and newer fails on our platform that uses the lp5562 LED
controller with the following error:

lp5562: probe of 1-0030 failed with error -22

The problem exists since introduction of the multicolor framework to
the lp55xx driver. It is caused by the lp55xx_parse_logical_led function
here [1]. Even if the LED multicolor framework is not enabled the color
property is required. But it did not used to be.

There are at least two other in-tree platforms that use the same
controller and could suffer from this problem.

I wonder what is a proper fix here. Either fix the driver to not
require the color property (do not know ho to do so) or update the binding
and DTs to reflect the real state of the driver (in this series).

Thank you in advance for any comments,
Michal

[1] https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/leds/leds-lp55xx-common.c#L639

Michal Vokáč (2):
  dt-bindings: leds: Add color as a required property for lp55xx
    controller
  ARM: dts: imx6dl-yapp4: Fix lp5562 driver probe

 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml | 10 ++++++++++
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi              | 11 ++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.7.4

