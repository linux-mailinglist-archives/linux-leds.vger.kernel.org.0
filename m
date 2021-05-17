Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9343826BA
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 10:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbhEQIVV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 04:21:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:54096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235235AbhEQIVU (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 17 May 2021 04:21:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F6BD60C3D;
        Mon, 17 May 2021 08:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621239604;
        bh=jQEQ7PpbzLvBN7FZBkkzLqlizTBIfqJ/Z60sV9hQdlI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RaGuDfWGUMSDbEUQvxhJL0zEuVPFpjcqDWMtGFn4+pvOgk2azBgCWwfS3Hxhp/+UG
         g51WZN3430KZEO+N9c5rKUZkpeLv4J4thomaAEu/IkQEyIgUSiGVhAO6Bcc3wQbC9K
         SxtsLnOV87xr9eVUtW8Fz1IXAhdbGiENaDSnDOOQ=
Date:   Mon, 17 May 2021 10:20:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/17] staging: add support for NUC WMI LEDs
Message-ID: <YKInMfIXegTUiNdB@kroah.com>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
 <7cec257fcc6e5789e5620495674e442a727a766f.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cec257fcc6e5789e5620495674e442a727a766f.1621161037.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, May 16, 2021 at 12:53:29PM +0200, Mauro Carvalho Chehab wrote:
> Some Intel Next Unit of Computing (NUC) machines have
> software-configured LEDs that can be used to display a
> variety of events:
> 
> 	- Power State
> 	- HDD Activity
> 	- Ethernet
> 	- WiFi
> 	- Power Limit

<snip>

One nit:

> +static void nuc_wmi_remove(struct wmi_device *wdev)
> +{
> +	struct device *dev = &wdev->dev;
> +
> +	dev_info(dev, "NUC WMI driver removed.\n");
> +}

Drivers, when working properly, should be quiet.  No need for noisy
stuff like this, it just slows down booting/loading for everyone.

thanks,

greg k-h
