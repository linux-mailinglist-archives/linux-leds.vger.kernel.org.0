Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE0F91226BA
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 09:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfLQIc6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 03:32:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:38394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbfLQIc6 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Dec 2019 03:32:58 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3ACF820717;
        Tue, 17 Dec 2019 08:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576571577;
        bh=KaMIYYTK97ljJkmoWGyzXxyeIHqCzEem6vx3BF/K95c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CCp/gKW2FM+ds1U0VZ2esuhAB/PBwBNbrZ+YQRpdNJ6yWAS7n4XZucBznhJZhQGNr
         msTA3K4BgEnfrQ9MHTy153ZC+oWX+7pB7KFytATGFmSR2y/QRyAHAZSwDm3L2Pq0MX
         eIC37abYyBJ4WzzNN0lyHE5SfsORdB46njx15lac=
Date:   Tue, 17 Dec 2019 09:32:54 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 0/3] tty/leds: implement a trigger for ttys
Message-ID: <20191217083254.GD2672708@kroah.com>
References: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 09:17:15AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> back in November last year I sent my last approach to implement an led
> trigger for UARTs (Message-Id:
> 20181106213739.29628-1-u.kleine-koenig@pengutronix.de). This was parked
> on my todo list since then somewhere far from the top.
> 
> This is a new approach. Similar to the netdev trigger the tty trigger
> introduced here periodically checks the statistics related to a given
> tty and if that changed the LED is flashed once.
> 
> I had to introduce two functions in the tty layer to be able to get my
> hands on the needed data in the first two patches, the third patch then
> adds the trigger.

I like the idea, seems sane.  Minor code nits on the implementation
though...

thanks,

greg k-h
