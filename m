Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E69BC3940AB
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbhE1KMW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:12:22 -0400
Received: from mail.thorsis.com ([92.198.35.195]:49155 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235672AbhE1KMV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 06:12:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 578CBF61;
        Fri, 28 May 2021 12:10:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4YyQp2lCo78k; Fri, 28 May 2021 12:10:46 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 2637FE5C; Fri, 28 May 2021 12:10:45 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
        *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: ucw.cz]
        * -0.0 NO_RECEIVED Informational: message has no Received headers
Date:   Fri, 28 May 2021 12:10:36 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        John Lenz <lenz@cs.wisc.edu>,
        Richard Purdie <rpurdie@openedhand.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 03/15] leds: led-class: Fix incorrectly documented param
 'dev'
Message-ID: <YLDBnIx/4L/O0oa0@ada.ifak-system.com>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        John Lenz <lenz@cs.wisc.edu>,
        Richard Purdie <rpurdie@openedhand.com>, linux-leds@vger.kernel.org
References: <20210528090629.1800173-1-lee.jones@linaro.org>
 <20210528090629.1800173-4-lee.jones@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528090629.1800173-4-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

Am Fri, May 28, 2021 at 10:06:17AM +0100 schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/leds/led-class.c:521: warning: Function parameter or member 'dev' not described in 'devm_led_classdev_unregister'
>  drivers/leds/led-class.c:521: warning: Excess function parameter 'parent' description in 'devm_led_classdev_unregister'
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: John Lenz <lenz@cs.wisc.edu>
> Cc: Richard Purdie <rpurdie@openedhand.com>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/leds/led-class.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 2e495ff678562..16271a1de12a7 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -513,7 +513,7 @@ static int devm_led_classdev_match(struct device *dev, void *res, void *data)
>  
>  /**
>   * devm_led_classdev_unregister() - resource managed led_classdev_unregister()
> - * @parent: The device to unregister.
> + * @dev: The device to unregister.
>   * @led_cdev: the led_classdev structure for this device.
>   */
>  void devm_led_classdev_unregister(struct device *dev,

Fixes: ca1bb4ee4c3a ("leds: Introduce devres helper for led_classdev_register")
Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

