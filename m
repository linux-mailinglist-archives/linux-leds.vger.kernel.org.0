Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37099164299
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2020 11:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgBSKwp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Feb 2020 05:52:45 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37409 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbgBSKwp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Feb 2020 05:52:45 -0500
Received: by mail-lf1-f65.google.com with SMTP id b15so17082238lfc.4;
        Wed, 19 Feb 2020 02:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=v3s+ERWW/NblNdTfhgSfXo0YgD0956d1UiWAg5L+DJk=;
        b=MWQMFI/emrPaJ/v3ipgnvdfX7P0hWleGIZhWaE+IeH3JWwzkqX9U8P5jTCKxEmTo6a
         TARKahN7Kj7Ee592SVx8NejND/G5Qao+JGFgd6vfgMXcPezn6hbbN1Ula1gmKch+ofyV
         LDBaJEr8PqKyLi6Y5aSMksae44Sme0Hvu1JRQ+V1smm7b6/R0WvIX5JMf1wNqNvhBFyh
         /L4w8smE1W/VeyvMJ/O/nOTqOBTtSoc8Ks58TW/qCJF9njk2AV5ectw+GGf06KHXkBd8
         ie3uwe43EruDGV+JLGBwSEMn0cPoslhIWfCwA0t4kNfi/jl1qv6GI/xZ2hCZ3ZJvSUqT
         z4uQ==
X-Gm-Message-State: APjAAAUizxfPbmrrWhwlkliI71oIxuTy2nv42sUx+vH0b/iXhdIe20pr
        MtK4Ky5Rk2pOWOZpWPKZWQQ=
X-Google-Smtp-Source: APXvYqw6DAazSuLZGpERtO0Wuuj4fIWppskXwAfH8ZYT4nIGGCIFRs18yczjnxOHJxH6oBPvE3iy5w==
X-Received: by 2002:a19:c014:: with SMTP id q20mr13531882lff.209.1582109563035;
        Wed, 19 Feb 2020 02:52:43 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id w3sm988956ljo.66.2020.02.19.02.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 02:52:42 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j4My7-0000ly-9r; Wed, 19 Feb 2020 11:52:39 +0100
Date:   Wed, 19 Feb 2020 11:52:39 +0100
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
Subject: Re: [PATCH v6 4/4] leds: trigger: implement a tty trigger
Message-ID: <20200219105239.GA32540@localhost>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-5-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200213091600.554-5-uwe@kleine-koenig.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Feb 13, 2020 at 10:16:00AM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Usage is as follows:
> 
> 	myled=ledname
> 	tty=ttyS0
> 
> 	echo tty > /sys/class/leds/$myled/trigger
> 	cat /sys/class/tty/$tty/dev > /sys/class/leds/$myled/dev
> 
> . When this new trigger is active it periodically checks the tty's
> statistics and when it changed since the last check the led is flashed
> once.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

> +static ssize_t dev_store(struct device *dev,
> +			 struct device_attribute *attr, const char *buf,
> +			 size_t size)
> +{
> +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> +	struct tty_struct *tty;
> +	dev_t d;
> +	int ret;
> +
> +	if (size == 0 || (size == 1 && buf[0] == '\n')) {
> +		tty = NULL;
> +	} else {
> +		ret = kstrtodev_t(buf, &d);
> +		if (ret < 0)
> +			return ret;
> +
> +		tty = tty_kopen_shared(d);

I really don't have time to look at this, but having the led-trigger
keep the port open looks fundamentally broken (consider modem-control
signals, power, etc).

Johan
