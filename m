Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E5A5F8AA
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2019 14:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfGDM6t convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Thu, 4 Jul 2019 08:58:49 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:37235 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfGDM6t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jul 2019 08:58:49 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id A70C28068B; Thu,  4 Jul 2019 14:58:36 +0200 (CEST)
Date:   Thu, 4 Jul 2019 14:58:37 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] leds: max77650: add MODULE_ALIAS()
Message-ID: <20190704125837.cdseto3p6ddfsgh6@devuan>
References: <20190703084738.9501-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20190703084738.9501-1-brgl@bgdev.pl>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Define a MODULE_ALIAS() in the LED sub-driver for max77650 so that
> the appropriate module gets loaded together with the core mfd driver.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

ACK.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
