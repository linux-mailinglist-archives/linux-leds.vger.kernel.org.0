Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF041226AA
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 09:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfLQI2m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 03:28:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:37366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbfLQI2m (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Dec 2019 03:28:42 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BDD7E206EC;
        Tue, 17 Dec 2019 08:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576571320;
        bh=ua3ZL35yDN9Bwz5Dm31oT+w+MDPfWKWLcXp2R/V6fFs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QNbuSTCODfWHrBqcp6m5REDqvY6gV5hI/OTQUtbWWmNJ0URgRlCQtJ7jgJwY3jvEr
         Bj1lu6mV2CMpircRx5Q7Nug6Nl6AqYjtwKg+oEXzhG7IXey93nnezXsa6WGXk0EJkF
         8XrPCToCpfY6LD+p7J43zZzp9Ljdn8t2XoeVHoCg=
Date:   Tue, 17 Dec 2019 09:28:38 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 2/3] tty: new helper function tty_get_icount()
Message-ID: <20191217082838.GB2672708@kroah.com>
References: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
 <20191217081718.23807-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217081718.23807-3-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 09:17:17AM +0100, Uwe Kleine-König wrote:
> For a given struct tty_struct this yields the corresponding statistics
> about sent and received characters (and some more)

Why?

> 
> Use the function to simplify tty_tiocgicount().
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/tty/tty_io.c | 20 ++++++++++++++++----
>  include/linux/tty.h  |  2 ++
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index 584025117cd3..df3942eb3468 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -2497,15 +2497,27 @@ static int tty_tiocmset(struct tty_struct *tty, unsigned int cmd,
>  	return tty->ops->tiocmset(tty, set, clear);
>  }
>  
> +int tty_get_icount(struct tty_struct *tty,
> +		   struct serial_icounter_struct *icount)

kerneldoc?

> +{
> +	memset(icount, 0, sizeof(*icount));
> +
> +	if (tty->ops->get_icount)
> +		return tty->ops->get_icount(tty, icount);
> +	else
> +		return -EINVAL;
> +}
> +EXPORT_SYMBOL(tty_get_icount);

EXPORT_SYMBOL_GPL() please.

thanks,

greg k-h
