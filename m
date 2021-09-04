Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBCD4009EB
	for <lists+linux-leds@lfdr.de>; Sat,  4 Sep 2021 07:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhIDF63 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Sep 2021 01:58:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:57646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229741AbhIDF62 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 4 Sep 2021 01:58:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18CC860F5D;
        Sat,  4 Sep 2021 05:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630735047;
        bh=LDJlCt5fEI2tEOGYiKsU6TKOs2bYyPizl6NFtxceP2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=16T44GG+u4jfDK7bBMjeG+GaMZVwsIRF0XTyHgEhpkKO/srhdn6wnKlBUmKwItR4q
         nP+7Y/ph/m5OLUNDYIbEodi5VjOJsnxx5L7gJZCW4PQ9I+RdrKKelLrsgErsx2gbSi
         z0CCbGuTZh7q2eVZTKvl1uVSuy8MFHWQd0GT/ho8=
Date:   Sat, 4 Sep 2021 07:57:20 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux@vger.kernel.org,
        kabel@kernel.org
Subject: Re: [PATCH 17/18] ledtrig-blkdev: Add mode (read/write/rw) sysfs
 attributue
Message-ID: <YTMKwJUyKX3bxDuK@kroah.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-18-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903204548.2745354-18-arequipeno@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 03, 2021 at 03:45:47PM -0500, Ian Pilcher wrote:
> +static ssize_t blkdev_mode_store(struct device *const dev,
> +				 struct device_attribute *const attr,
> +				 const char *const buf, const size_t count)
> +{
> +	struct ledtrig_blkdev_led *const led = led_trigger_get_drvdata(dev);
> +	const char *const mode_name = blkdev_skip_space(buf);
> +	const char *const endp = blkdev_find_space(mode_name);
> +	const ptrdiff_t name_len = endp - mode_name;	/* always >= 0 */
> +	enum ledtrig_blkdev_mode mode;
> +
> +	if (name_len == 0) {
> +		pr_info("blkdev LED: empty mode\n");
> +		return -EINVAL;
> +	}
> +
> +	for (mode = LEDTRIG_BLKDEV_MODE_RO;
> +				mode <= LEDTRIG_BLKDEV_MODE_RW; ++mode) {
> +
> +		if (ledtrig_blkdev_streq(blkdev_modes[mode].name,
> +						mode_name, name_len)) {
> +			WRITE_ONCE(led->mode, mode);
> +			return count;
> +		}
> +	}
> +
> +	pr_info("blkdev LED: invalid mode (%.*s)\n", (int)name_len, mode_name);

Please do not use pr_* calls in a driver when you have a struct device.

Also, you are now allowing any user to spam the kernel log, this shold
be a dev_dbg() call at the most, if it is even needed at all.  Same for
the other pr_info() call in this function, please remove them all.

thanks,

greg k-h
