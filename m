Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601A21F4E14
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2020 08:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgFJGWQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Jun 2020 02:22:16 -0400
Received: from mail.thorsis.com ([92.198.35.195]:58442 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbgFJGWQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 10 Jun 2020 02:22:16 -0400
X-Greylist: delayed 336 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Jun 2020 02:22:15 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id C56A73B8B;
        Wed, 10 Jun 2020 08:16:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id x-KNHOWuj28Y; Wed, 10 Jun 2020 08:16:38 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 70610F62; Wed, 10 Jun 2020 08:16:37 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-leds@vger.kernel.org
Cc:     Flavio Suligoi <f.suligoi@asem.it>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] leds: fix spelling mistake
Date:   Wed, 10 Jun 2020 08:16:31 +0200
Message-ID: <7016474.BTq5bZ2CBy@ada>
In-Reply-To: <20200609154929.30248-1-f.suligoi@asem.it>
References: <20200609154929.30248-1-f.suligoi@asem.it>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

That one made me laugh. :-)

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Am Dienstag, 9. Juni 2020, 17:49:29 CEST schrieb Flavio Suligoi:
> Fix typo: "Tigger" --> "Trigger"
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  drivers/leds/led-triggers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 79e30d2cb7a5..0836bf7631ea 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -358,7 +358,7 @@ int devm_led_trigger_register(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_led_trigger_register);
> 
> -/* Simple LED Tigger Interface */
> +/* Simple LED Trigger Interface */
> 
>  void led_trigger_event(struct led_trigger *trig,
>  			enum led_brightness brightness)




