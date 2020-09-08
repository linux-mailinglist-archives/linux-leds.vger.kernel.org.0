Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D5226229E
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 00:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729753AbgIHWZv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Tue, 8 Sep 2020 18:25:51 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59638 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729622AbgIHWZs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Sep 2020 18:25:48 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CEECC1C0B87; Wed,  9 Sep 2020 00:25:45 +0200 (CEST)
Date:   Wed, 9 Sep 2020 00:25:44 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        matthias.bgg@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200908222544.GF1005@bug>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> From: Gene Chen <gene_chen@richtek.com>
> 
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> and 4-channel RGB LED support Register/Flash/Breath Mode
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  drivers/leds/Kconfig       |  11 +
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-mt6360.c | 681 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 693 insertions(+)
>  create mode 100644 drivers/leds/leds-mt6360.c
> 
> +	help
> +	  This option enables support for dual Flash LED drivers found on
> +	  Mediatek MT6360 PMIC.
> +	  Independent current sources supply for each flash LED support torch and strobe mode.
> +	  Includes Low-VF and short protection.
> +

80 columns. And perhaps user does not need to know about protections... and actually
about independend sources, either.

"Enable this for RGB LED and flash LED support on..."?

> +static int mt6360_torch_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
> +{
> +	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, flash.led_cdev);
> +	struct mt6360_priv *priv = led->priv;
> +	u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
> +	u32 val = (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> +	u32 prev = priv->fled_torch_used, curr;
> +	int ret;
> +
> +	dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
> +	if (priv->fled_strobe_used) {
> +		dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
> +		return -EINVAL;
> +	}

So... how does its userland interface look like?

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
