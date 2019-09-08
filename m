Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75963ACECF
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 15:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbfIHNHt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 09:07:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:55030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727568AbfIHNHt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Sep 2019 09:07:49 -0400
Received: from localhost (unknown [62.28.240.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C23E218AC;
        Sun,  8 Sep 2019 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567948068;
        bh=cJcWacuGpD9PlZiTdR8FoX6vaAsWzW3r2Kl0j0eqRxU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xWAtzf2kDaiiJFlr85BNUsKFh1drlh7nCxHzJKtp+K+ib2cv9CGRLahQ4QIbI3jr0
         K6LXwkUmHL0gRIwXapJB5eheuOvDb9a1ytkB4XFkoe/V+f4HSBNIF1p5EsrqBp8eUA
         oAJqVe9Kf6zhaj3Ic4XkFt/T1KF/VL2rIAeNx7X4=
Date:   Sun, 8 Sep 2019 14:07:46 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/5] leds: make sure leds_class is initialized before
 triggers are registered
Message-ID: <20190908130746.GA9466@kroah.com>
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
 <1567946472-10075-3-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567946472-10075-3-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 08, 2019 at 09:41:09PM +0900, Akinobu Mita wrote:
> If the led-class and usb-common modules are built into the kernel, the
> usb-common module could be initialized earlier than the led-class module.
> 
> So when the ledtrig_usb_gadget and ledtrig_usb_host LED triggers are
> registered by usb-common module, the leds_class could not be initialized
> yet.
> 
> We are going to populate sub-directories, each representing an LED
> trigger in /sys/class/triggers/, so leds_class needs to be initialized
> before any LED triggers is registered.
> 
> This makes led-class initialize earlier then usb-common by changing
> initcall group.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  drivers/leds/led-class.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 8b5a1d1..7d85181 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -424,7 +424,7 @@ static void __exit leds_exit(void)
>  	class_destroy(leds_class);
>  }
>  
> -subsys_initcall(leds_init);
> +postcore_initcall(leds_init);

This is a case of "whack a mole".

Why not just initialize everything the first time the function is
called?  That way you don't have to mess with any of the link order
stuff and everything will always continue to work if things ever change
in the future?

thanks,

greg k-h
