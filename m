Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06EA1123367
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 18:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfLQRWh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 12:22:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:58514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726887AbfLQRWg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Dec 2019 12:22:36 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6354021D7D;
        Tue, 17 Dec 2019 17:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576603354;
        bh=t5UwOa0UNYexLVRweTPy/VKSCtv4u5Ro3MO/xWEeA7g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WDPhJZwXx83FnbOeB5YLmF1LM6lKMmaL5wZfrBIgdFgdj46W/puuYrHUILMxsRtF6
         UKOStvX4Qfbt0SxbMA2kthrwoIqGtxAumNMYk4WP9+cdnHvgOGUR9MKZA/R0VSqAhd
         LPwNZ5zPi4ECTUq0OseLUgDjRa5ePiaetirFvrZg=
Date:   Tue, 17 Dec 2019 18:22:32 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 0/3] tty/leds: implement a trigger for ttys
Message-ID: <20191217172232.GC3829986@kroah.com>
References: <20191217165816.19324-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217165816.19324-1-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 05:58:13PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> v3 of this series was sent earlier today starting with Message-Id:
> 20191217150736.1479-1-u.kleine-koenig@pengutronix.de.
> 
> v4 only changes patch 3 dropping a few printks, fixing the show callback
> for the dev attribute to match its store function. And I moved
> ledtrig_tty_restart() into the already existing if (tty) {...} block in
> dev_store and dropped the same check from the former function.
> 

All looks good to me, so if the LED developers give their ack, I can
take it in my tty tree.

thanks,

greg k-h
