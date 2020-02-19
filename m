Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91A6916424D
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2020 11:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgBSKkP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Feb 2020 05:40:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:51188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbgBSKkP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 Feb 2020 05:40:15 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A68B321D56;
        Wed, 19 Feb 2020 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582108815;
        bh=8JYFzGZHQl9Mlj4BlcdpdXsjdg+HCV5duko0Ww+/3ts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D+fmuPcnBwAiKMYnQrNvzuGYOjb2KTjyX5HfTG0lNs3In6g0cemEDq808Ew9cEW4k
         ByqighL55iGXWuJat2cl6WrbwVQJ4wOiXP5/u8Ea8AeB8aaWFB+0M3WKQGb9X8jAcN
         TQS56FeVzpSYqk586vJhfvbluu0CEb7qtB2yhsas=
Date:   Wed, 19 Feb 2020 11:40:12 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 0/4] leds: trigger: implement a tty trigger
Message-ID: <20200219104012.GA2814125@kroah.com>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200213091600.554-1-uwe@kleine-koenig.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Feb 13, 2020 at 10:15:56AM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Hello,
> 
> This is v6 of my quest to introduce ledtriggers for UARTs. The previous
> series is available at
> 
> 	http://lore.kernel.org/r/20191219093947.15502-1-u.kleine-koenig@pengutronix.de
> 
> The changes compared to that are that parsing of the dev parameter is
> more strict and that I set brightness directly from the kworker instead
> of using led_blink_set_oneshot which makes use of another kworker. (Both
> requested by Pavel Machek.)
> 
> For the former I introduced a new helper kstrtodev_t() in the spirit of
> kstrtoul() to implement the stricter parsing (instead of the lax one
> using plain sscanf() in v5).

Looks good to me, Pavel, any objection to me merging this through the
tty tree?

thanks,

greg k-h
