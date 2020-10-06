Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604F72854DB
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 01:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgJFXPb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 19:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJFXPb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 19:15:31 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B18C061755
        for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2020 16:15:30 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 8DBAB140A94;
        Wed,  7 Oct 2020 01:15:27 +0200 (CEST)
Date:   Wed, 7 Oct 2020 01:15:27 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201007011527.420e03b2@nic.cz>
In-Reply-To: <20201006165850.17790-1-vadimp@nvidia.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue,  6 Oct 2020 19:58:50 +0300
Vadim Pasternak <vadimp@nvidia.com> wrote:

> It could be more than one instance of LED with the same name in the
> modular systems. For example, "status" or "uid" LED can be located
> on chassis and on each line card of modular system.
> In order to avoid conflicts with duplicated names, append platform
> device Id, which is unquie, to LED name after driver name.
> Thus, for example, "status" LED on chassis is to be called, like it is
> called now on non modular systems, on which platform device Id is not
> specified: "mlxreg:status:green". While for the line cards LEDs it will
> be called like: "mlxreg48:status:green", "mlxreg66:status:green",
> etcetera.

:( what types of modules are these? Are they hotpluggable network
adapter or something like that? What should I imagine for
example mlxreg48 device to be?

Btw it would be nice if mlx-platform was converted to Device Tree API
instead of registering each device in a system by hand.

Marek

> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/leds/leds-mlxreg.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
> index 82aea1cd0c12..53130a8656b1 100644
> --- a/drivers/leds/leds-mlxreg.c
> +++ b/drivers/leds/leds-mlxreg.c
> @@ -228,8 +228,12 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
>  			brightness = LED_OFF;
>  			led_data->base_color = MLXREG_LED_GREEN_SOLID;
>  		}
> -		snprintf(led_data->led_cdev_name, sizeof(led_data->led_cdev_name),
> -			 "mlxreg:%s", data->label);
> +		if (priv->pdev->id > 0)
> +			sprintf(led_data->led_cdev_name, "%s%d:%s", "mlxreg",
> +				priv->pdev->id, data->label);
> +		else
> +			sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
> +				data->label);
>  		led_cdev->name = led_data->led_cdev_name;
>  		led_cdev->brightness = brightness;
>  		led_cdev->max_brightness = LED_ON;

