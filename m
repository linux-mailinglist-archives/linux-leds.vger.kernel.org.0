Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1CC0A4AD3
	for <lists+linux-leds@lfdr.de>; Sun,  1 Sep 2019 19:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728968AbfIARX0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 1 Sep 2019 13:23:26 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38900 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIARXZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 Sep 2019 13:23:25 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 642C880B29; Sun,  1 Sep 2019 19:23:10 +0200 (CEST)
Date:   Sun, 1 Sep 2019 19:23:23 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: remove PAGE_SIZE limit of
 /sys/class/leds/<led>/trigger
Message-ID: <20190901172323.GB1005@bug>
References: <1567090164-6819-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567090164-6819-1-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> However, the size of this file is limited to PAGE_SIZE because of the
> limitation for sysfs attribute.
> 
> Enabling LED CPU trigger on systems with thousands of CPUs easily hits
> PAGE_SIZE limit, and makes it impossible to see all available LED triggers
> and which trigger is currently activated.
> 
> This converts /sys/class/leds/<led>/trigger to bin attribute and removes
> the PAGE_SIZE limitation.
> 
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Nothing obviously wrong from a quick look...

Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks a lot for doing this!

I believe we should cc Greg here.

BTW if you care about cpuled trigger... it would be cool to turn it into one trigger and pass
a cpu number as a parameter. It is good to see this limit fixed, but real solution is to
register one trigger per driver.

Best regards,
										Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
