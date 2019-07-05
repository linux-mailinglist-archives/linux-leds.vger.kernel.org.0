Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EADD60437
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2019 12:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbfGEKMC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Jul 2019 06:12:02 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47208 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfGEKMB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Jul 2019 06:12:01 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 9E1CA80601; Fri,  5 Jul 2019 12:11:48 +0200 (CEST)
Date:   Fri, 5 Jul 2019 12:11:51 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] devicetree: Add led-backlight binding
Message-ID: <20190705101151.kmyvccbjitfqe4fv@devuan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701151423.30768-5-jjhiblot@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> Add DT binding for led-backlight.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Cc: devicetree@vger.kernel.org
> ---

> +Required properties:
> +  - compatible: "led-backlight"
> +  - brightness-levels: Array of distinct LED brightness levels. These
> +      are in the range from 0 to 255, passed to the LED class driver.

These days, we support more (or less) than 256 brightness levels for LED.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
