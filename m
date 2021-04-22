Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A250D367BB1
	for <lists+linux-leds@lfdr.de>; Thu, 22 Apr 2021 10:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhDVIGH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Apr 2021 04:06:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:43768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229655AbhDVIGH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 22 Apr 2021 04:06:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B6996144D;
        Thu, 22 Apr 2021 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619078731;
        bh=PODUqFe/MkmI//guL+vehGy2dzp1+CHR2OIJwFQUt60=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tRD33ycChAfFDXj+qLVp0Ps7dxkPS64X12Sxudba8Jy8Lx74JL9Mx3/5CUeKI7z5K
         OEkH2dVrS1EeQLgy9zvE9QrI65jK7h8fEZXK+Psq/WLI6UkoI3dyf56d359qkQhLjx
         xXhHeusa8Z7ks1nqh3mzEItQ+tUC3GtoEtOcNSEE=
Date:   Thu, 22 Apr 2021 10:05:28 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Juergen Borleis <jbe@pengutronix.de>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] leds: trigger/tty: feature data direction
Message-ID: <YIEuSPS11fkSwQ7N@kroah.com>
References: <20210422074702.8831-1-jbe@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422074702.8831-1-jbe@pengutronix.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Apr 22, 2021 at 09:47:02AM +0200, Juergen Borleis wrote:
> The current implementation just signals a visible feedback on all kind of
> activity on the corresponding TTY. But sometimes it is useful to see what
> kind of activity just happens. This change adds the capability to filter
> the direction of TTY's data flow. It enables a user to forward both
> directions to separate LEDs for tx and rx on demand. Default behavior is
> still both directions.
> 
> Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
> ---
>  Documentation/leds/ledtrig-tty.rst | 47 ++++++++++++++++++++++++++
>  drivers/leds/trigger/ledtrig-tty.c | 53 +++++++++++++++++++++++++++++-
>  2 files changed, 99 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/leds/ledtrig-tty.rst
> 
> diff --git a/Documentation/leds/ledtrig-tty.rst b/Documentation/leds/ledtrig-tty.rst
> new file mode 100644
> index 00000000..6fc765c
> --- /dev/null
> +++ b/Documentation/leds/ledtrig-tty.rst
> @@ -0,0 +1,47 @@
> +===============
> +LED TTY Trigger
> +===============
> +
> +This LED trigger flashes the LED whenever some data flows are happen on the
> +corresponding TTY device. The TTY device can be freely selected, as well as the
> +data flow direction.
> +
> +TTY trigger can be enabled and disabled from user space on led class devices,
> +that support this trigger as shown below::
> +
> +	echo tty > trigger
> +	echo none > trigger
> +
> +This trigger exports two properties, 'ttyname' and 'dirfilter'. When the
> +tty trigger is activated both properties are set to default values, which means
> +no related TTY device yet and the LED would flash on both directions.
> +
> +Selecting a corresponding trigger TTY::
> +
> +	echo ttyS0 > ttyname
> +
> +This LED will now flash on data flow in both directions of 'ttyS0'.
> +
> +Selecting a direction::
> +
> +	echo in > dirfilter
> +	echo out > dirfilter
> +	echo inout > dirfilter
> +
> +This selection will flash the LED on data flow in the selected direction.
> +
> +Example
> +=======
> +
> +With the 'dirfilter' property one can use two LEDs to give a user a separate
> +visual feedback about data flow.
> +
> +Flash on data send on one LED::
> +
> +	echo ttyS0 > ttyname
> +	echo out > dirfilter
> +
> +Flash on data receive on a second LED::
> +
> +	echo ttyS0 > ttyname
> +	echo in > dirfilter
> diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
> index f62db7e..d3bd231 100644
> --- a/drivers/leds/trigger/ledtrig-tty.c
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -14,6 +14,8 @@ struct ledtrig_tty_data {
>  	const char *ttyname;
>  	struct tty_struct *tty;
>  	int rx, tx;
> +	unsigned indirection:1;
> +	unsigned outdirection:1;
>  };
>  
>  static void ledtrig_tty_restart(struct ledtrig_tty_data *trigger_data)
> @@ -76,6 +78,47 @@ static ssize_t ttyname_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(ttyname);
>  
> +static ssize_t dirfilter_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> +
> +	if (trigger_data->indirection)
> +		return (ssize_t)sprintf(buf, "in\n");
> +	if (trigger_data->outdirection)
> +		return (ssize_t)sprintf(buf, "out\n");
> +	return (ssize_t)sprintf(buf, "inout\n");

sysfs_emit() please.

And you are adding new sysfs files, that requires an update to
Documentation/ABI/ please do so.

But why are you adding random new sysfs values to a class device?  That
feels really wrong.

thanks,

greg k-h
