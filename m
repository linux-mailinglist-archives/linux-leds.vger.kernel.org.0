Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 052FD11784
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2019 12:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfEBKqO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 May 2019 06:46:14 -0400
Received: from onstation.org ([52.200.56.107]:36188 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbfEBKqO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 2 May 2019 06:46:14 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 639953E87D;
        Thu,  2 May 2019 10:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1556793973;
        bh=e/FA4mHpFx3zNjfCGCOW0Rn4GpjN//bg+m0jAFrBGDc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JhXrdguNJ/0q/2s9ujlUFEtJx12kNG8hc7FpdaQv7fxd19pUfo3AS6nJ+EEdsrEaj
         V0lE1/GabHGNcJ9RwjWkA0vnwVJ8xFY/uQNfVXvisy8LTuMt8HHwWABc1PEVn4wPFS
         3NxcCY0I5GBAEelvUjtti26CIFWcEi3p7DSUbRx0=
Date:   Thu, 2 May 2019 06:46:12 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com, robh+dt@kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dmurphy@ti.com, jonathan@marek.ca,
        Daniel Thompson <daniel@redfelineninja.org.uk>
Subject: Re: [PATCH v6 3/3] backlight: lm3630a: add firmware node support
Message-ID: <20190502104612.GB24563@basecamp>
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-4-masneyb@onstation.org>
 <3d8a2f9e-bd41-7713-5ad4-05a0d71e8fb1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d8a2f9e-bd41-7713-5ad4-05a0d71e8fb1@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, May 02, 2019 at 11:19:50AM +0100, Daniel Thompson wrote:
> On 24/04/2019 10:25, Brian Masney wrote:
> > Add fwnode support to the lm3630a driver and optionally allow
> > configuring the label, default brightness level, and maximum brightness
> > level. The two outputs can be controlled by bank A and B independently
> > or bank A can control both outputs.
> > 
> > If the platform data was not configured, then the driver defaults to
> > enabling both banks. This patch changes the default value to disable
> > both banks before parsing the firmware node so that just a single bank
> > can be enabled if desired. There are no in-tree users of this driver.
> 
> In that case given I'd certainly entertain patches that move the config
> structures out of include/linux/platform_data and say the driver requires a
> proper entry in the hardware description! Not a requirement though.

OK, I'll submit patches for that after this series is merged.

Brian
