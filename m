Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F6260441
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2019 12:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfGEKOm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Jul 2019 06:14:42 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47303 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727225AbfGEKOm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Jul 2019 06:14:42 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id BECCC8022F; Fri,  5 Jul 2019 12:14:29 +0200 (CEST)
Date:   Fri, 5 Jul 2019 12:14:34 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH 0/4] Add a generic driver for LED-based backlight
Message-ID: <20190705101434.fw5rpctnqt6dwg6e@devuan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon 2019-07-01 17:14:19, Jean-Jacques Hiblot wrote:
> This series aims to add a led-backlight driver, similar to pwm-backlight,
> but using a LED class device underneath.
> 
> A few years ago (2015), Tomi Valkeinen posted a series implementing a
> backlight driver on top of a LED device:
> https://patchwork.kernel.org/patch/7293991/
> https://patchwork.kernel.org/patch/7294001/
> https://patchwork.kernel.org/patch/7293981/
> 
> The discussion stopped because Tomi lacked the time to work on it.
> 
> This series takes it from there and implements the binding that was
> discussed in https://patchwork.kernel.org/patch/7293991/. In this new
> binding the backlight device is a child of the LED controller instead of
> being another platform device that uses a phandle to reference a LED.

Other option would be to have backlight trigger. What are
advantages/disadvantages relative to that?
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
