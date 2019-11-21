Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC94105920
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2019 19:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfKUSNz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Nov 2019 13:13:55 -0500
Received: from muru.com ([72.249.23.125]:43184 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726279AbfKUSNz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 21 Nov 2019 13:13:55 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1541880DB;
        Thu, 21 Nov 2019 18:14:30 +0000 (UTC)
Date:   Thu, 21 Nov 2019 10:13:50 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, sre@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v10 6/6] backlight: add led-backlight driver
Message-ID: <20191121181350.GN43123@atomide.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-7-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009085127.22843-7-jjhiblot@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

* Jean-Jacques Hiblot <jjhiblot@ti.com> [700101 00:00]:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> This patch adds a led-backlight driver (led_bl), which is similar to
> pwm_bl except the driver uses a LED class driver to adjust the
> brightness in the HW. Multiple LEDs can be used for a single backlight.
...

> +	ret = of_property_read_u32(node, "default-brightness", &value);
> +	if (!ret && value <= priv->max_brightness)
> +		priv->default_brightness = value;
> +	else if (!ret  && value > priv->max_brightness)
> +		dev_warn(dev, "Invalid default brightness. Ignoring it\n");

Hmm so just wondering.. Are we using "default-brightness" instead of the
usual "default-brightness-level" here?

Please Cc me on the next patchset too :)

Regards,

Tony
