Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC55D27949C
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 01:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgIYXR7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 19:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgIYXR7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 19:17:59 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73DDC0613CE;
        Fri, 25 Sep 2020 16:17:58 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 52F07140079;
        Sat, 26 Sep 2020 01:17:56 +0200 (CEST)
Date:   Sat, 26 Sep 2020 01:17:55 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Tobias Jordan <kernel@cdqe.de>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] leds: tlc591xx: fix leak of device node iterator
Message-ID: <20200926011755.01c5c645@nic.cz>
In-Reply-To: <20200925231011.GA2450@agrajag.zerfleddert.de>
References: <20200925231011.GA2450@agrajag.zerfleddert.de>
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

On Sat, 26 Sep 2020 01:10:11 +0200
Tobias Jordan <kernel@cdqe.de> wrote:

> In one of the error paths of the for_each_child_of_node loop in
> tlc591xx_probe, add missing call to of_node_put.
> 
> Fixes: 1ab4531ad132 ("leds: tlc591xx: simplify driver by using the
> managed led API")
> 
> Signed-off-by: Tobias Jordan <kernel@cdqe.de>
> ---
>  drivers/leds/leds-tlc591xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
> index 0929f1275814..a8cc49752cd5 100644
> --- a/drivers/leds/leds-tlc591xx.c
> +++ b/drivers/leds/leds-tlc591xx.c
> @@ -214,6 +214,7 @@ tlc591xx_probe(struct i2c_client *client,
>  		err = devm_led_classdev_register_ext(dev, &led->ldev,
>  						     &init_data);
>  		if (err < 0) {
> +			of_node_put(child);
>  			if (err != -EPROBE_DEFER)
>  				dev_err(dev, "couldn't register LED %s\n",
>  					led->ldev.name);

This won't apply on pavel's for-next tree, there is no check for
EPROBE_DEFER, see
https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/tree/drivers/leds/leds-tlc591xx.c?h=for-next
