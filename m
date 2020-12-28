Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18EB2E41A0
	for <lists+linux-leds@lfdr.de>; Mon, 28 Dec 2020 16:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440481AbgL1PJu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Dec 2020 10:09:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:57166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439699AbgL1PJt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 28 Dec 2020 10:09:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D25AC207A1;
        Mon, 28 Dec 2020 15:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609168148;
        bh=dzIDaoypKpUdd8dmDPRZs20tOLgmFTxJg1QGaBFWDBI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1tt9PZ/JEgP2MKJeuV8fSeeJTUzTloIF8sqy5YoCBvzTc+PHGDgd8wLdeeebedQrr
         /LvrBjscZ8Di40qDSb+ITwif3/ni0U+z3mRejeywakVAEiHS5N6FtNteYBHuUKEkBT
         +6+Wny73rjTxAg+VKuIuddV8TTGnI+9QyMKgP3HY=
Date:   Mon, 28 Dec 2020 16:10:30 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, Johan Hovold <johan@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v10 0/3] leds: trigger: implement a tty trigger
Message-ID: <X+n1Zt4IIuW9A8CF@kroah.com>
References: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Dec 18, 2020 at 11:42:43AM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> Hello,
> 
> here comes v10 of this series. Changes compared to v9 sent with
> Message-Id: 20201018204022.910815-1-u.kleine-koenig@pengutronix.de in
> October:

First 2 patches now applied to my tree.

If I get an ack from the LED maintainer(s), I'll be glad to also queue
up the third one too.

thanks,

greg k-h
