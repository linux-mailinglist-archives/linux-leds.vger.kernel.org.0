Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E50D916452F
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2020 14:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgBSNVT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Feb 2020 08:21:19 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35166 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbgBSNVT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Feb 2020 08:21:19 -0500
Received: by mail-lf1-f67.google.com with SMTP id l16so98261lfg.2;
        Wed, 19 Feb 2020 05:21:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5GVqcmlo+Ze6pfKqP5i16Jrt0JMLdDpBwQ9vi/PlEeg=;
        b=M27lm/KTMQ0fg7J/mmggQjaDBoEwyqGj1tuDjuaFYKcdlDGq+JUn85uLI2QMhL5HRH
         hNlV2ly+z/7uEm+g5IGZvbahtz67eA/dwAVqwtw75FGxLrPcQlNagkpzyHCV9mkh3TUF
         tVEbEVtUK0j7LOmPTwldC/sLyrvmHfeh9MN+sh6sF47wT4ppSxrMG4y2pAzjQ083liqA
         ooWpxy2xdZPTQScdv0cuUA1v4VhH66Drcdb9G6opbj5p9YQ/G/zoJMguLfpI4tGDoQ2o
         T8ssqprE3hsddX15ipTsrSxuEmxib4jZe2wF2twiczzPToXomKnyTAdaD+Ou3N8B7Wzw
         Dqyw==
X-Gm-Message-State: APjAAAUUXKhRkJ19CZakoVJioFCkUKt6Kgz6JJmctJnrNFcI4h1RPeqY
        wB3156IvjrdBtE3EqZbrni4=
X-Google-Smtp-Source: APXvYqzMP/dcpH1MwXgMkv5HErMhi8EGBk0GdncmdICFJVTAwJFvaWBAnf+M09wQAHeFF0WiCyVKXw==
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr13400965lfl.64.1582118477427;
        Wed, 19 Feb 2020 05:21:17 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id u19sm1270480lfu.68.2020.02.19.05.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 05:21:16 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j4PHt-0002CQ-RU; Wed, 19 Feb 2020 14:21:13 +0100
Date:   Wed, 19 Feb 2020 14:21:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 2/4] tty: rename tty_kopen() and add new function
 tty_kopen_shared()
Message-ID: <20200219132113.GD32540@localhost>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-3-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200213091600.554-3-uwe@kleine-koenig.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Feb 13, 2020 at 10:15:58AM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Introduce a new function tty_kopen_shared() that yields a struct
> tty_struct. The semantic difference to tty_kopen() is that the tty is
> expected to be used already. So rename tty_kopen() to
> tty_kopen_exclusive() for clearness, adapt the single user and put the
> common code in a new static helper function.
> 
> tty_kopen_shared is to be used to implement an LED trigger for tty
> devices in one of the next patches.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
 
> -/**
> - *	tty_kopen	-	open a tty device for kernel
> - *	@device: dev_t of device to open
> - *
> - *	Opens tty exclusively for kernel. Performs the driver lookup,
> - *	makes sure it's not already opened and performs the first-time
> - *	tty initialization.
> - *
> - *	Returns the locked initialized &tty_struct
> - *
> - *	Claims the global tty_mutex to serialize:
> - *	  - concurrent first-time tty initialization
> - *	  - concurrent tty driver removal w/ lookup
> - *	  - concurrent tty removal from driver table
> - */
> -struct tty_struct *tty_kopen(dev_t device)
> +static struct tty_struct *tty_kopen(dev_t device, int shared)
>  {
>  	struct tty_struct *tty;
>  	struct tty_driver *driver;
> @@ -1905,7 +1890,7 @@ struct tty_struct *tty_kopen(dev_t device)
>  
>  	/* check whether we're reopening an existing tty */
>  	tty = tty_driver_lookup_tty(driver, NULL, index);
> -	if (IS_ERR(tty))
> +	if (IS_ERR(tty) || shared)

So here you skip initialisation and return NULL if the tty isn't already
in use (e.g. is open) when shared is set.

>  		goto out;
>  
>  	if (tty) {
> @@ -1923,7 +1908,44 @@ struct tty_struct *tty_kopen(dev_t device)
>  	tty_driver_kref_put(driver);
>  	return tty;
>  }
> -EXPORT_SYMBOL_GPL(tty_kopen);
> +
> +/**
> + *	tty_kopen_exclusive	-	open a tty device for kernel
> + *	@device: dev_t of device to open
> + *
> + *	Opens tty exclusively for kernel. Performs the driver lookup,
> + *	makes sure it's not already opened and performs the first-time
> + *	tty initialization.
> + *
> + *	Returns the locked initialized &tty_struct
> + *
> + *	Claims the global tty_mutex to serialize:
> + *	  - concurrent first-time tty initialization
> + *	  - concurrent tty driver removal w/ lookup
> + *	  - concurrent tty removal from driver table
> + */
> +struct tty_struct *tty_kopen_exclusive(dev_t device)
> +{
> +	return tty_kopen(device, 0);
> +}
> +EXPORT_SYMBOL_GPL(tty_kopen_exclusive);
> +
> +/**
> + *	tty_kopen_shared	-	open a tty device for shared in-kernel use
> + *	@device: dev_t of device to open
> + *
> + *	Opens an already existing tty
> + *	rnel. Performs the driver lookup,

"rnel"?

> + *	makes sure it's not already opened and performs the first-time
> + *	tty initialization.

Yet, you claim to do initialisation here, which isn't the case.

> + *
> + *	Locking is identical to tty_kopen() above.
> + */
> +struct tty_struct *tty_kopen_shared(dev_t device)
> +{
> +	return tty_kopen(device, 1);
> +}
> +EXPORT_SYMBOL_GPL(tty_kopen_shared);

This "kopen" naming is unfortunate as the tty isn't really opened by
either of these functions, but that's not something you introduced.

Johan
