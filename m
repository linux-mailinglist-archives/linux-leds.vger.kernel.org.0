Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD4341226A7
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 09:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbfLQI1g (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 03:27:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:37032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbfLQI1g (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Dec 2019 03:27:36 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE827206EC;
        Tue, 17 Dec 2019 08:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576571255;
        bh=J4s2ewuYtJ4zzBG2WZm8IafXqFIzdyb19gjfIBR6qFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iTJBmn0mlqnWNIyyfp8P0iIY5R3J3cZpr3kVsoRLzF8l72T00Y9xbj1kLb7DPHdPy
         8/ANAfmgnCm7m2vnWawKtx/x3AiQd4KmithTlN4cl2L/w6PyueBTGiuHqf8hPQCiBE
         Wh8R1aRcQZIg7gKOCCjDHkxGPzhBXD2nDizx9hxs=
Date:   Tue, 17 Dec 2019 09:27:33 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] tty: new helper function tty_kopen_shared
Message-ID: <20191217082733.GA2672708@kroah.com>
References: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
 <20191217081718.23807-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217081718.23807-2-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 09:17:16AM +0100, Uwe Kleine-König wrote:
> This function gives a struct tty_struct for a given device number.

That says _what_ this does, but not why :)

> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/tty/tty_io.c | 27 +++++++++++++++++++++++++++
>  include/linux/tty.h  |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index d9f54c7d94f2..584025117cd3 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -1925,6 +1925,33 @@ struct tty_struct *tty_kopen(dev_t device)
>  }
>  EXPORT_SYMBOL_GPL(tty_kopen);
>  
> +/*
> + * Caller gets a reference on (non-error) ttys, that must be disposed using
> + * tty_kref_put().
> + */

It's a global function, can you please use kerneldoc?
And please describe it as well as tty_kopen() is.

> +struct tty_struct *tty_kopen_shared(dev_t device)
> +{
> +	struct tty_struct *tty;
> +	struct tty_driver *driver;
> +	int index = -1;
> +
> +	mutex_lock(&tty_mutex);
> +	driver = tty_lookup_driver(device, NULL, &index);
> +	if (IS_ERR(driver)) {
> +		tty = ERR_CAST(driver);
> +		goto err_lookup_driver;
> +	}
> +
> +	tty = tty_driver_lookup_tty(driver, NULL, index);

No error check?

> +
> +	tty_driver_kref_put(driver);
> +err_lookup_driver:
> +
> +	mutex_unlock(&tty_mutex);
> +	return tty;

Can't you share a lot of this code with tty_kopen()?  It feels odd to
duplicatate _almost_ all of it here.

> +}
> +EXPORT_SYMBOL(tty_kopen_shared);

EXPORT_SYMBOL_GPL() please.

thanks,

greg k-h
